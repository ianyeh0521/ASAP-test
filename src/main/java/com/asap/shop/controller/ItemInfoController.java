package com.asap.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.shop.service.ItemInfoService;
import com.asap.shop.service.ItemInfoService_interface;

import com.asap.shop.service.ItemInfoService_interface;

@WebServlet("/ItemInfoController")
public class ItemInfoController extends HttpServlet {
	
	ItemInfoService_interface itemInfoSvc;
	
	@Override
	public void init() throws ServletException {
		super.init();
		itemInfoSvc = new ItemInfoService();
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