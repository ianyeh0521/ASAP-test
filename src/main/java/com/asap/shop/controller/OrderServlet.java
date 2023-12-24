package com.asap.shop.controller;

import java.io.IOException;
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
import com.asap.shop.service.OrderDetailService;
import com.asap.shop.service.OrderDetailService_interface;
import com.asap.shop.service.OrderService;
import com.asap.shop.service.OrderService_interface;
import com.asap.shop.service.ShoppingCartService;

@WebServlet("/shop/OrderServlet")
public class OrderServlet extends HttpServlet {

	private OrderService_interface orderService;

	@Override
	public void init() throws ServletException {
		orderService = new OrderService();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		switch (action) {
		case "ordercreate":
			insert(req, res);

			break;
		}
		res.setContentType("text/html; charset=UTF-8");
	}

	private void insert(HttpServletRequest req, HttpServletResponse res) throws IOException {
//			String mbrNo = req.getParameter("mbrNo"); 

		Integer total = Integer.valueOf(req.getParameter("total"));
		String rcvrname = req.getParameter("rcvrname");
		
		String rcvremail = req.getParameter("rcvremail");
		String rcvrphone = req.getParameter("rcvrphone");
		String zip = req.getParameter("zip");
		System.out.println(zip);
		String rcvraddr = req.getParameter("rcvraddr");
		String rcvraddrdetail = req.getParameter("rcvraddrdetail");

//		
		OrderVO entity = new OrderVO();
////			session.getAttribute("memberVo",mVo);
		entity.setMbrNo("M1");
		entity.setOrderPrice(total);
		entity.setOrderStat(0);
		entity.setRcvrName(rcvrname);
		entity.setRcvrEmail(rcvremail);
		entity.setRcvrPhone(rcvrphone);
		entity.setRcvrAddr(zip + rcvraddr + rcvraddrdetail);
		entity.setOrderCrtTime(new java.sql.Timestamp(System.currentTimeMillis()));
		entity.setOrderCancelTime(null);

		Integer orderno= orderService.insert(entity);

//	    ItemInfoService_interface itemInfoSvc = new ItemInfoService();
		// 檢查訂單是否成功創建
	    if (orderno != null && orderno > 0) {
	        // 刪除會員購物車內容
	        String mbrNo = "M1"; // 或從某處獲取會員編號
	        ShoppingCartService shoppingCartService = new ShoppingCartService();

	        // 假設有一個方法可以獲取特定會員的所有購物車項目
	        List<ShoppingCartVO> shoppingCartItems = shoppingCartService.findByMember(mbrNo);

	        for (ShoppingCartVO item : shoppingCartItems) {
	            shoppingCartService.delete(item);
	        }
	    }

		Map<String, String[]> map = req.getParameterMap();
		// map.keySet().stream().forEach(System.out::println);
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
				orderDetail.setMbrNo("M1");
				orderDetail.setDelyStat(false);
				
				orderDetail.setItemInfoVO( itemInfoVO);
				OrderDetailService_interface orderDetailSvc = new OrderDetailService();
				orderDetailSvc.insert(orderDetail);
				
//				購買物庫存減少(update)
//				 ItemInfoService_interface itemInfoSvc = new ItemInfoService();
//				itemInfoSvc.setItemInfoQty(Integer.parseInt(product[2])); -數量
//				Integer itemId = Integer.parseInt(product[0]);
//		        Integer quantityPurchased = Integer.parseInt(product[2]);
//
//		        //獲取當前物品訊息
//		        ItemInfoVO currentItemInfoVO  = itemInfoSvc.findByItemNo(itemId);
//		        if (itemInfoVO != null) {
//		            //計算新的庫存數量
//		            Integer newStockQty = itemInfoVO.getItemStockQty() - quantityPurchased;
//		            newStockQty = Math.max(newStockQty, 0); // 防止庫存數量變負數
//
//		            // 更新商品信息
//		            itemInfoVO.setItemStockQty(newStockQty);
//		            itemInfoSvc.update(itemInfoVO);
		        }
		    }
		}



//		    
//		    res.setContentType("application/json");
//		    res.setCharacterEncoding("UTF-8");


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

}
