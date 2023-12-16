package com.asap.court.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Hashtable;

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

import ecpay.payment.integration.AllInOne;

@WebServlet("/court/ecPayReturn.do")
public class ecPayReturnServlet extends HttpServlet{

	public static AllInOne all;
	private CourtClosedTimeService_interface courtClosedTimeService_interface;
	private CourtOrderService_interface courtOrderService_interface;

	
	public void init() throws ServletException {
		all = new AllInOne("");
		courtClosedTimeService_interface = new CourtClosedTimeService();
		courtOrderService_interface = new CourtOrderService();

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
		String closedTimePK = req.getParameter("CustomField1");

		System.out.println(merchantTradeNo + " " + RtnMsg + " RtnCode=" + rtnCode + " closedTimePK=" + closedTimePK);
		
		
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
			
			// 更改訂單狀態（MerchantTradeNo 做拆解）
			String trimmedString = merchantTradeNo.substring(5);
			Integer remainInteger = Integer.valueOf(trimmedString);
			Integer orderNo = remainInteger - 10000;
			System.out.println(orderNo);
			CourtOrderVO courtOrderUpdate = courtOrderService_interface.findByPK(orderNo);
//			System.out.println(courtOrderUpdate.toString());
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
		}else {
			// 付款不成功，刪除原本新增的不開放時間（用 PK）
			String[] stringArray = closedTimePK.split(",");
			for(String ele: stringArray) {
				int inValue = Integer.valueOf(ele);
				courtClosedTimeService_interface.delete(inValue);
			}
		}
			
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
