package com.asap.shop.controller;

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
//    		String forwardPath = "";
    		switch (action) {
    			case "orderby":
    				getItemInfoByPriceOrder(req, res);
//    				forwardPath = getAllEmps(req, res);
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
    	
		}

//		private String getAllEmps(HttpServletRequest req, HttpServletResponse res) {
//    		String page = req.getParameter("page");
//    		int currentPage = (page == null) ? 1 : Integer.parseInt(page);
//    		
//    		List<Emp> empList = empService.getAllEmps(currentPage);
//
//    		if (req.getSession().getAttribute("empPageQty") == null) {
//    			int empPageQty = empService.getPageTotal();
//    			req.getSession().setAttribute("empPageQty", empPageQty);
//    		}
//    		
//    		req.setAttribute("empList", empList);
//    		req.setAttribute("currentPage", currentPage);
//    		
//    		return "/emp/listAllEmps.jsp";
//    	}
    	
//    	private String getCompositeEmpsQuery(HttpServletRequest req, HttpServletResponse res) {
//    		Map<String, String[]> map = req.getParameterMap();
//    		
//    		if (map != null) {
//    			List<Emp> empList = empService.getEmpsByCompositeQuery(map);
//    			req.setAttribute("empList", empList);
//    		} else {
//    			return "/index.jsp";
//    		}
//    		return "/emp/listCompositeQueryEmps.jsp";
//    	}
    	
    	
    	@Override
    	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    		doPost(req, res);
    	}
    }