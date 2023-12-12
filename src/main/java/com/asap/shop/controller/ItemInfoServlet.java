package com.asap.shop.controller;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.service.ItemInfoService;
import com.asap.shop.service.ItemInfoService_interface;
import com.google.gson.Gson;

@WebServlet("/shop/ItemInfoServlet")
public class ItemInfoServlet extends HttpServlet {
    	private ItemInfoService_interface itemInfoService;

    	@Override
    	public void init() throws ServletException {
    		itemInfoService = new ItemInfoService();
    	}

    	@Override
    	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	    req.setCharacterEncoding("UTF-8");
    	    String action = req.getParameter("action");

    	    // 检查action是否为null
    	    if (action == null) {
    	        // 如果 action 为空，尝试获取 'q' 参数以启用模糊搜索
    	        String searchQuery = req.getParameter("q");
    	        if (searchQuery != null) {
    	            getByFuzzySearch(req, res);
    	            return;
    	        }
    	        action = ""; // 如果没有 'action' 和 'q'，选择其他默认值
    	    }
    		switch (action) {
    			case "orderby":
    				getItemInfoByPriceOrder(req, res);
//    				forwardPath = getAllEmps(req, res);
    				break;		
    				
    			 case "view_order": 
    			        getItemInfoByViewOrder(req, res);
    			        break;
    				
    			case "search":
    				getByFuzzySearch(req, res);
                    break;
//    			case "compositeQuery":
//    				forwardPath = getCompositeEmpsQuery(req, res);
//    				break;
//    			default:
//    				forwardPath = "/index.jsp";
    		}
    		
    		res.setContentType("text/html; charset=UTF-8");
//    		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
//    		dispatcher.forward(req, res);
    	}
    	
    	private void getItemInfoByPriceOrder(HttpServletRequest req, HttpServletResponse res) throws IOException {
    		
    		Boolean Itemsort = Boolean.valueOf(req.getParameter("Itemsort"));
    		List<ItemInfoVO> itemInfo= itemInfoService.getItemInfoByPriceOrder(Itemsort);
    		Gson gson = new Gson();
    		String jsonString = gson.toJson(itemInfo);
    		PrintWriter out = res.getWriter();
            out.write(jsonString);
            out.close();
            System.out.println(jsonString);
		}

    	private void getItemInfoByViewOrder(HttpServletRequest req, HttpServletResponse res) throws IOException {

    	    List<ItemInfoVO> itemInfo = itemInfoService.getItemInfoByViewOrder();
    	    Gson gson = new Gson();
    	    String jsonString = gson.toJson(itemInfo);
    	    PrintWriter out = res.getWriter();
    	    out.write(jsonString);
    	    out.close();
    	    System.out.println(jsonString);
    	}
    	
    	
    	private void getByFuzzySearch(HttpServletRequest req, HttpServletResponse res) throws IOException {
    	    String searchQuery = req.getParameter("q");
    	    List<ItemInfoVO> searchResults = itemInfoService.getByFuzzySearch(searchQuery);
    	    Gson gson = new Gson();
    	    String json = gson.toJson(searchResults);
    	    res.setContentType("application/json; charset=UTF-8");
    	    PrintWriter out = res.getWriter();
    	    out.write(json);
    	    out.close();
    	}
    	
    	
    	@Override
    	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    		doPost(req, res);
    	}
    }