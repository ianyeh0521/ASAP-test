package com.asap.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.service.ItemCollectService;
import com.asap.shop.service.ItemCollectService_interface;
import com.google.gson.Gson;

@WebServlet("/ItemCollectController")
public class ItemCollectServlet extends HttpServlet {
	
	private ItemCollectService_interface itemCollectService;
	

	@Override
	public void init() throws ServletException {
		itemCollectService = new ItemCollectService();
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
		  // 获取请求参数
	    String mbrNo = req.getParameter("mbrNo"); // 会员号
	    Integer itemNo = Integer.valueOf(req.getParameter("itemNo")); // 商品编号
	    String itemName = req.getParameter("itemName"); // 商品名称
	    
	    // ... 其他需要的参数

	    // 创建ItemInfoVO实例
	    ItemInfoVO itemInfo = new ItemInfoVO(itemNo, itemName, itemName, null, null, itemName, itemNo, itemNo, itemNo, null, itemNo, itemNo, null, null);

	    // 获取商品数量
	    Integer itemqty = Integer.valueOf(req.getParameter("itemqty"));

	    // 调用购物车服务层添加商品
	    Integer result = ItemCollectService.insert(mbrNo, itemInfo, itemqty);

	    // 响应处理
	    // 设置响应类型和编码
	    res.setContentType("application/json");
	    res.setCharacterEncoding("UTF-8");

	    // 使用Gson生成JSON响应
	    Gson gson = new Gson();
	    String jsonResponse = gson.toJson(result);
	    PrintWriter out = res.getWriter();
	    out.print(jsonResponse);
	    out.flush();
	}
}
