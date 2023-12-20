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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@WebServlet("/court/courtOrderServlet.do")
public class CourtOrderServlet extends HttpServlet{

	public static AllInOne all;
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
//		String forwardPath = "";
		switch (action) {
			case "order":
				placeOrder(req, res);
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
		
		Boolean courtOrdStat = false;		// 訂單一開始都是未付款狀態，交易結束仍為未付款，將會不會有不開放時間寫入的紀錄
		
		java.sql.Date courtOrdDate = java.sql.Date.valueOf(req.getParameter("courtOrdDate"));
		
		Integer courtOrdTime = Integer.valueOf(req.getParameter("courtOrdTime"));
		
		Integer courtOrdTimeEnd = Integer.valueOf(req.getParameter("courtOrdTimeEnd"));
		
		Integer totalPrice = Integer.valueOf(req.getParameter("totalPrice"));
		
		String memberEmail = memberVO.getMbrEmail();
		
		CourtOrderVO courtOrderVO = new CourtOrderVO(memberVO, courtVO, courtOrdStat,courtOrdDate, courtOrdTime, courtOrdTimeEnd, totalPrice);
		
		// 判斷不開放時間是否有訂單選擇時間，如同一時間有人付款成功涵蓋此時段的訂單，則取消
//		for(int i = courtOrdTime; i < courtOrdTimeEnd; i++) {
//			System.out.println(i);
//			if(courtClosedTimeService_interface.existsDeter(courtNo, courtOrdDate, i)) {
//				req.getRequestDispatcher("court_orderFail.jsp?error=time").forward(req, res);
//				return;
//			}
//		}
		
		
		// 判斷是否有已寫入的訂單涵蓋此時間（同時間付款完成的其他訂單）
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
				
				// 付款成功前先寫入不開放時間（鎖定其他人的預約衝突），courtOrdTime ~ courtOrdTimeEnd，並將回傳的 PK 放入一個 list，再將其變成用,分隔的字串，可以給另一個controller做刪除用
//				List<Integer> newClosedTimeList = new ArrayList<>();
//				for(int i = courtOrdTime; i < courtOrdTimeEnd;i++) {
//					CourtClosedTimeVO courtClosedTimeVO = new CourtClosedTimeVO(courtVO, courtOrdDate, i);
//					newClosedTimeList.add(courtClosedTimeService_interface.insert(courtClosedTimeVO));
//				}
//				StringBuilder newClosedTimeString = new StringBuilder();
//		        for (int i = 0; i < newClosedTimeList.size(); i++) {
//		        	newClosedTimeString.append(newClosedTimeList.get(i));
//		            if (i < newClosedTimeList.size() - 1) {
//		            	newClosedTimeString.append(",");
//		            }
//		        }
//		        String resultString = newClosedTimeString.toString();
				
				// 呼叫綠界
				AioCheckOutALL obj = new AioCheckOutALL();
				int currentYear = getCurrentYear();
				int merchantTradeNoSet = 10000 + getPlaceOrderNo;
				obj.setMerchantTradeNo("C" + currentYear + merchantTradeNoSet);
				obj.setMerchantTradeDate(formattedTradeDate);
				obj.setTradeDesc(courtVO.getCourtName());
				obj.setItemName(courtVO.getCourtName() + "  " + courtOrdDate + "  " + courtOrdTime + ":00 ~ " + courtOrdTimeEnd + ":00");
				obj.setTotalAmount(String.valueOf(totalPrice));
				obj.setCustomField1(String.valueOf(courtNo)); // 訂單成立接收到CourtNo
				obj.setCustomField2(String.valueOf(courtOrdDate)+","+String.valueOf(courtOrdTime)+","+String.valueOf(courtOrdTimeEnd)); // 預約日期、時間
//				obj.setCustomField3(); 
				obj.setCustomField4(mbrNo); // 會員編號
				obj.setReturnURL("https://fed4-1-164-226-209.ngrok-free.app/ASAP/court/ecPayReturn.do");	// 使用時要記得換成外網
				obj.setOrderResultURL("http://localhost:8081/ASAP/court/court_orderSuccess.jsp");  // 使用者付款完成跳轉頁面
				obj.setNeedExtraPaidInfo("N");
				String form = all.aioCheckOut(obj, null);
				System.out.println(form);
				
				res.setCharacterEncoding("UTF-8");
				res.setContentType("text/html");
				try(PrintWriter out = res.getWriter()){
					out.print(form);
				}
				
				
				
				// 最後檢查訂單付款狀態，這是付款成功前先寫入不開放時間資料庫檔同時進行的人，但目前會出事
//				CourtOrderVO finalOrderVO = courtOrderService_interface.findByPK(getPlaceOrderNo);
//				if(finalOrderVO.getCourtOrdStat()==false) {
//					// 非因進到綠界後的其他原因付款不成功
//					String[] stringArray = resultString.split(",");
//					for(String ele: stringArray) {
//						int inValue = Integer.valueOf(ele);
//						courtClosedTimeService_interface.delete(inValue);
//					}
//				}
			}
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
