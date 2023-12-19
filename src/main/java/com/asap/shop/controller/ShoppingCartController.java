package com.asap.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		}
		res.setContentType("text/html; charset=UTF-8");
	}

	private void insert(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer itemNo = Integer.valueOf(req.getParameter("itemNo"));
		Integer itemqty = Integer.valueOf(req.getParameter("itemqty"));
		Integer addcartResults = shoppingCartService.insert("M1", itemNo, itemqty);
		System.out.println("success");
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}

}
