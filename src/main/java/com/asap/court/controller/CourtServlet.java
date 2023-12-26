package com.asap.court.controller;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.court.dao.CourtTypeDAO;
import com.asap.court.dao.SiteDAO;
import com.asap.court.entity.CourtImgVO;
import com.asap.court.entity.CourtTypeVO;
import com.asap.court.entity.CourtVO;
import com.asap.court.entity.SiteVO;
import com.asap.court.service.CourtClosedTimeService;
import com.asap.court.service.CourtClosedTimeService_interface;
import com.asap.court.service.CourtImgService;
import com.asap.court.service.CourtImgService_interface;
import com.asap.court.service.CourtService;
import com.asap.court.service.CourtService_interface;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 30 * 1024 * 1024)
@WebServlet("/court/court.do")
public class CourtServlet extends HttpServlet {
	private static final int PAGE_MAX_RESULT = 5;
	// 一個 servlet 實體對應一個 service 實體
	private CourtService_interface courtService_interface;
	private CourtImgService_interface courtImgService_interface;
	private CourtClosedTimeService_interface courtClosedTimeService_interface;

	@Override
	public void init() throws ServletException {
		courtService_interface = new CourtService();
		courtImgService_interface = new CourtImgService();
		courtClosedTimeService_interface = new CourtClosedTimeService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String forwardPath = "";
		switch (action) {
			case "getAll":
				forwardPath = getAllCourts(req, res);
				break;
			case "compositeQuery":
				forwardPath = getCompositeCourtsQuery(req, res);
				break;
			case "add":
				forwardPath = addCourt(req, res);
				break;
			case "delete":
				forwardPath = deleteCourt(req, res);
				break;
			case "getOne_For_Update":
				forwardPath = getOneForUpdate(req, res);
				break;
			case "update":
				forwardPath = updateCourt(req, res);
				break;
			case "namesearch":
				forwardPath = getCourtsByName(req, res);
				break;
			default:
				forwardPath = "/court_index.jsp";	
		}
		
		res.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
		dispatcher.forward(req, res);
	}



	// 選擇一筆修改
	private String getOneForUpdate(HttpServletRequest req, HttpServletResponse res) {
		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);
		
		Integer courtNo = Integer.valueOf(req.getParameter("courtNo"));
		req.setAttribute("courtVO", courtService_interface.getCourtByCourtNo(courtNo)); 	
		
