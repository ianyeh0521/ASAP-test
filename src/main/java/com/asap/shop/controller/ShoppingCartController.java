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

import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.entity.ShoppingCartVO;
import com.asap.shop.service.ShoppingCartService;
import com.asap.shop.service.ShoppingCartService_interface;
import com.google.gson.Gson;

/**
 * Servlet implementation class ShoppingCartController
 */
@WebServlet("/shop/ShoppingCartServlet")
public class ShoppingCartController extends HttpServlet {
	private ShoppingCartService_interface shoppingCartService;

	@Override
	public void init() throws ServletException {
		shoppingCartService = new ShoppingCartService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		switch (action) {
		case "addcart":
			insert(req, res);
			break;

		case "remove":
			remove(req, res);
			break;

		}
		res.setContentType("text/html; charset=UTF-8");
	}

	private void insert(HttpServletRequest req, HttpServletResponse res) throws IOException {

		String mbrNo = req.getParameter("mbrNo");
		Integer itemNo = Integer.valueOf(req.getParameter("itemNo"));
		String itemName = req.getParameter("itemName");
		Integer max = Integer.valueOf(req.getParameter("max"));

		ItemInfoVO itemInfo = new ItemInfoVO();
		itemInfo.setItemNo(itemNo);
		itemInfo.setItemStockQty(max);

		Integer itemqty = Integer.valueOf(req.getParameter("itemqty"));

		Integer result = shoppingCartService.insert(mbrNo, itemInfo, itemqty);

		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");

		Map<String, Integer> data = new HashMap<>();
		data.put("status", result);
		Gson gson = new Gson();
		String statusJson = gson.toJson(data);
		PrintWriter out = res.getWriter();
		out.write(statusJson);
		out.close();
	}

	private void remove(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer shoppingCartNo = Integer.valueOf(req.getParameter("shoppingCartNo"));

		ShoppingCartVO entity = shoppingCartService.findByPK(shoppingCartNo);

		String result = shoppingCartService.delete(entity);

		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		Gson gson = new Gson();
		String jsonResponse = gson.toJson(result);
		PrintWriter out = res.getWriter();
		out.print(jsonResponse);
		out.flush();
	}
}
