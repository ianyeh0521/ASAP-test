package com.asap.course.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ListModel;

import com.asap.course.entity.CourseVO;
import com.asap.course.entity.MbrCourseVO;
import com.asap.course.service.CourseService;
import com.asap.course.service.CourseService_interface;
import com.asap.course.service.MbrCourseService;
import com.asap.course.service.MbrCourseService_interface;
import com.asap.member.entity.MemberVO;
import com.asap.member.service.MemberService;
import com.asap.member.service.MemberService_interface;
import com.google.protobuf.Timestamp;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@WebServlet("/course/mbrCourseServlet.do")
public class MbrCourseServlet extends HttpServlet{

	public static AllInOne all;
	private MbrCourseService_interface mbrCourseService_interface;
	private CourseService_interface courseService_interface;
	private MemberService_interface memberService_interface;
	
	@Override
	public void init() throws ServletException {
		all = new AllInOne("");
		mbrCourseService_interface = new MbrCourseService();
		courseService_interface = new CourseService();
		memberService_interface = new MemberService();
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("order".equals(action)) {
			String mbrNo = req.getParameter("mbrNo");
			Integer courseNo = Integer.valueOf(req.getParameter("courseNo"));
			CourseVO courseVO = courseService_interface.findByPK(courseNo);
			MemberVO memberVO = memberService_interface.findByMbrNo(mbrNo);
			
			// 判斷是否預約過此課程
			List<MbrCourseVO> mbrOrderList = mbrCourseService_interface.findByMember(mbrNo);
			Boolean checkOrder = false;
			for(MbrCourseVO mbrCourseVO: mbrOrderList) {
				if(mbrCourseVO.getCourseVO().getCourseNo() == courseNo && mbrCourseVO.getMbrCourseStat() == true) {
					checkOrder = true;
				}
			}
			
			if(!checkOrder) {
				// 寫入會員課程訂單
				MbrCourseVO mbrCourseVO = new MbrCourseVO();
				mbrCourseVO.setCourseVO(courseVO);
				mbrCourseVO.setCoachVO(courseVO.getCoachVO());
				mbrCourseVO.setMemberVO(memberVO);
				mbrCourseVO.setMbrCourseStat(false);
				java.sql.Timestamp orderTime = new java.sql.Timestamp(System.currentTimeMillis());
				mbrCourseVO.setMbrCourseTime(orderTime);
				Integer mbrCousreOrderNo =  mbrCourseService_interface.insert(mbrCourseVO);
				
				// 處理綠界要用的格式
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				String formattedTradeDate = dateFormat.format(orderTime);
				java.sql.Timestamp startTime = courseVO.getCourseStartTime();
				java.sql.Timestamp endTime = courseVO.getCourseEndTime();
				SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd HH:mm");
				SimpleDateFormat df2 = new SimpleDateFormat("HH:mm");
			    String start = df.format(startTime);
			    String end = df2.format(endTime);
				
				// 呼叫綠界付款
				AioCheckOutALL obj = new AioCheckOutALL();
				int currentYear = getCurrentYear();
				int merchantTradeNoSet = 10000 + mbrCousreOrderNo;
				obj.setMerchantTradeNo("S" + currentYear + merchantTradeNoSet);			// 注意之後上線後訂單編號重複問題
				obj.setMerchantTradeDate(formattedTradeDate);
				obj.setTradeDesc(courseVO.getCourseName());
				obj.setItemName(courseVO.getCourseName() + "  " + start + "~" + end);
				obj.setTotalAmount(String.valueOf(courseVO.getCoursePrice()));
				obj.setCustomField1(String.valueOf(courseNo)); // 訂單成立接收到CourseNo
				obj.setCustomField4(mbrNo); // 會員編號
				obj.setReturnURL("https://da60-114-24-167-99.ngrok-free.app/ASAP/course/courseEcPayReturn.do");	// 使用時要記得換成外網
				obj.setOrderResultURL("http://localhost:8081/ASAP/course/course_main.jsp");  // 使用者付款完成跳轉頁面
				obj.setNeedExtraPaidInfo("N");
				String form = all.aioCheckOut(obj, null);
				System.out.println(form);
				
				res.setCharacterEncoding("UTF-8");
				res.setContentType("text/html");
				try(PrintWriter out = res.getWriter()){
					out.print(form);
				}
			
			}else {
				// forward 並通知你已經訂購過此課程了
			}
			
			
			
		}else if("check".equals(action)) {
			// 檢查此課程是否額滿
			Integer courseNo = Integer.valueOf(req.getParameter("courseNo"));
			CourseVO thisCourseVO = courseService_interface.findByPK(courseNo);
			
			List<MbrCourseVO> allList = mbrCourseService_interface.findByCourseNo(courseNo);
			List<MbrCourseVO> checkList = new ArrayList<>();
			for(MbrCourseVO mbrCourseVO: allList) {
				if(mbrCourseVO.getMbrCourseStat() == true) {
					checkList.add(mbrCourseVO);
				}
			}
			
			String checkString;
			if(checkList.size() == thisCourseVO.getCoursePplLimit()) {
				checkString = "full";
			}else {
				checkString = "available";
			}
			
			res.getWriter().write(checkString);
		}
	}
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	private int getCurrentYear() {
        return LocalDate.now().getYear();
    }
	
}
