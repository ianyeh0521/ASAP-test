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

@WebServlet("/shop/OrderServlet")
public class OrderServlet extends HttpServlet {

	public static AllInOne all;

	private OrderService_interface orderService;
	private ItemInfoService_interface itemInfoSvc;

	@Override
	public void init() throws ServletException {
		all = new AllInOne("");
		orderService = new OrderService();
		itemInfoSvc = new ItemInfoService();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String forwardPath = "";
		switch (action) {
		case "ordercreate":
			forwardPath = insert(req, res);
			req.getRequestDispatcher(forwardPath).forward(req,res);
			break;
		case "deleteOrder":
			deleteOrder(req, res);
			break;
		case "payorder":
			payOrder(req, res);
			break;
		}
		res.setContentType("text/html; charset=UTF-8");
	}

	private String insert(HttpServletRequest req, HttpServletResponse res) throws IOException {
//			String mbrNo = req.getParameter("mbrNo"); 
		Integer total = Integer.valueOf(req.getParameter("total"));
		String rcvrname = req.getParameter("rcvrname");
		String rcvremail = req.getParameter("rcvremail");
		String rcvrphone = req.getParameter("rcvrphone");
		String zip = req.getParameter("zip");
		System.out.println(zip);
		String rcvraddr = req.getParameter("rcvraddr");
		String rcvraddrdetail = req.getParameter("rcvraddrdetail");
		boolean exceed = false;
		Map<String, String[]> map = req.getParameterMap();
		// 驗證並修改購物車數量
		for (String key : map.keySet()) {
			String value = map.get(key)[0];
			System.out.println("Key: " + key + ", Value: " + value);
			if (key.startsWith("product")) {

				String[] product = value.split(",");
				System.out.println(product[0]);

				ItemInfoVO itemcheck = itemInfoSvc.findByItemNo(Integer.parseInt(product[0]));
				Integer maxpurchase = itemcheck.getItemStockQty();
				if (maxpurchase < Integer.parseInt(product[2])) {
					exceed = true;
					ShoppingCartService shoppingCartSvc = new ShoppingCartService();
					if(maxpurchase==0) {
						ShoppingCartVO modifyCart = shoppingCartSvc.findByMemberAndItemNo("M001",Integer.parseInt(product[0]));
						shoppingCartSvc.delete(modifyCart);
					}else {
						ShoppingCartVO modifyCart = shoppingCartSvc.findByMemberAndItemNo("M001",Integer.parseInt(product[0]));
						modifyCart.setItemShopQty(maxpurchase);
					}
					
					
				}
			}
		}
		if (exceed == false) {
			OrderVO entity = new OrderVO();
////		session.getAttribute("memberVo",mVo);
			entity.setMbrNo("M001");
			entity.setOrderPrice(total);
			entity.setOrderStat(0);
			entity.setRcvrName(rcvrname);
			entity.setRcvrEmail(rcvremail);
			entity.setRcvrPhone(rcvrphone);
			entity.setRcvrAddr(zip + rcvraddr + rcvraddrdetail);
			entity.setOrderCrtTime(new java.sql.Timestamp(System.currentTimeMillis()));
			entity.setOrderCancelTime(null);
			Integer orderno = orderService.insert(entity);

			for (String key : map.keySet()) {
				String value = map.get(key)[0];
				System.out.println("Key: " + key + ", Value: " + value);
				if (key.startsWith("product")) {

					String[] product = value.split(",");
					System.out.println(product[0]);
					OrderDetailVO orderDetail = new OrderDetailVO();
					ItemInfoVO itemInfoVO = new ItemInfoVO(Integer.parseInt(product[0]));
					orderDetail.setItemOrderPrice(Integer.parseInt(product[1]));
					orderDetail.setItemOrderQty(Integer.parseInt(product[2]));

					orderDetail.setOrderNo(orderno);
					orderDetail.setMbrNo("M001");
					orderDetail.setDelyStat(false);

					orderDetail.setItemInfoVO(itemInfoVO);
					OrderDetailService_interface orderDetailSvc = new OrderDetailService();
					orderDetailSvc.insert(orderDetail);

					Integer sold = Integer.parseInt(product[2]);
					ItemInfoVO itemInfo = itemInfoSvc.findByItemNo(Integer.parseInt(product[0]));
					Integer itemstockqty = itemInfo.getItemStockQty();
					Integer newStockQty = Math.max(itemstockqty - sold, 0);
					itemInfo.setItemStockQty(newStockQty);
					itemInfoSvc.update(itemInfo);
					
				}
			}
			ItemInfoService_interface itemInfoSvc = new ItemInfoService();
		    if (orderno != null) {
		        String mbrNo = "M001";
		        ShoppingCartService shoppingCartService = new ShoppingCartService();
		        List<ShoppingCartVO> shoppingCartItems = shoppingCartService.findByMember(mbrNo);
		        for (ShoppingCartVO item : shoppingCartItems) {
		            shoppingCartService.delete(item);
		        }
		    }			
			return "/shop/PendingOrder.jsp";
		}else {
			req.setAttribute("msg", "超過可購買上限，已重設購物車數量");
			return "/shop/AsapOrderCheck.jsp";
			
		}
//		
//				

//		
//		OrderVO entity = new OrderVO();
//////			session.getAttribute("memberVo",mVo);
//		entity.setMbrNo("M1");
//		entity.setOrderPrice(total);
//		entity.setOrderStat(0);
//		entity.setRcvrName(rcvrname);
//		entity.setRcvrEmail(rcvremail);
//		entity.setRcvrPhone(rcvrphone);
//		entity.setRcvrAddr(zip + rcvraddr + rcvraddrdetail);
//		entity.setOrderCrtTime(new java.sql.Timestamp(System.currentTimeMillis()));
//		entity.setOrderCancelTime(null);
//
//		Integer orderno= orderService.insert(entity);
//
//		
//		
////	    


	}

