package com.asap.court.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.Timestamp;
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

import com.asap.court.entity.CourtClosedTimeVO;
import com.asap.court.entity.CourtOrderVO;
import com.asap.court.entity.CourtVO;
import com.asap.court.service.CourtClosedTimeService;
import com.asap.court.service.CourtClosedTimeService_interface;
import com.asap.court.service.CourtOrderService;
import com.asap.court.service.CourtOrderService_interface;
import com.asap.court.service.CourtService;
import com.asap.court.service.CourtService_interface;
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

@WebServlet("/court/ecPayReturn.do")
public class ecPayReturnServlet extends HttpServlet{

	public static AllInOne all;
	private CourtClosedTimeService_interface courtClosedTimeService_interface;
	private CourtOrderService_interface courtOrderService_interface;
	private MbrActivService_interface mbrActivService_interface;
	private MbrNewsService_interface mbrNewsService_interface;

	
	public void init() throws ServletException {
		all = new AllInOne("");
		courtClosedTimeService_interface = new CourtClosedTimeService();
		courtOrderService_interface = new CourtOrderService();
		mbrActivService_interface = new MbrActivService();
		mbrNewsService_interface = new MbrNewsService();

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		System.out.println("進來囉!");
		String merchantID = req.getParameter("MerchantID");
		String merchantTradeNo = req.getParameter("MerchantTradeNo");
		String RtnMsg = req.getParameter("RtnMsg");
		String checkMacValue = req.getParameter("CheckMacValue");
		String rtnCode = req.getParameter("RtnCode");
		Integer courtNo = Integer.valueOf(req.getParameter("CustomField1"));
		Integer courtOrderNo = Integer.valueOf(req.getParameter("CustomField2"));
//		String courtOrdTimeAndEnd = req.getParameter("CustomField3");
		String memberNo = req.getParameter("CustomField4");
		
		CourtService_interface courtSvc = new CourtService();
		CourtVO courtVO = courtSvc.getCourtByCourtNo(courtNo);
		MemberService_interface memberSvc = new MemberService();
		MemberVO memberVO = memberSvc.findByMbrNo(memberNo);

		System.out.println(merchantTradeNo + " " + RtnMsg + " RtnCode=" + rtnCode 
				+ " courtNo=" + courtNo
				+"courtOrdDateAndTimeAndEnd="
				+"memberNo="+memberNo);
		
//		String[] stringArray = courtOrdDateAndTimeAndEnd.split(",");
//		Date courtOrdDate = java.sql.Date.valueOf(stringArray[0].trim());
//		Integer courtOrdTime = Integer.valueOf(stringArray[1].trim());
//		Integer courtOrdTimeEnd = Integer.valueOf(stringArray[2].trim());
		
		

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
			
			// 更改訂單狀態成已付款
			//（拆解 MerchantTradeNo）
//			String trimmedString = merchantTradeNo.substring(6);
//			Integer remainInteger = Integer.valueOf(trimmedString);
//			Integer orderNo = remainInteger - 10000;
//			System.out.println(orderNo);
			CourtOrderVO courtOrder = courtOrderService_interface.findByPK(courtOrderNo);
			
			CourtOrderVO courtOrderUpdate = courtOrderService_interface.findByPK(courtOrderNo);
			
			CourtOrderVO courtOrderVO = new CourtOrderVO();
			courtOrderVO.setCourtOrdNo(courtOrderUpdate.getCourtOrdNo());
			courtOrderVO.setCourtOrdDate(courtOrderUpdate.getCourtOrdDate());
			courtOrderVO.setCourtOrdTime(courtOrderUpdate.getCourtOrdTime());
			courtOrderVO.setCourtOrdTimeEnd(courtOrderUpdate.getCourtOrdTimeEnd());
			courtOrderVO.setCourtVO(courtOrderUpdate.getCourtVO());
			courtOrderVO.setMemberVO(courtOrderUpdate.getMemberVO());
			courtOrderVO.setTotalPrice(courtOrderUpdate.getTotalPrice());
			courtOrderVO.setCourtOrdStat(true);
			System.out.println(courtOrderVO.toString());
			System.out.println(courtOrderService_interface.update(courtOrderVO)); 
			
			// 寫入不開放時間
//			for(int i = courtOrdTime; i < courtOrdTimeEnd;i++) {
//				CourtClosedTimeVO courtClosedTimeVO = new CourtClosedTimeVO(courtVO, courtOrdDate, i);
//				courtClosedTimeService_interface.insert(courtClosedTimeVO);
//			}
			
			// 寫入會員活動
			MbrActivVO vo = new MbrActivVO();
			vo.setMbrNo(memberNo);
			vo.setActivSubj("場地預約-" + courtVO.getCourtName());
			
			LocalDate localDate = courtOrder.getCourtOrdDate().toLocalDate();
			LocalTime localTime1 = LocalTime.of(courtOrder.getCourtOrdTime(), 0);
			LocalDateTime localDateTime1 = LocalDateTime.of(localDate, localTime1);
			Timestamp timestamp1 = Timestamp.valueOf(localDateTime1);
			vo.setActivStartTime(timestamp1);
			
			LocalTime localTime2 = LocalTime.of(courtOrder.getCourtOrdTimeEnd(), 0);
			LocalDateTime localDateTime2 = LocalDateTime.of(localDate, localTime2);
			Timestamp timestamp2 = Timestamp.valueOf(localDateTime2);
			vo.setActivEndTime(timestamp2);
			
			mbrActivService_interface.add(vo);
			
			// 寫入會員消息
			MbrNewsVO vo2 = new MbrNewsVO();
			vo2.setMbrNo(memberNo);
			vo2.setNewsSubj("預約成功通知");
			vo2.setNewsText("您已成功預約場地，預約單編號" + merchantTradeNo);
			vo2.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
			
			mbrNewsService_interface.add(vo2);
			
			// 預約成功通知信
			String title = "ASAP場地預約成功通知 - [" + courtVO.getCourtName() + "]";
			String content = "親愛的會員您好，您已預約 " + courtOrder.getCourtOrdDate() + " " + courtOrder.getCourtOrdTime() + ":00 ~ " + courtOrder.getCourtOrdTimeEnd() +":00 " 
						+ "「" + courtVO.getCourtName()+ "」之場館使用，請務必在預約時間內準時到達，並遵守我們的場地使用規定。如有任何問題或需要進一步協助，請隨時聯繫我們的客服部門。";
			MailFormat mailFormat = new MailFormat(memberVO.getMbrName(), content);
			InputStream in = getServletContext().getResourceAsStream("/newImg/mailLogo.png");
			DataSource dataSource = new ByteArrayDataSource(in, "application/png");
			
			// 寄出信件
			JavaMail mail = new JavaMail(memberVO.getMbrEmail(), title, mailFormat.getMessageTextAndImg(), dataSource);
			String result = mail.sendMail();
			System.out.println("SendMail : " + result);
		}else {


		}
			
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
