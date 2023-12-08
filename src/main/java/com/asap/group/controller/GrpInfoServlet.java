package com.asap.group.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.group.entity.GrpInfoVO;
import com.asap.group.service.GrpInfoService;
import com.asap.group.service.GrpInfoService_interface;

@WebServlet("/Grpinfo.do")
public class GrpInfoServlet extends HttpServlet {
	// 一個 servlet 實體對應一個 service 實體
	private GrpInfoService grpInfoService;

	@Override
	public void init() throws ServletException {
		grpInfoService = new GrpInfoService_interface();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String forwardPath = "";
	if(action!=null) {
		switch (action) {
			//查全部
			case "getAll":
				forwardPath = getAll(req, res);
				break;
			//詳細資訊
			case "detailsinfo": 
				forwardPath = getGrpInfoVOBygrpNo(req, res);
				break;
			//模糊查詢
			case "FuzzySearch":
				forwardPath = getByServiceFuzzySearch(req, res);
				break;
			//新增揪團資訊
			case "insertgrpInfo":
				forwardPath = insert(req, res);
				break;
				
			//首頁
			default:
				forwardPath = "/group/AllGroup.jsp";
		}
	}else {
		forwardPath = "/group/AllGroup.jsp";
	}
		
		res.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
		dispatcher.forward(req, res);
	}

	//首頁全部資料
	private String getAll(HttpServletRequest req, HttpServletResponse res) {
		List<GrpInfoVO> grpVOList = grpInfoService.getALL();
		req.setAttribute("grpVOList", grpVOList);
		
		return "/group/AllGroup.jsp";
	}
	
	//首頁搜尋框
	private String getByServiceFuzzySearch(HttpServletRequest req, HttpServletResponse res) {
		String searchkey = req.getParameter("grpInfoKeyword");
		List<GrpInfoVO> grpVOList; 	
		if(searchkey != null && !searchkey.isEmpty()) {
			grpVOList = grpInfoService.getByServiceFuzzySearch(searchkey);		
		}else {
			grpVOList = grpInfoService.getALL();	
		}
		req.setAttribute("grpVOList", grpVOList);
		
		
		return "/group/AllGroup.jsp";
	}

	
	//詳細資訊
	private String getGrpInfoVOBygrpNo(HttpServletRequest req, HttpServletResponse res) {
		String grpdetailsinfo = req.getParameter("grpdetailsinfo");
		Integer grpNo = 0;
		try {
			grpNo = Integer.parseInt(grpdetailsinfo);
		}
		catch (NumberFormatException e) {
			return "/group/grpinfoOrgMbr.jsp";
		}
		List<GrpInfoVO> grpVODetailList = grpInfoService.getGrpInfoVOBygrpNo(grpNo);
		GrpInfoVO grpVODetail = grpVODetailList.get(0);
		req.setAttribute("grpVODetail", grpVODetail);
		System.out.println("----------TEST---------  grpNo:" + grpNo);

		return "/group/grpinfoOrgMbr.jsp";
		
		
		
		//String grp = req.getParameter("grpno");
//		Integer grpNo = Integer.parseInt(grp);
//		List<GrpInfoVO> grpVOList = grpInfoService.getGrpInfoVOBygrpNo(grpNo);
//		System.out.println(grpVOList);
//		req.setAttribute("grpVOList", grpVOList);
//		
//		return "/group/AllGroup.jsp";
	}
	
	
	
	

	private String getServiceQuery(HttpServletRequest req, HttpServletResponse res) {
		
		
		
		
		
		
	return "/grpinfoOrgMbr.jsp";
	}
	//到新增頁面
	private String insert(HttpServletRequest req, HttpServletResponse res) {
		//點擊首頁的發起揪團 return到新增頁面
//		String MbrName = req.getParameter("MbrName");
//		String MbrPhone = req.getParameter("MbrPhone");
//		String MbrEmail = req.getParameter("MbrEmail");
//		String GrpName = req.getParameter("GrpName");
//		String SportTypeName = req.getParameter("SportTypeName");
//		String GrpDate = req.getParameter("GrpDate");
//		String GrpStartTime = req.getParameter("GrpStartTime");
//		String GrpEndTime = req.getParameter("GrpEndTime");
//		String GrpPplMin = req.getParameter("GrpPplMin");
//		String GrpPplLimit = req.getParameter("GrpPplLimit");
//		String GrpAddress1 = req.getParameter("GrpAddress1");
//		String GrpAddress2 = req.getParameter("GrpAddress2");
//		String GrpImg = req.getParameter("GrpImg");
//		String GrpNote = req.getParameter("GrpNote");

//		List<GrpInfoVO> grpVODetailList = grpInfoService.insert();
		
		
		
		
		return "/group/creategroup.jsp";
		
		
		
	}
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
		
		
	}
}