	private void deleteOrder(HttpServletRequest req, HttpServletResponse res) {
		Integer orderNo = Integer.valueOf(req.getParameter("orderNo"));
		OrderVO orderVO = orderService.findByPK(orderNo);
		orderVO.setOrderStat(4);
		orderService.update(orderVO);
		OrderDetailService_interface orderDetail = new OrderDetailService();

		List<OrderDetailVO> orderdetails = orderDetail.findByOrderNo(orderNo);
		for (OrderDetailVO orderitem : orderdetails) {
			Integer itemno = orderitem.getItemInfoVO().getItemNo();
			Integer itemqty = orderitem.getItemOrderQty();
			ItemInfoVO itemInfoVO = itemInfoSvc.findByItemNo(itemno);
			Integer inStock = itemInfoVO.getItemStockQty();
			itemInfoVO.setItemStockQty(inStock + itemqty);
			itemInfoSvc.update(itemInfoVO);
		}

	}

	private void payOrder(HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println("進來ㄌ");
		String mbrNo = req.getParameter("mbrNo");
		String items = "";
		Integer ordNo = Integer.valueOf(req.getParameter("orderNo"));
		System.out.println("Orderno is " + ordNo);
		OrderVO orderVO = orderService.findByPK(ordNo);
		System.out.println(orderVO);
		OrderDetailService_interface ordDetailSvc = new OrderDetailService();
		List<OrderDetailVO> details = ordDetailSvc.findByOrderNo(ordNo);
		System.out.println(details);
		for (OrderDetailVO i : details) {
			items += i.getItemInfoVO().getItemName() + "、";
		}
		items = items.substring(0, items.length() - 1);
		Timestamp tradeDate = orderVO.getOrderCrtTime();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String formattedTradeDate = dateFormat.format(tradeDate);
		System.out.println(items);
		// 呼叫綠界
		AioCheckOutALL obj = new AioCheckOutALL();
		int currentYear = getCurrentYear();
		int merchantTradeNoSet = 10000 + ordNo;
		obj.setMerchantTradeNo("CT" + currentYear + merchantTradeNoSet); // 注意之後上線後訂單編號重複問題
		obj.setMerchantTradeDate(formattedTradeDate);
		obj.setTradeDesc("ASAP商城訂單第" + ordNo + "號");
		obj.setItemName("本次購買商品-");
		obj.setTotalAmount(String.valueOf(orderVO.getOrderPrice()));
		obj.setCustomField1(mbrNo); // 會員編號
		obj.setCustomField2(String.valueOf(ordNo)); // 訂單編號（資料庫的）
		obj.setReturnURL("https://acac-1-164-235-76.ngrok-free.app/ASAP/shop/orderPayReturn.do"); // 使用時要記得換成外網
		obj.setOrderResultURL("http://localhost:8081/ASAP/shop/ASAPShop.jsp"); // 使用者付款完成跳轉頁面
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);

		System.out.println(form);

		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html");
		try (PrintWriter out = res.getWriter()) {
			out.print(form);
		}

	}

	private int getCurrentYear() {
		return LocalDate.now().getYear();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

}
