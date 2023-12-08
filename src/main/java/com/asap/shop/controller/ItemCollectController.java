package com.asap.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.shop.service.ItemCollectService_interface;
import com.asap.shop.service.OrderDetailService_interface;
import com.asap.shop.service.OrderService;
import com.asap.shop.service.OrderService_interface;
import com.asap.shop.service.ShoppingCartService;
import com.asap.shop.service.ShoppingCartService_interface;

@WebServlet("/ItemCollectController")
public class ItemCollectController extends HttpServlet {
	
	ItemCollectService_interface itemCollevtSvc;
	
	@Override
	public void init() throws ServletException {
		super.init();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    req.setCharacterEncoding("UTF-8");
	    
	    String action = req.getParameter("action");

	    if("add".equals(action)) {
	    	
	    	
	    	return;
	    }
	    
	    
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	
   
}