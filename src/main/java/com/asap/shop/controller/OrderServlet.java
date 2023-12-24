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
import com.asap.shop.service.ItemInfoService;
import com.asap.shop.service.ItemInfoService_interface;
import com.asap.shop.service.OrderDetailService;
import com.asap.shop.service.OrderDetailService_interface;
import com.asap.shop.service.OrderService;
import com.asap.shop.service.OrderService_interface;
import com.asap.shop.service.ShoppingCartService;

@WebServlet("/shop/OrderServlet")
public class OrderServlet extends HttpServlet {

	private OrderService_interface orderService;
	private ItemInfoService_interface itemInfoSvc;

	@Override
	public void init() throws ServletException {
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
			res.sendRedirect(forwardPath);
			break;
		case "deleteOrder":
			deleteOrder(req, res);

			break;
			
		}
		res.setContentType("text/html; charset=UTF-8");
	}

	private void deleteOrder(HttpServletRequest req, HttpServletResponse res) {
		Integer orderNo = Integer.valueOf(req.getParameter("orderNo"));
		OrderVO orderVO= orderService.findByPK(orderNo);
		orderVO.setOrderStat(4);
		orderService.update(orderVO);
		OrderDetailService_interface orderDetail= new OrderDetailService();

		List <OrderDetailVO> orderdetails = orderDetail.findByOrderNo(orderNo);
		for(OrderDetailVO orderitem: orderdetails) {
			Integer itemno= orderitem.getItemInfoVO().getItemNo();
			Integer itemqty= orderitem.getItemOrderQty();
			ItemInfoVO itemInfoVO= itemInfoSvc.findByItemNo(itemno);
			Integer inStock=itemInfoVO.getItemStockQty();
			itemInfoVO.setItemStockQty(inStock+itemqty);
			itemInfoSvc.update(itemInfoVO);
		}
		
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
				
				orderDetail.setItemInfoVO(itemInfoVO);
				OrderDetailService_interface orderDetailSvc = new OrderDetailService();
				orderDetailSvc.insert(orderDetail);
				
				Integer sold = Integer.parseInt(product[2]);
				ItemInfoVO itemInfo = itemInfoSvc.findByItemNo(Integer.parseInt(product[0]));
				Integer itemstockqty = itemInfo.getItemStockQty();
				Integer newStockQty = Math.max(itemstockqty-sold, 0);
				itemInfo.setItemStockQty(newStockQty);
				itemInfoSvc.update(itemInfo);
				
		        }
		    }
		return "/ASAP/shop/PendingOrder.jsp";
		}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

}
