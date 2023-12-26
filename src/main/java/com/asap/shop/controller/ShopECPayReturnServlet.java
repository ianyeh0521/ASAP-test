package com.asap.shop.controller;
 
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

import com.asap.member.entity.MbrActivVO;
import com.asap.member.entity.MbrNewsVO;
import com.asap.member.entity.MemberVO;
import com.asap.member.service.MbrActivService;
import com.asap.member.service.MbrActivService_interface;
import com.asap.member.service.MbrNewsService;
import com.asap.member.service.MbrNewsService_interface;
import com.asap.member.service.MemberService;
import com.asap.member.service.MemberService_interface;
import com.asap.shop.entity.OrderVO;
import com.asap.shop.service.OrderService;
import com.asap.shop.service.OrderService_interface;
import com.asap.util.JavaMail;
import com.asap.util.MailFormat;


import ecpay.payment.integration.AllInOne;

@WebServlet("/shop/orderPayReturn.do")
public class ShopECPayReturnServlet extends HttpServlet{

	public static AllInOne all;
	private OrderService_interface orderSvc;
	private MbrNewsService_interface mbrNewsSvc;

	
	public void init() throws ServletException {
		all = new AllInOne("");
		orderSvc = new OrderService();
		mbrNewsSvc = new MbrNewsService();

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
		String mbrNo = req.getParameter("CustomField1");
		Integer ordNo = Integer.valueOf(req.getParameter("CustomField2"));
		System.out.println(ordNo);
//		String courtOrdTimeAndEnd = req.getParameter("CustomField3");
//		String memberNo = req.getParameter("CustomField4");
		
		
		MemberService_interface memberSvc = new MemberService();
		MemberVO memberVO = memberSvc.findByMbrNo(mbrNo);

		System.out.println(merchantTradeNo + " " + RtnMsg + " RtnCode=" + rtnCode 				
				+"memberNo="+mbrNo);
		
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
			OrderVO order = orderSvc.findByPK(ordNo);
			order.setOrderStat(1);
			orderSvc.update(order);
			 
			
			// 寫入不開放時間
//			for(int i = courtOrdTime; i < courtOrdTimeEnd;i++) {
//				CourtClosedTimeVO courtClosedTimeVO = new CourtClosedTimeVO(courtVO, courtOrdDate, i);
//				courtClosedTimeService_interface.insert(courtClosedTimeVO);
//			}
			
			
			
			// 寫入會員消息
			MbrNewsVO vo2 = new MbrNewsVO();
			vo2.setMbrNo(mbrNo);
			vo2.setNewsSubj("付款成功通知");
			vo2.setNewsText("您已成功付款，訂單編號" + ordNo);
			vo2.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
			mbrNewsSvc.add(vo2);
			
			// 預約成功通知信
			String title = "ASAP商城付款成功通知第"+ordNo+"號訂單";
			String content = "親愛的會員您好，您已成功付款。您所購買的商品將在近日寄出，謝謝。如有任何問題或需要進一步協助，請隨時聯繫我們的客服部門。";
			MailFormat mailFormat = new MailFormat(memberVO.getMbrName(), content);
			InputStream in = getServletContext().getResourceAsStream("/newImg/mailLogo.png");
			DataSource dataSource = new ByteArrayDataSource(in, "application/png");
			
			// 寄出信件
			JavaMail mail = new JavaMail(memberVO.getMbrEmail(), title, mailFormat.getMessageTextAndImg(), dataSource);
			String result = mail.sendMail();
			System.out.println("SendMail : " + result);
		}else {
			OrderVO orderVO= orderSvc.findByPK(ordNo);
			System.out.println(orderVO);
			orderVO.setOrderStat(4);
			orderSvc.update(orderVO);
		}
			
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
