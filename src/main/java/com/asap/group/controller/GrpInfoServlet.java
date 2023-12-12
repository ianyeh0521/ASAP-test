package com.asap.group.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
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
			//新增揪團資訊-開啟
			case "creategroup":
				forwardPath = "/group/creategroup.jsp";
				break;
			//新增揪團資訊-送出
			case "insertgrpInfo":
				forwardPath = grpInfoinsert(req, res);
				break;
			//首頁
			default:
				forwardPath = "/group/AllGroup.jsp";
		}
	}else {
		forwardPath = "/group/AllGroup.jsp";
	}
	if (forwardPath != "strError")
	{
		res.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
		dispatcher.forward(req, res);
	}
	}

	//首頁全部資料
	private String getAll(HttpServletRequest req, HttpServletResponse res) {
		List<GrpInfoVO> grpVOList = grpInfoService.getALL();
		req.setAttribute("grpVOList", grpVOList);
		
		return "/group/AllGroup.jsp";
	}
	
	//首頁搜尋框
	private String getByServiceFuzzySearch(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("---------首頁搜尋---------");
		String searchkey = req.getParameter("grpInfoKeyword");
		List<GrpInfoVO> grpVOList; 	
		if(searchkey != null && !searchkey.isEmpty()) {
			System.out.println("---------首頁搜尋getByServiceFuzzySearch---------");
			grpVOList = grpInfoService.getByServiceFuzzySearch(searchkey);		
			
		}else {
			System.out.println("---------首頁搜尋getALL---------");
			grpVOList = grpInfoService.getALL();	
			
		}

		
		for (GrpInfoVO List : grpVOList) {
		    System.out.println("List: "+List);
		}
		req.setAttribute("grpVOList", grpVOList);
		req.setAttribute("Skip", true);
		return "/group/AllGroup.jsp";
	}

	
	//詳細資訊
	private String getGrpInfoVOBygrpNo(HttpServletRequest req, HttpServletResponse res) {
		String grpdetailsinfo = req.getParameter("grpdetailsinfo");
		Integer grpNo = 0;
		try {
			System.out.println("----------TEST---------  grpdetailsinfo: " + grpdetailsinfo);
			grpNo = Integer.parseInt(grpdetailsinfo);
		}
		catch (NumberFormatException e) {
			System.out.println("----------TEST---------  NumberFormatException");
			return "/group/AllGroup.jsp";			
		}
		System.out.println("----------TEST---------  getGrpInfoVOBygrpNo");
		GrpInfoVO grpVODetail= grpInfoService.getGrpInfoVOBygrpNo(grpNo);
		//GrpInfoVO grpVODetail = grpVODetailList.get(0);
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
	private String grpInfoinsert(HttpServletRequest req, HttpServletResponse res) {
		//點擊首頁的發起揪團 return到新增頁面
		GrpInfoVO grpInfo = new GrpInfoVO();
		
		String strError = "";
		String strTemp = "";

		//發起人編號OK
		grpInfo.setOrgMbrNo(req.getParameter("OrgMbrNo"));
//		grpInfo.setOrgMbrNo("M0059");
		
		//運動種類OK
		String sportTypeNameParam = req.getParameter("SportTypeName");
//		sportTypeNameParam = "8";
		if (sportTypeNameParam != null && !sportTypeNameParam.isEmpty()) {
		    Integer SportTypeName = Integer.valueOf(sportTypeNameParam);
		    grpInfo.setSportTypeNo(SportTypeName);
		} else {
		    strError = "運動種類轉型錯誤";
		    return "strError";
		}
//		
//		grpInfo.setGrpName("羽球,男女不限喔");
//		grpInfo.setGrpDate(java.sql.Date.valueOf("2023-10-31"));
//		grpInfo.setGrpStartTime(java.sql.Time.valueOf("13:10:00"));
//		grpInfo.setGrpEndTime(java.sql.Time.valueOf("15:06:00"));
		
		//活動名稱OK
		grpInfo.setGrpName(req.getParameter("GrpName"));
//		grpInfo.setGrpName("活動羽球");
		
		//活動日期OK
		java.sql.Date GrpDate = null;
		String grpDateParam = req.getParameter("GrpDate");
//		grpDateParam = "2023-10-31";
		try {
			GrpDate = java.sql.Date.valueOf(grpDateParam);
			grpInfo.setGrpDate(GrpDate);
		} catch (IllegalArgumentException e) {
			GrpDate = new java.sql.Date(System.currentTimeMillis());
			return "strError";
		}
		//活動開始時間
		java.sql.Time GrpStartTime = null;
//		strTemp = "20:10:00";
		try {
			if(req.getParameter("GrpStartTime") != null && !req.getParameter("GrpStartTime").isEmpty())
			{
				String grpStartTimeParam = req.getParameter("GrpStartTime");
			//User丟進時跟分
			LocalTime time = LocalTime.parse(grpStartTimeParam, DateTimeFormatter.ofPattern("HH:mm"));
			//補充秒數，這裡假設秒數為 0
			LocalTime withSeconds = time.withSecond(0); 
			GrpStartTime = java.sql.Time.valueOf(withSeconds);
			grpInfo.setGrpStartTime(GrpStartTime);
			
			}else {
				return "strError";
			}
		} catch (IllegalArgumentException  e) {
			GrpStartTime = new java.sql.Time(System.currentTimeMillis());
			return "strError";
		}
		
		
		//活動結束時間
		java.sql.Time GrpEndTime = null;
//		strTemp = "22:10:00";
		try {
			if(req.getParameter("GrpEndTime") != null && !req.getParameter("GrpEndTime").isEmpty())
			{
				String grpEndTimeParam = req.getParameter("GrpEndTime");
				//User丟進時跟分
				LocalTime time = LocalTime.parse(grpEndTimeParam, DateTimeFormatter.ofPattern("HH:mm"));
				//補充秒數，這裡假設秒數為 0
				LocalTime withSeconds = time.withSecond(0); 	
				
				GrpEndTime = java.sql.Time.valueOf(withSeconds);
				grpInfo.setGrpEndTime(GrpEndTime);
			}
			else {
				return "strError";
			}
		} catch (IllegalArgumentException  e) {
			GrpEndTime = new java.sql.Time(System.currentTimeMillis());
			return "strError";
		}
//		grpInfo.setGrpAddress("新北市三重");
//		grpInfo.setGrpPplLimit(8);
//		grpInfo.setGrpPplMin(4);
		
		//最低人數
		String grpPplMinParam = req.getParameter("GrpPplMin");
//		grpPplMinParam = "6";
		if (grpPplMinParam != null && !grpPplMinParam.isEmpty()) {
		    Integer GrpPplMin = Integer.valueOf(grpPplMinParam);
		    grpInfo.setGrpPplMin(GrpPplMin);
		} else {
			strError = "最低人數轉型錯誤";
			return "strError";
		}

		//最高人數
		String grpPplLimitParam = req.getParameter("GrpPplLimit");
//		grpPplLimitParam = "12";
		if (grpPplLimitParam != null && !grpPplLimitParam.isEmpty()) {
		    Integer GrpPplLimit = Integer.valueOf(grpPplLimitParam);
		    grpInfo.setGrpPplLimit(GrpPplLimit);
		} else {
			strError = "最高人數轉型錯誤";
			return "strError";
		}
		//活動地點
		if (req.getParameter("GrpAddress") != null && !req.getParameter("GrpAddress").isEmpty())
		{
			grpInfo.setGrpAddress(req.getParameter("GrpAddress"));	
	
		} else {
			strError = "活動地點錯誤";
			return "strError";
		}
		
		
		
		
		
		
		
	//	grpInfo.setGrpSignStrTime(java.sql.Timestamp.valueOf("2023-10-01 09:00:00"));
	//	grpInfo.setGrpSignEndTime(java.sql.Timestamp.valueOf("2023-10-29 09:30:00"));

		
		java.sql.Timestamp GrpSignStrTime = null;
		String strgrpSignStrDate = req.getParameter("GrpSignStrDate");
		String strgrpSignStrTime = req.getParameter("GrpSignStrTime");
		String strgrpSignEndDate = req.getParameter("GrpSignEndDate");
		String strgrpSignEndTime = req.getParameter("GrpSignEndTime");
		
		
		//LocalDateTime 格式化為需要的形式
		LocalDateTime startDateTime = LocalDateTime.parse(strgrpSignStrDate + "T" + strgrpSignStrTime);
		LocalDateTime endDateTime = LocalDateTime.parse(strgrpSignEndDate + "T" + strgrpSignEndTime);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedStartDateTime = startDateTime.format(formatter);
		String formattedEndDateTime = endDateTime.format(formatter);
		
		//報名開始時間OK
//		strTemp = "2023-10-01 15:30:45";
		try {
			GrpSignStrTime = java.sql.Timestamp.valueOf(formattedStartDateTime);
			grpInfo.setGrpSignStrTime(GrpSignStrTime);
		} catch (IllegalArgumentException  e) {
			GrpSignStrTime = new java.sql.Timestamp(System.currentTimeMillis());
			return "strError";
		}
		
		//報名結束時間OK
		java.sql.Timestamp GrpSignEndTime = null;
//		strTemp = "2023-10-01 15:30:45";
		try {
			GrpSignEndTime = java.sql.Timestamp.valueOf(formattedEndDateTime);
			grpInfo.setGrpSignEndTime(GrpSignEndTime);
		} catch (IllegalArgumentException  e) {
			GrpSignEndTime = new java.sql.Timestamp(System.currentTimeMillis());
			return "strError";
		}
		//注意事項
		grpInfo.setGrpNote(req.getParameter("GrpNote"));
		//grpInfo.setGrpNote("球拍");
		
		grpInfo.setGrpImg(null);
		grpInfo.setGrpStat(0);
		
//		List<GrpInfoVO> grpVODetailList = grpInfoService.insert();
		
		
		GrpInfoService grpInfoSvc = new GrpInfoService_interface();
		grpInfo = grpInfoSvc.insert(grpInfo);

		return "/group/AllGroup.jsp";
		
	}
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
		
		
	}
}
