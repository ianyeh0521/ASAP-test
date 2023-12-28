package com.asap.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.asap.shop.entity.ItemImgVO;
import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.service.ItemImgService;
import com.asap.shop.service.ItemInfoService;
import com.asap.shop.service.ItemInfoService_interface;
import com.google.gson.Gson;

@WebServlet("/shop/ItemInfoServlet")
public class ItemInfoServlet extends HttpServlet {
	private ItemInfoService_interface itemInfoService;
	private ItemImgService itemImgService;

	@Override
	public void init() throws ServletException {
		itemInfoService = new ItemInfoService();
		itemImgService = new ItemImgService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		switch (action) {
		case "orderby":
			orderByItemPrice(req, res);
			break;

		case "view_order":
			orderByItemView(req, res);
			break;

		case "new_order":
			orderByItemAddTime(req, res);
			break;

		case "search":
			getByFuzzySearch(req, res);
			break;

		case "category":
			getByCompositeQuery(req, res);
			break;

		case "increaseViewItem":
			increaseViewItem(req, res);
			break;

		case "getImg":
			getImgByItemNo(req, res);
			break;
			
		case "page":
			getpage(req, res);
			break;
			
		 case "getAllCountsByCategories":
			 getAllCountsByCategories(req, res);
	            break;
		}

		res.setContentType("text/html; charset=UTF-8");
//    		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
//    		dispatcher.forward(req, res);
	}

	private void increaseViewItem(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer itemId = Integer.valueOf(req.getParameter("itemNo"));
		ItemInfoVO iteminfo = itemInfoService.findByItemNo(itemId);
		itemInfoService.increaseItemView(iteminfo);

		// 更新會話中的近期瀏覽列表
		updateRecentlyViewed(req, iteminfo);

		res.sendRedirect("AsapShopProduct.jsp?itemNo=" + itemId);
	}

	private void updateRecentlyViewed(HttpServletRequest req, ItemInfoVO iteminfo) {
	    HttpSession session = req.getSession();
	    LinkedList<ItemInfoVO> recentlyViewed = (LinkedList<ItemInfoVO>) session.getAttribute("recentlyViewed");

	    if (recentlyViewed == null) {
	        recentlyViewed = new LinkedList<>();
	    }

	    // 檢查商品是否已經存在於列表中
	    int existingIndex = -1;
	    for (int i = 0; i < recentlyViewed.size(); i++) {
	        if (recentlyViewed.get(i).getItemNo().equals(iteminfo.getItemNo())) {
	            existingIndex = i;
	            break;
	        }
	    }

	    // 如果商品不在列表的前三個位置
	    if (existingIndex > 2 || existingIndex == -1) {
	        // 如果商品已經在列表中，先移除它
	        if (existingIndex != -1) {
	            recentlyViewed.remove(existingIndex);
	        }

	        // 將商品添加到列表開頭
	        recentlyViewed.addFirst(iteminfo);

	        // 保持列表只有最新的6個商品
	        if (recentlyViewed.size() > 6) {
	            recentlyViewed.removeLast();
	        }
	    }

	    session.setAttribute("recentlyViewed", recentlyViewed);
	}

	private void orderByItemAddTime(HttpServletRequest req, HttpServletResponse res) throws IOException {

		res.setContentType("text/html; charset=UTF-8");
		List<ItemInfoVO> itemInfo = itemInfoService.orderByItemAddTime();
		Gson gson = new Gson();
		String jsonString = gson.toJson(itemInfo);
		PrintWriter out = res.getWriter();
		out.write(jsonString);
		out.close();
		System.out.println(jsonString);
	}

	private void orderByItemPrice(HttpServletRequest req, HttpServletResponse res) throws IOException {

		res.setContentType("text/html; charset=UTF-8");
		Boolean Itemsort = Boolean.valueOf(req.getParameter("Itemsort"));
		List<ItemInfoVO> itemInfo = itemInfoService.orderByItemPrice(Itemsort);
		Gson gson = new Gson();
		String jsonString = gson.toJson(itemInfo);
		PrintWriter out = res.getWriter();
		out.write(jsonString);
		out.close();
		System.out.println(jsonString);
	}

	private void orderByItemView(HttpServletRequest req, HttpServletResponse res) throws IOException {

		res.setContentType("text/html; charset=UTF-8");
		List<ItemInfoVO> itemInfo = itemInfoService.orderByItemView();
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

	private void getByCompositeQuery(HttpServletRequest req, HttpServletResponse res) throws IOException {

		Map<String, String[]> paramMap = new HashMap<>();

		addParameterIfNotEmpty(req, paramMap, "ItemTypeNo", "itemType");
		addParameterIfNotEmpty(req, paramMap, "ItemSizeNo", "itemSize");
		addParameterIfNotEmpty(req, paramMap, "ItemStatNo", "itemStat");

		String minPrice = req.getParameter("minPrice");
		String maxPrice = req.getParameter("maxPrice");
		if (minPrice != null && !minPrice.trim().isEmpty()) {
			paramMap.put("minPrice", new String[] { minPrice });
		}
		if (maxPrice != null && !maxPrice.trim().isEmpty()) {
			paramMap.put("maxPrice", new String[] { maxPrice });
		}

		List<ItemInfoVO> itemInfoList = itemInfoService.getByCompositeQuery(paramMap);

		String json = new Gson().toJson(itemInfoList);
		res.setContentType("application/json; charset=UTF-8");

		try (PrintWriter out = res.getWriter()) {
			out.write(json);
		}
	}

	private void addParameterIfNotEmpty(HttpServletRequest req, Map<String, String[]> paramMap, String paramName,
			String mapKey) {
		String paramValue = req.getParameter(paramName);
		if (paramValue != null && !paramValue.trim().isEmpty()) {
			paramMap.put(mapKey, new String[] { paramValue });
		}
	}

	private void getImgByItemNo(HttpServletRequest req, HttpServletResponse res) throws IOException {

		String itemNoStr = req.getParameter("itemNo");
		Integer itemNo = Integer.parseInt(itemNoStr);

		List<ItemImgVO> itemImgList = itemImgService.findByItemNo(itemNo);
		for (ItemImgVO item : itemImgList) {
			if (item.getItemImgfront()) {
				byte[] imgData = item.getItemImg();

				res.setContentType("image/jpg"); // 根據照片格式進行調整
				res.getOutputStream().write(imgData);
			}
		}

	}

	 private void getAllCountsByCategories(HttpServletRequest req, HttpServletResponse res) throws IOException {
	        Map<String, Map<Integer, Integer>> allCounts = itemInfoService.getAllCountsByCategories();
	        String json = new Gson().toJson(allCounts);
	        res.setContentType("application/json; charset=UTF-8");
	        res.getWriter().write(json);
	    }


	private void getpage(HttpServletRequest req, HttpServletResponse res) throws IOException {
		List<ItemInfoVO> list = itemInfoService.getAll();
		Gson gson = new Gson();
		String json = gson.toJson(list);
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
