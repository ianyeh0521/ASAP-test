package com.asap.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.shop.entity.ItemCollectVO;
import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.service.ItemCollectService;
import com.asap.shop.service.ItemCollectService_interface;
import com.asap.shop.service.OrderDetailService_interface;
import com.asap.shop.service.OrderService;
import com.asap.shop.service.OrderService_interface;
import com.asap.shop.service.ShoppingCartService;
import com.asap.shop.service.ShoppingCartService_interface;
import com.google.gson.Gson;

@WebServlet("/shop/ItemCollectController")
public class ItemCollectController extends HttpServlet {
	
	ItemCollectService_interface itemCollevtSvc;
	
	@Override
	public void init() throws ServletException {
		itemCollevtSvc= new ItemCollectService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    req.setCharacterEncoding("UTF-8");
	    
	    String action = req.getParameter("action");

	    if("deletesave".equals(action)) {
	    	deletesave(req, resp);
	    	
	    }else if("wishlist".equals(action)) {
	    	addwishlist(req, resp);
	    	
	    }else if("checkwishlist".equals(action)) {
	    	checkwishlist(req, resp);
	    	
	    }
	    
	    
	}

	private void checkwishlist(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Integer itemno = Integer.parseInt(req.getParameter("itemNo"));
		String mbrNo = req.getParameter("mbrNo");
		ItemCollectVO entity = new ItemCollectVO();
		ItemInfoVO infoEntity= new ItemInfoVO(itemno);
		entity.setMbrNo(mbrNo);
		entity.setItemInfoVO(infoEntity);
		Integer status= itemCollevtSvc.checkCollect(entity);
		Map<String, Integer> data = new HashMap<>();
		data.put("status", status);
		Gson gson= new Gson();
		String statusJson=gson.toJson(data);
		PrintWriter out = resp.getWriter();
        out.write(statusJson);          
        out.close();
		
	}

	private void addwishlist(HttpServletRequest req, HttpServletResponse resp) {
		Integer itemno = Integer.parseInt(req.getParameter("itemNo"));
		String mbrNo = req.getParameter("mbrNo");
		ItemCollectVO entity = new ItemCollectVO();
		ItemInfoVO infoEntity= new ItemInfoVO(itemno);
		entity.setMbrNo(mbrNo);
		entity.setItemInfoVO(infoEntity);
		itemCollevtSvc.insert(entity);
		
	}

	private void deletesave(HttpServletRequest req, HttpServletResponse resp) {
		Integer collectno = Integer.parseInt(req.getParameter("collectno"));
		ItemCollectVO entity= new ItemCollectVO();
		entity.setItemCollectNo(collectno);
		itemCollevtSvc.delete(entity);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	
   
}