package com.asap.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.service.ItemInfoService;

@WebServlet("/ProductServlet")
public class ItemInfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 此處應實作從資料庫中獲取商品資訊的邏輯
    	ItemInfoDAO_interface yourItemInfoDAO = new ItemInfoDAO();  // Replace with actual implementation
    	ItemInfoService itemInfoService = new ItemInfoService(yourItemInfoDAO);

    	List<ItemInfoVO> allItemInfo = itemInfoService.getAllItemInfo();

        // 將商品資訊存放到 request 屬性中
        request.setAttribute("itemInfoList", itemInfoList);

        // 導向到 JSP 檔案
        RequestDispatcher dispatcher = request.getRequestDispatcher("AsapShop.jsp");
        dispatcher.forward(request, response);
    }
}