package com.asap.shop.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.service.ItemInfoService;
import com.asap.shop.service.ItemInfoService_interface;

/**
 * Servlet implementation class ItemInfoServlet
 */
@WebServlet("/shop/shop.do")
//public class ItemInfoServlet extends HttpServlet {
	// 一個 servlet 實體對應一個 service 實體
	private ItemInfoService_interface item_service = new ItemInfoService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");

		if ("getAll".equals(action)) {
			res.setContentType("text/html; charset=utf-8");
			// 驗證資料
			// 資料庫操作
			List<ItemInfoVO> itemlist = item_service.getAllItemInfos(1);
			// 傳回
			HttpSession session = req.getSession();
			session.setAttribute("itemlist", itemlist);
			res.sendRedirect(req.getContextPath() + "/shop/AllItem.jsp");
			return;

		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
