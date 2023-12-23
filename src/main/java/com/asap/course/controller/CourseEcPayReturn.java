package com.asap.course.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Hashtable;

import javax.activation.DataSource;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.course.entity.MbrCourseVO;
import com.asap.course.service.CourseService;
import com.asap.course.service.CourseService_interface;
import com.asap.course.service.MbrCourseService;
import com.asap.course.service.MbrCourseService_interface;
import com.asap.member.entity.MbrActivVO;
import com.asap.member.entity.MbrNewsVO;
import com.asap.member.entity.MemberVO;
import com.asap.member.service.MbrActivService;
import com.asap.member.service.MbrActivService_interface;
import com.asap.member.service.MbrNewsService;
import com.asap.member.service.MbrNewsService_interface;
import com.asap.member.service.MemberService;
import com.asap.member.service.MemberService_interface;
import com.asap.util.JavaMail;
import com.asap.util.MailFormat;

import ecpay.payment.integration.AllInOne;

@WebServlet("/course/courseEcPayReturn.do")
public class CourseEcPayReturn extends HttpServlet{
	
	public static AllInOne all;
	private MbrCourseService_interface mbrCourseService_interface;
	private CourseService_interface courseService_interface;
	private MbrActivService_interface mbrActivService_interface;
	private MbrNewsService_interface mbrNewsService_interface;
	
	public void init() throws ServletException {
		all = new AllInOne("");
		mbrCourseService_interface = new MbrCourseService();
		courseService_interface = new CourseService();
		mbrActivService_interface = new MbrActivService();
		mbrNewsService_interface = new MbrNewsService();
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		System.out.println("進來囉!");
		String merchantID = req.getParameter("MerchantID");
		String merchantTradeNo = req.getParameter("MerchantTradeNo");
		String RtnMsg = req.getParameter("RtnMsg");
		String checkMacValue = req.getParameter("CheckMacValue");
		String rtnCode = req.getParameter("RtnCode");
		Integer courseNo = Integer.valueOf(req.getParameter("CustomField1"));
		String mbrNo = req.getParameter("CustomField4");
		
		MemberService_interface memberSvc = new MemberService();
		MemberVO memberVO = memberSvc.findByMbrNo(mbrNo);
		
		
		
		if ("1".equals(rtnCode)) {
			// 付款成功
			// 檢查 checkMacValue，正確的話回傳 1|OK
			Hashtable<String, String> dict = new Hashtable<String, String>();
			dict.put("MerchantID", merchantID);
			dict.put("CheckMacValue", checkMacValue);
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html");
			if(all.compareCheckMacValue(dict)) {
				res.getWriter().write("1|OK");
			}
			
			// 更改訂單狀態成已付款（拆解 MerchantTradeNo）
			String trimmedString = merchantTradeNo.substring(5);
			Integer remainInteger = Integer.valueOf(trimmedString);
			Integer orderNo = remainInteger - 10000;
			System.out.println(orderNo);
			MbrCourseVO courseOrderUpdate = mbrCourseService_interface.findByPK(orderNo);
			
			MbrCourseVO courseOrderVO = new MbrCourseVO();
			courseOrderVO.setMbrCourseNo(orderNo);
			courseOrderVO.setCoachVO(courseOrderUpdate.getCoachVO());    
			courseOrderVO.setCourseVO(courseOrderUpdate.getCourseVO());
			courseOrderVO.setMbrCourseTime(courseOrderUpdate.getMbrCourseTime());
			courseOrderVO.setMemberVO(courseOrderUpdate.getMemberVO());
			courseOrderVO.setMbrCourseStat(true);
			System.out.println(courseOrderVO.toString());
			System.out.println(mbrCourseService_interface.update(courseOrderVO)); 
			
			
			// 寫入會員活動
			MbrActivVO vo = new MbrActivVO();
			vo.setMbrNo(mbrNo);
			vo.setActivSubj(courseOrderVO.getCourseVO().getCourseName());
			vo.setActivStartTime(courseOrderVO.getCourseVO().getCourseStartTime());
			vo.setActivEndTime(courseOrderVO.getCourseVO().getCourseEndTime());
			
			mbrActivService_interface.add(vo);
			
			// 寫入會員消息
			MbrNewsVO vo2 = new MbrNewsVO();
			vo2.setMbrNo(mbrNo);
			vo2.setNewsSubj("預約成功通知");
			vo2.setNewsText("您已成功預約課程，預約單編號" + merchantTradeNo);
			vo2.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
			
			mbrNewsService_interface.add(vo2);
			
			// 預約成功通知信
			java.sql.Timestamp startTime = courseOrderVO.getCourseVO().getCourseStartTime();
			java.sql.Timestamp endTime = courseOrderVO.getCourseVO().getCourseEndTime();
			SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd HH:mm");
			SimpleDateFormat df2 = new SimpleDateFormat("HH:mm");
		    String start = df.format(startTime);
		    String end = df2.format(endTime);
			
			String title = "ASAP課程預約成功通知 - [" + courseOrderVO.getCourseVO().getCourseName() + "]";
			String content = "親愛的會員您好，您已預約 " + start + "~" + end +  
						"「" + courseOrderVO.getCourseVO().getCourseName() + "」之課程，請務必在預約時間內準時到達，並遵守我們的課程規則。如有任何問題或需要進一步協助，請隨時聯繫我們的客服部門。";
			MailFormat mailFormat = new MailFormat(memberVO.getMbrName(), content);
			InputStream in = getServletContext().getResourceAsStream("/newImg/mailLogo.png");
			DataSource dataSource = new ByteArrayDataSource(in, "application/png");
			
			// 寄出信件
			JavaMail mail = new JavaMail(memberVO.getMbrEmail(), title, mailFormat.getMessageTextAndImg(), dataSource);
			String result = mail.sendMail();
			System.out.println("SendMail : " + result);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	
	

}