		return "/court/updateCourt.jsp";
	}
	
	// 修改
	private String updateCourt(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);

		String name = req.getParameter("name");
		String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
		if (name == null || name.trim().length() == 0) {
			errorMsgs.add("場地名稱: 請勿空白");
		} else if(!name.trim().matches(enameReg)) { 
			errorMsgs.add("場地名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
        }

		String address = req.getParameter("address");
		if (address == null || address.trim().length() == 0) {
			errorMsgs.add("地址請勿空白");
		}	

		String lngStr = req.getParameter("lng");
		String lngReg = "^-?((\\d|[1-9]\\d|1[0-7]\\d)(\\.\\d{0,8})?|180(\\.?\\d{0,8})?)$";
		BigDecimal lng = null;
		if (lngStr == null || lngStr.trim().length() == 0) {
			errorMsgs.add("經度請勿空白或填入非數字");
		} else if(!lngStr.trim().matches(lngReg)) { 
			errorMsgs.add("經度: 請輸入 -180~180 度，最多允許到小數點後八位");
        }else {
        	lng = BigDecimal.valueOf(Double.valueOf(lngStr));
        }
		
	
		String latiStr = req.getParameter("lati");
		String latiReg = "^-?([0-8]?\\d(\\.\\d{0,8})?|90(\\.?\\d{0,8})?)$";
		BigDecimal lati = null;
		if (latiStr == null || latiStr.trim().length() == 0) {
			errorMsgs.add("緯度請勿空白或非填入數字");
		} else if(!latiStr.trim().matches(latiReg)) { 
			errorMsgs.add("緯度: 請輸入 -90~90 度，最多允許到小數點後八位");
        }else {
        	lati = BigDecimal.valueOf(Double.valueOf(latiStr));
        }
		 
		
		String courtText = req.getParameter("courtText");
		if (courtText == null || courtText.trim().length() == 0) {
			errorMsgs.add("場地介紹請勿空白");
		}	
		
		Integer pplLimit = null;
		try {
			pplLimit = Integer.valueOf(req.getParameter("pplLimit"));
			if(pplLimit<0) {
				errorMsgs.add("人數限制不可小於零");
			}
		} catch (NumberFormatException e) {
			pplLimit = 0;
		}
		
		Integer price = null;
		try {
			price = Integer.valueOf(req.getParameter("price"));
			if(price<0) {
				errorMsgs.add("價格不可小於零");
			}
		} catch (NumberFormatException e) {
			price = 0;
			errorMsgs.add("價格請填數字");
		}
		
		Integer type = null;
		try {
			type = Integer.valueOf(req.getParameter("type"));
		} catch (NumberFormatException e) {
			type = 0;
			errorMsgs.add("請填入類型");
		}
		
		
		Boolean indoor = Boolean.valueOf(req.getParameter("indoor"));
		
		Integer site = null;
		try {
			site = Integer.valueOf(req.getParameter("site"));
		} catch (NumberFormatException e) {
			pplLimit = 0;
			errorMsgs.add("請填入地點");
		}

		Boolean stat = Boolean.valueOf(req.getParameter("stat"));
		
		CourtTypeVO courtTypeVO = new CourtTypeVO(type);
        SiteVO siteVO = new SiteVO(site);
        
        Integer courtNo = Integer.valueOf(req.getParameter("courtNo"));
        
        // 照片修改
        List<CourtImgVO> courtImgVOs = courtImgService_interface.findByCourtNo(courtNo);
        // 照片1
        InputStream in1 = req.getPart("upFiles1").getInputStream();
		byte[] upFiles1 = null;
		if(in1.available()!=0){
			upFiles1 = new byte[in1.available()];
			in1.read(upFiles1);
			in1.close();
		}  else{
			upFiles1 = courtImgVOs.get(0).getCourtImg();
		}
		
		// 照片2
		InputStream in2 = req.getPart("upFiles2").getInputStream();
		byte[] upFiles2 = null;
		if(in2.available()!=0){
			upFiles2 = new byte[in2.available()];
			in2.read(upFiles2);
			in2.close();
		}  else{
			upFiles2 = courtImgVOs.get(1).getCourtImg();
		}
		
		// 照片3
		InputStream in3 = req.getPart("upFiles3").getInputStream();
		byte[] upFiles3 = null;
		if(in3.available()!=0){
			upFiles3 = new byte[in3.available()];
			in3.read(upFiles3);
			in3.close();
		}  else{
			upFiles3 = courtImgVOs.get(2).getCourtImg();
		}
		
		// 照片4
		InputStream in4 = req.getPart("upFiles4").getInputStream();
		byte[] upFiles4 = null;
		if(in4.available()!=0){
			upFiles4 = new byte[in4.available()];
			in4.read(upFiles4);
			in4.close();
		}  else{
			upFiles4 = courtImgVOs.get(3).getCourtImg();
		}
		
		
        
		 
        CourtVO courtVO = new CourtVO(courtNo, name, courtTypeVO, indoor, address, siteVO, lng, lati, courtText, pplLimit, price, stat);
		
		if (!errorMsgs.isEmpty()) {
			req.setAttribute("courtVO", courtVO); // 含有輸入格式錯誤的courtVO物件,也存入req
			return "/court/updateCourt.jsp"; //程式中斷
		}else {
			req.setAttribute("courtNoPass", courtNo);
			courtService_interface.update(courtVO);
			
			courtImgVOs.get(0).setCourtImg(upFiles1);
			courtImgService_interface.update(courtImgVOs.get(0));
			
			courtImgVOs.get(1).setCourtImg(upFiles2);
			courtImgService_interface.update(courtImgVOs.get(1));
			
			courtImgVOs.get(2).setCourtImg(upFiles3);
			courtImgService_interface.update(courtImgVOs.get(2));
			
			courtImgVOs.get(3).setCourtImg(upFiles4);
			courtImgService_interface.update(courtImgVOs.get(3));
			
			System.out.println(courtVO.toString());
			return "/court/listOneCourt.jsp";		
		}
	}

	// 刪除
	private String deleteCourt(HttpServletRequest req, HttpServletResponse res) {
		Integer courtNo = Integer.valueOf(req.getParameter("courtNo"));
		System.out.println(courtNo);
		
		List<CourtImgVO> courtImgVOs = courtImgService_interface.findByCourtNo(courtNo);
		for (CourtImgVO courtImgVO : courtImgVOs) {
			courtImgService_interface.delete(courtImgVO.getCourtImgNo());
		}
		courtService_interface.delete(courtNo);
		
		return "/court/listAllCourts_datatable_Ajax.html";
	}

	// 新增
	private String addCourt(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);
		
		String name = req.getParameter("name");
		String enameReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,20}$";
		if (name == null || name.trim().length() == 0) {
			errorMsgs.add("場地名稱: 請勿空白");
		} else if(!name.trim().matches(enameReg)) { 
			errorMsgs.add("場地名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到20之間");
        }
		
		Integer type = Integer.valueOf(req.getParameter("type"));
        Boolean indoor = Boolean.valueOf(req.getParameter("indoor"));
        String address = req.getParameter("address");
        if (address == null || address.trim().length() == 0) {
			errorMsgs.add("地址請勿空白");
		}	
        
        Integer site = Integer.valueOf(req.getParameter("site"));
        
        String lngStr = req.getParameter("lng");
        String lngReg = "^-?((\\d|[1-9]\\d|1[0-7]\\d)(\\.\\d{0,8})?|180(\\.?\\d{0,8})?)$";
		BigDecimal lng = null;
		if (lngStr == null || lngStr.trim().length() == 0) {
			errorMsgs.add("經度請勿空白或填入非數字");
		} else if(!lngStr.trim().matches(lngReg)) { 
			errorMsgs.add("經度: 請輸入 -180~180 度，最多允許到小數點後八位");
        }else {
        	lng = BigDecimal.valueOf(Double.valueOf(lngStr));
        }
		
		String latiStr = req.getParameter("lati");
		String latiReg = "^-?([0-8]?\\d(\\.\\d{0,8})?|90(\\.?\\d{0,8})?)$";
		BigDecimal lati = null;
		if (latiStr == null || latiStr.trim().length() == 0) {
			errorMsgs.add("緯度請勿空白或填入非數字");
		} else if(!latiStr.trim().matches(latiReg)) { 
			errorMsgs.add("緯度: 請輸入 -90~90 度，最多允許到小數點後八位");
        }else {
        	lati = BigDecimal.valueOf(Double.valueOf(latiStr));
        }
		
        String courtText = req.getParameter("courtText");
        if (courtText == null || courtText.trim().length() == 0) {
			errorMsgs.add("場地介紹請勿空白");
		}	
        
        Integer pplLimit = null;
        try {
			pplLimit = Integer.valueOf(req.getParameter("pplLimit"));
			if(pplLimit<0) {
				errorMsgs.add("人數限制不可小於零");
			}
		} catch (NumberFormatException e) {
			errorMsgs.add("人數限制請填數字");
			pplLimit = 0;
		}
        
        Integer price = null;
        try {
			price = Integer.valueOf(req.getParameter("price"));
			if(price<0) {
				errorMsgs.add("價格不可小於零");
			}
		} catch (NumberFormatException e) {
			price = 0;
			errorMsgs.add("價格請填數字");
		}
        
        Boolean stat = Boolean.valueOf(req.getParameter("stat"));
        
        // 照片1
        InputStream in1 = req.getPart("upFiles1").getInputStream();
		byte[] upFiles1 = null;
		if(in1.available()!=0){
			upFiles1 = new byte[in1.available()];
			in1.read(upFiles1);
			in1.close();
		}  else{
			System.out.println("請上傳照片");
		}
		
		// 照片2
		InputStream in2 = req.getPart("upFiles2").getInputStream();
		byte[] upFiles2 = null;
		if(in2.available()!=0){
			upFiles2 = new byte[in2.available()];
			in2.read(upFiles2);
			in2.close();
		}  else{
			System.out.println("請上傳照片");
		}
		// 照片3
		InputStream in3 = req.getPart("upFiles3").getInputStream();
		byte[] upFiles3 = null;
		if(in3.available()!=0){
			upFiles3 = new byte[in3.available()];
			in3.read(upFiles3);
			in3.close();
		}  else{
			System.out.println("請上傳照片");
		}
		// 照片4
		InputStream in4 = req.getPart("upFiles4").getInputStream();
		byte[] upFiles4 = null;
		if(in4.available()!=0){
			upFiles4 = new byte[in4.available()];
			in4.read(upFiles4);
			in4.close();
		}  else{
			System.out.println("請上傳照片");
		}
   
        CourtTypeVO courtTypeVO = new CourtTypeVO(type);	
        SiteVO siteVO = new SiteVO(site);					

        CourtVO courtVO = new CourtVO(name, courtTypeVO, indoor, address, siteVO, lng, lati, courtText, pplLimit, price, stat);    
        
        
        if (!errorMsgs.isEmpty()) {
			return "/court/addCourt.jsp"; //程式中斷
		}else {
			Integer courtNO = courtService_interface.add(courtVO);
			CourtVO courtVOnew = new CourtVO(courtNO);
			CourtImgVO courtImgVO1 = new CourtImgVO(courtVOnew, upFiles1);
			courtImgService_interface.insert(courtImgVO1);
			CourtImgVO courtImgVO2 = new CourtImgVO(courtVOnew, upFiles2);
			courtImgService_interface.insert(courtImgVO2);
			CourtImgVO courtImgVO3 = new CourtImgVO(courtVOnew, upFiles3);
			courtImgService_interface.insert(courtImgVO3);
			CourtImgVO courtImgVO4 = new CourtImgVO(courtVOnew, upFiles4);
			courtImgService_interface.insert(courtImgVO4);
			req.setAttribute("courtNoPass", courtNO);
			return "/court/listOneCourt.jsp";
		}
        
	}

	// 查全部、分頁
	private String getAllCourts(HttpServletRequest req, HttpServletResponse res) {
		String page = req.getParameter("page");
		int currentPage = (page == null) ? 1 : Integer.parseInt(page);
		
		List<CourtVO> courtList = courtService_interface.getAllCourts(currentPage);

		if (req.getSession().getAttribute("courtPageQty") == null) {
			int courtPageQty = courtService_interface.getTotalPage();
			req.getSession().setAttribute("courtPageQty", courtPageQty);
		}
		
		req.setAttribute("courtList", courtList);
		req.setAttribute("currentPage", currentPage);
		
		return "/court/listAllCourt.jsp";	
	}
	
	// 複合查詢
	private String getCompositeCourtsQuery(HttpServletRequest req, HttpServletResponse res){
		Map<String, String[]> map = req.getParameterMap();
		// 搜尋條件顯示
		String searchCon = "";
		String name = "";
		try {
			name = req.getParameter("searchCourt").trim();
		} catch (Exception e) {
			name ="";
		}
		
		String type = "";
		Integer courtTypeInteger = 0;
		try {
			courtTypeInteger = Integer.valueOf(req.getParameter("courtType").trim());
			CourtTypeDAO courtTypeDAO = new CourtTypeDAO();
			type = courtTypeDAO.getByPK(courtTypeInteger).getCourtType();
	
		} catch (Exception e) {
			type = "";
		}
		
		String regions = "";
		Integer siteInteger = 0;
		try {
			siteInteger = Integer.valueOf(req.getParameter("regions").trim());
			SiteDAO siteDAO = new SiteDAO();
			regions = siteDAO.findByPK(siteInteger).getRegions();
	
		} catch (Exception e) {
			regions = "";
		}
	
		searchCon = searchCon.concat(regions).concat(name).concat(type);
		
		System.out.println(map.values().toString());
		
		
		if(!("".equals(String.join(", ", map.get("chooseDate"))))
			&& String.join(", ", map.get("searchCourt")).equals("") 
			&& String.join(", ",map.get("courtType")).equals("") 
			&& String.join(", ",map.get("regions")).equals("")) {		// 只有接到時間資訊，找全部再用時間去篩
			Date chooseDate = java.sql.Date.valueOf(String.join(", ", map.get("chooseDate")) );
			Map<CourtVO, List<CourtImgVO>> cobineMap = new HashMap<>();
			List<CourtVO> courtAllList = courtService_interface.getAllCourts();
			List<CourtVO> courtSearchList = new ArrayList<>();
			
			for(CourtVO courtVO: courtAllList) {
				if(courtClosedTimeService_interface.findByDate(courtVO.getCourtNo(), chooseDate).size() != 10) {
					courtSearchList.add(courtVO);
				}
			}			
			for(CourtVO courtVO:courtSearchList) {
				cobineMap.put(courtVO, courtImgService_interface.findByCourtNo(courtVO.getCourtNo()));
			}
			
			int totalCourts = courtSearchList.size();
			int pageQty = totalCourts % PAGE_MAX_RESULT == 0 ? (totalCourts / PAGE_MAX_RESULT) : (totalCourts / PAGE_MAX_RESULT + 1);
			
			
			req.setAttribute("searchCon", searchCon);
			req.setAttribute("cobineMap", cobineMap);
			req.setAttribute("pageQty", pageQty);
			System.out.println("1");
			
			
		}else if(!("".equals(String.join(", ", map.get("chooseDate"))))){		// 有填時間，其他隨意
			// 將courtVO 和相對應的 courtImgVO List 放入一個 Map
			Date chooseDate = java.sql.Date.valueOf(String.join(", ", map.get("chooseDate")) );
			Map<CourtVO, List<CourtImgVO>> cobineMap = new HashMap<>();
			List<CourtVO> courtCompositeList = courtService_interface.getCourtsByCompositeQuery(map);
			List<CourtVO> courtSearchList = new ArrayList<>();
			
			for(CourtVO courtVO:courtCompositeList) {
				if(courtClosedTimeService_interface.findByDate(courtVO.getCourtNo(), chooseDate).size() != 10) {
					courtSearchList.add(courtVO);
				}
			}
			for(CourtVO courtVO:courtSearchList) {
				cobineMap.put(courtVO, courtImgService_interface.findByCourtNo(courtVO.getCourtNo()));
			}
			
			int totalCourts = courtSearchList.size();
			int pageQty = totalCourts % PAGE_MAX_RESULT == 0 ? (totalCourts / PAGE_MAX_RESULT) : (totalCourts / PAGE_MAX_RESULT + 1);
			
			req.setAttribute("searchCon", searchCon);
			req.setAttribute("cobineMap", cobineMap);
			req.setAttribute("pageQty", pageQty);
			System.out.println("2");

			
		}else if("".equals(String.join(", ", map.get("chooseDate")))
			&& (!String.join(", ", map.get("searchCourt")).equals("") 
			|| !String.join(", ",map.get("courtType")).equals("") 
			|| !String.join(", ",map.get("regions")).equals(""))){ 			// 時間沒填，其他隨意
			// 將courtVO 和相對應的 courtImgVO List 放入一個 Map
			Map<CourtVO, List<CourtImgVO>> cobineMap = new HashMap<>();
			List<CourtVO> courtSearchList = courtService_interface.getCourtsByCompositeQuery(map);
			for(CourtVO courtVO:courtSearchList) {
				cobineMap.put(courtVO, courtImgService_interface.findByCourtNo(courtVO.getCourtNo()));
			}
			
			int totalCourts = courtSearchList.size();
			int pageQty = totalCourts % PAGE_MAX_RESULT == 0 ? (totalCourts / PAGE_MAX_RESULT) : (totalCourts / PAGE_MAX_RESULT + 1);
			
			req.setAttribute("searchCon", searchCon);
			req.setAttribute("cobineMap", cobineMap);
			req.setAttribute("pageQty", pageQty);

			System.out.println("3");

		}else {	// 全部沒填
			System.out.println("4");
			return "/court/court_main.jsp";	
		}
		return "/court/court_main_search.jsp";	
	}
	
	// 用名稱找場地
	private String getCourtsByName(HttpServletRequest req, HttpServletResponse res) {
		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);
		
		String nameStr = req.getParameter("nameSearch");
		if (nameStr == null || nameStr.trim().length() == 0) {
			errorMsgs.add("請輸入查詢條件!");
		}
		
		
		if (!errorMsgs.isEmpty()) {
			return "/court/listAllCourt.jsp";
		}else {
			List<CourtVO> courtList = courtService_interface.getCourtsByCourtName(nameStr);
			req.setAttribute("courtList", courtList);
			return "/court/listSpecificCourts.jsp";	
		}
		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
