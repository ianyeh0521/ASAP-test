package com.asap.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.entity.OrderDetailVO;
import com.asap.shop.entity.OrderVO;
import com.asap.shop.entity.ShoppingCartVO;
import com.asap.shop.service.ItemInfoService;
import com.asap.shop.service.ItemInfoService_interface;
import com.asap.shop.service.OrderDetailService;
import com.asap.shop.service.OrderDetailService_interface;
import com.asap.shop.service.OrderService;
import com.asap.shop.service.OrderService_interface;
import com.asap.shop.service.ShoppingCartService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@WebServlet("/shop/PayOrderServlet")
public class PayOrderServlet extends HttpServlet {

	public static AllInOne all;
	
	private OrderService_interface orderService;
	private ItemInfoService_interface itemInfoSvc;
    
	@Override
	public void init() throws ServletException {
		all= new AllInOne("");
		orderService = new OrderService();
		itemInfoSvc = new ItemInfoService();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		System.out.println("進來ㄌ");
		String mbrNo = req.getParameter("mbrNo");
		
		String items="";
		Integer ordNo = Integer.valueOf(req.getParameter("orderNo")) ;
		System.out.println("Orderno is "+ordNo);
		OrderVO orderVO= orderService.findByPK(ordNo);
		System.out.println(orderVO);
		OrderDetailService_interface ordDetailSvc =new OrderDetailService();
		List <OrderDetailVO> details= ordDetailSvc.findByOrderNo(ordNo);
		System.out.println(details);
		for(OrderDetailVO i: details) {
			items += i.getItemInfoVO().getItemName()+"、";
		}
		items=items.substring(0, items.length()-1);
		Timestamp tradeDate = orderVO.getOrderCrtTime();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String formattedTradeDate = dateFormat.format(tradeDate);
		System.out.println(items);
		System.out.println(String.valueOf(orderVO.getOrderPrice()));
		// 呼叫綠界
		AioCheckOutALL obj = new AioCheckOutALL();
		int currentYear = getCurrentYear();
		int merchantTradeNoSet = 50000 + ordNo;
		
		
		obj.setMerchantTradeNo("CT" + currentYear + merchantTradeNoSet);
		obj.setMerchantTradeDate(formattedTradeDate);
		obj.setTotalAmount(String.valueOf(orderVO.getOrderPrice()));
		obj.setTradeDesc("ASAP商城訂單第"+ordNo+"號");
		obj.setItemName(items);
		obj.setCustomField1(mbrNo);// 會員編號
		obj.setCustomField2(String.valueOf(ordNo)); // 訂單編號（資料庫的）
		obj.setReturnURL("https://ee5b-2001-b400-e292-d668-8ceb-e052-fcb2-38c.ngrok-free.app/ASAP/shop/orderPayReturn.do");
		obj.setOrderResultURL("http://localhost:8081/ASAP/shop/BuyerOrderManage.jsp");
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);

		
		
		
		
		
//		obj.setMerchantTradeNo();			// 注意之後上線後訂單編號重複問題
//		obj.setMerchantTradeDate(formattedTradeDate);
//		obj.setTradeDesc("ASAP商城訂單第"+ordNo+"號");
//		obj.setItemName("本次購買商品");
//		obj.setTotalAmount(String.valueOf(orderVO.getOrderPrice()));
//		obj.setCustomField1(mbrNo); // 會員編號
//		obj.setCustomField2(String.valueOf(ordNo)); // 訂單編號（資料庫的）
//		obj.setReturnURL("https://acac-1-164-235-76.ngrok-free.app/ASAP/shop/orderPayReturn.do");	// 使用時要記得換成外網
//		obj.setOrderResultURL("http://localhost:8081/ASAP/shop/ASAPShop.jsp");  // 使用者付款完成跳轉頁面
//		obj.setNeedExtraPaidInfo("N");
//		String form=all.aioCheckOut(obj, null);
		
		System.out.println(form);
		
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html");
		try(PrintWriter out = res.getWriter()){
			out.print(form);
		}
	}

	
	
//	private void payOrder(HttpServletRequest req, HttpServletResponse res) throws IOException {
//		System.out.println("進來ㄌ");
//		String mbrNo = req.getParameter("mbrNo");
//		String items="";
//		Integer ordNo = Integer.valueOf(req.getParameter("orderNo")) ;
//		System.out.println("Orderno is "+ordNo);
//		OrderVO orderVO= orderService.findByPK(ordNo);
//		System.out.println(orderVO);
//		OrderDetailService_interface ordDetailSvc =new OrderDetailService();
//		List <OrderDetailVO> details= ordDetailSvc.findByOrderNo(ordNo);
//		System.out.println(details);
//		for(OrderDetailVO i: details) {
//			items += i.getItemInfoVO().getItemName()+"、";
//		}
//		items=items.substring(0, items.length()-1);
//		Timestamp tradeDate = orderVO.getOrderCrtTime();
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		String formattedTradeDate = dateFormat.format(tradeDate);
//		System.out.println(items);
//		// 呼叫綠界
//		AioCheckOutALL obj = new AioCheckOutALL();
//		int currentYear = getCurrentYear();
//		int merchantTradeNoSet = 10000 + ordNo;
//		obj.setMerchantTradeNo("CT" + currentYear + merchantTradeNoSet);			// 注意之後上線後訂單編號重複問題
//		obj.setMerchantTradeDate(formattedTradeDate);
//		obj.setTradeDesc("ASAP商城訂單第"+ordNo+"號");
//		obj.setItemName("本次購買商品-");
//		obj.setTotalAmount(String.valueOf(orderVO.getOrderPrice()));
//		obj.setCustomField1(mbrNo); // 會員編號
//		obj.setCustomField2(String.valueOf(ordNo)); // 訂單編號（資料庫的）
//		obj.setReturnURL("https://acac-1-164-235-76.ngrok-free.app/ASAP/shop/orderPayReturn.do");	// 使用時要記得換成外網
//		obj.setOrderResultURL("http://localhost:8081/ASAP/shop/ASAPShop.jsp");  // 使用者付款完成跳轉頁面
//		obj.setNeedExtraPaidInfo("N");
//		String form=all.aioCheckOut(obj, null);
//		
//		System.out.println(form);
//		
//		res.setCharacterEncoding("UTF-8");
//		res.setContentType("text/html");
//		try(PrintWriter out = res.getWriter()){
//			out.print(form);
//		}
//		
//	}
	
	private int getCurrentYear() {
        return LocalDate.now().getYear();
    }
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

}
