package com.asap.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.shop.entity.OrderDetailVO;
import com.asap.shop.service.OrderDetailService;
import com.asap.shop.service.OrderDetailService_interface;
import com.google.gson.Gson;

/**
 * Servlet implementation class OrderDetailServlet
 */
@WebServlet("/shop/OrderDetailServlet")
public class OrderDetailServlet extends HttpServlet {
	private OrderDetailService_interface orderDetailService;

	@Override
	public void init() throws ServletException {
		orderDetailService = new OrderDetailService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		switch (action) {
		case "getOrderDetail":
			getOrderDetail(req, res);
			break;

		}

		res.setContentType("text/html; charset=UTF-8");
	}	
	
	private void getOrderDetail(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer orderno= Integer.valueOf(req.getParameter("orderNo"));
		List<OrderDetailVO> data= orderDetailService.findByOrderNo(orderno);
		res.setContentType("application/json; charset=UTF-8");
		Gson gson= new Gson();
		String ordDetailJson=gson.toJson(data);
		PrintWriter out = res.getWriter();
		System.out.println(ordDetailJson);
        out.write(ordDetailJson);          
        out.close(); 
		
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}


}
