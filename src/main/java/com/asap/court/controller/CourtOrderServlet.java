package com.asap.court.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.asap.court.entity.CourtClosedTimeVO;
import com.asap.court.entity.CourtOrderVO;
import com.asap.court.entity.CourtVO;
import com.asap.court.service.CourtClosedTimeService;
import com.asap.court.service.CourtClosedTimeService_interface;
import com.asap.court.service.CourtOrderService;
import com.asap.court.service.CourtOrderService_interface;
import com.asap.court.service.CourtService;
import com.asap.court.service.CourtService_interface;
import com.asap.member.entity.MemberVO;
import com.asap.member.service.MemberService;
import com.asap.member.service.MemberService_interface;
import com.asap.util.HibernateProxyTypeAdapter;
import com.asap.util.JedisPoolUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@WebServlet("/court/courtOrderServlet.do")
public class CourtOrderServlet extends HttpServlet{

	public static AllInOne all;
	private static JedisPool pool = JedisPoolUtil.getJedisPool();
	private CourtOrderService_interface courtOrderService_interface;
	private CourtClosedTimeService_interface courtClosedTimeService_interface;
	
	@Override
	public void init() throws ServletException {
		courtOrderService_interface = new CourtOrderService();
		all = new AllInOne("");
		courtClosedTimeService_interface = new CourtClosedTimeService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		switch (action) {
			case "order":
				placeOrder(req, res);
				break;
			case "pay":
				payOrder(req, res);
				break;
			default:
				break;
		}
	}
	




	private void placeOrder(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String mbrNo = req.getParameter("mbrNo");	
		MemberService_interface mbrSvc = new MemberService();
		MemberVO memberVO = mbrSvc.findByMbrNo(mbrNo);
		
		Integer courtNo = Integer.valueOf(req.getParameter("courtNo"));
		CourtService_interface courtSvc = new CourtService();
		CourtVO courtVO = courtSvc.getCourtByCourtNo(courtNo);
		
		Integer courtOrdStat = 0;		// 訂單一開始都是未付款狀態
		
		java.sql.Date courtOrdDate = java.sql.Date.valueOf(req.getParameter("courtOrdDate"));
		
		Integer courtOrdTime = Integer.valueOf(req.getParameter("courtOrdTime"));
		
		Integer courtOrdTimeEnd = Integer.valueOf(req.getParameter("courtOrdTimeEnd"));
		
		Integer totalPrice = Integer.valueOf(req.getParameter("totalPrice"));
		
		String memberEmail = memberVO.getMbrEmail();
		
		CourtOrderVO courtOrderVO = new CourtOrderVO(memberVO, courtVO, courtOrdStat,courtOrdDate, courtOrdTime, courtOrdTimeEnd, totalPrice);
		
		// 判斷是否有已成立的訂單涵蓋此時間（同時間付款完成的其他訂單）
		if(courtOrderService_interface.checkOrderDateAndTime(courtNo, courtOrdDate, courtOrdTime, courtOrdTimeEnd)==false) {
			System.out.println("有到這裡2");
			req.getRequestDispatcher("court_orderFail.jsp?error=time").forward(req, res);
		}else {
			// 判斷是否有重複的訂單，避免系統錯誤
			if((courtOrderService_interface.checkOrder(courtNo, courtOrdDate, courtOrdTime, courtOrdTimeEnd))==false) {
				System.out.println("有到這裡3");
				req.getRequestDispatcher("court_orderFail.jsp?error=order").forward(req, res);
			}else {
				// 寫入訂單
				Integer getPlaceOrderNo = courtOrderService_interface.insert(courtOrderVO);
				System.out.println(getPlaceOrderNo);
			
				CourtOrderVO courtOrderVO2 = courtOrderService_interface.findByPK(getPlaceOrderNo);
				Timestamp tradeDate = courtOrderVO2.getCourtOrdCrtTime();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				String formattedTradeDate = dateFormat.format(tradeDate);
				
				// 付款成功前先寫入不開放時間（避免其他人的預約衝突）
				for(int i = courtOrdTime; i < courtOrdTimeEnd;i++) {
					CourtClosedTimeVO courtClosedTimeVO = new CourtClosedTimeVO(courtVO, courtOrdDate, i);
					courtClosedTimeService_interface.insert(courtClosedTimeVO);
				}
				
				req.setAttribute("courtOrdNo", getPlaceOrderNo);
				req.setAttribute("mbrNo", mbrNo);
				
				res.setContentType("text/html; charset=UTF-8");
				RequestDispatcher dispatcher = req.getRequestDispatcher("/court/court_orderSuccess.jsp");
				dispatcher.forward(req, res);

			}
		}
	}
	
	private void payOrder(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String mbrNo = req.getParameter("mbrNo");
		Integer courtOrdNo = Integer.valueOf(req.getParameter("courtOrdNo"));
		
		CourtOrderVO courtOrderVO = courtOrderService_interface.findByPK(courtOrdNo);
		Timestamp tradeDate = courtOrderVO.getCourtOrdCrtTime();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String formattedTradeDate = dateFormat.format(tradeDate);
		
		// 更改訂單狀態為付款中
		courtOrderVO.setCourtOrdStat(1);
		courtOrderService_interface.update(courtOrderVO);
		
		// 呼叫綠界
		AioCheckOutALL obj = new AioCheckOutALL();
		int currentYear = getCurrentYear();
		int merchantTradeNoSet = 10000 + courtOrdNo;
		obj.setMerchantTradeNo("CT" + currentYear + merchantTradeNoSet);			// 注意之後上線後訂單編號重複問題
		obj.setMerchantTradeDate(formattedTradeDate);
		obj.setTradeDesc(courtOrderVO.getCourtVO().getCourtName());
		obj.setItemName(courtOrderVO.getCourtVO().getCourtName() + "  " + courtOrderVO.getCourtOrdDate() 
						+ "  " + courtOrderVO.getCourtOrdTime() + ":00 ~ " + courtOrderVO.getCourtOrdTimeEnd() + ":00");
		obj.setTotalAmount(String.valueOf(courtOrderVO.getTotalPrice()));
		obj.setCustomField1(String.valueOf(courtOrderVO.getCourtVO().getCourtNo())); // 訂單成立接收到CourtNo
		obj.setCustomField2(String.valueOf(courtOrdNo)); // 預約單編號（資料庫的）
		obj.setCustomField4(mbrNo); // 會員編號
		obj.setReturnURL("https://5a84-1-164-241-217.ngrok-free.app/ASAP/court/ecPayReturn.do");	// 使用時要記得換成外網
		obj.setOrderResultURL("http://localhost:8081/ASAP/court/court_paymentSuccess.jsp");  // 使用者付款完成跳轉頁面
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		System.out.println(form);
		
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html");
		try(PrintWriter out = res.getWriter()){
			out.print(form);
		}
		
	}
	
	
	private int getCurrentYear() {
        return LocalDate.now().getYear();
    }
	
	private static long getMidnightTimestamp() {
        
        long currentTime = System.currentTimeMillis();

        long midnightTimestamp = currentTime - (currentTime % (24 * 60 * 60 * 1000)) + (24 * 60 * 60 * 1000);

        return midnightTimestamp;
    }
	


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	
	
	
	

}
