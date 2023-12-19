package com.asap.group.controller;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.group.entity.GrpInfoVO;
import com.asap.group.entity.SportTypeVO;
import com.asap.group.service.GrpInfoService;
import com.asap.group.service.GrpInfoService_interface;

@MultipartConfig(fileSizeThreshold = 0 * 1024 * 1024, maxFileSize = 1 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
@WebServlet("/Grpinfo.do")
public class GrpInfoServlet extends HttpServlet {
	// 一個 servlet 實體對應一個 service 實體
	private GrpInfoService grpInfoService;
	private GrpInfoVO grpTempVo = new GrpInfoVO();
	@Override
	public void init() throws ServletException {
		grpInfoService = new GrpInfoService_interface();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String forwardPath = "";
		if (action != null) {
			switch (action) {
			// 查全部
			case "getAll":
				forwardPath = getAll(req, res);
				break;
			// 我發起的揪團
			case "mycreategrp":
				forwardPath = mycreategrp(req, res);
				break;

			// 詳細資訊
			case "detailsinfo":
				forwardPath = getGrpInfoVOBygrpNo(req, res);
				break;
			// 模糊查詢
			case "FuzzySearch":
				forwardPath = getByServiceFuzzySearch(req, res);
				break;
			// 新增揪團資訊-開啟
				
			case "creategroup":
				// type 0:新增 1:編輯(修改)
				if (req.getParameter("type").equals("1")) {
					//先把資料設定到欄位上
					creategrpupdate(req, res);
					//傳送給creategroup.jsp 判斷某些欄位要disabled
				}
				forwardPath = "/group/creategroup.jsp";
				break;
			// 新增揪團資訊-送出
			case "insertgrpInfo":
				forwardPath = grpInfoinsert(req, res);
				break;
			// 解散揪團update
			case "updatestatGrp":
				forwardPath = grpInfoupdate(req, res);
				break;
			// 編輯揪團資訊-修改按鈕
			case "updatecreategrp":
				forwardPath = creategrpupdate(req, res);
				break;
			// 首頁
			default:
				forwardPath = "/group/AllGroup.jsp";
			}
		} else {
			forwardPath = "/group/AllGroup.jsp";
		}
		if (forwardPath != "strError") {
			res.setContentType("text/html; charset=UTF-8");
			RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
			dispatcher.forward(req, res);
		}
	}

	// 首頁全部資料
	private String getAll(HttpServletRequest req, HttpServletResponse res) {
		List<GrpInfoVO> grpVOList = grpInfoService.getALL();
		req.setAttribute("grpVOList", grpVOList);

		return "/group/AllGroup.jsp";
	}
	
	// 我發起的揪團
	private String mycreategrp(HttpServletRequest req, HttpServletResponse res) {
		List<GrpInfoVO> grpVOList = grpInfoService.getALL();
		List<GrpInfoVO> grpVOTempList = new ArrayList<>();
		String sActNo = "M1206202300001";
		for (GrpInfoVO Vo : grpVOList) {
			String OrgMbrNo = Vo.getOrgMbrNo();
			
			if(OrgMbrNo.equals(sActNo)) 
			{
				grpVOTempList.add(Vo);
			}
		}
		grpVOList = grpVOTempList;
		req.setAttribute("grpVOList", grpVOList);

		return "/group/mycreateGroup.jsp";
	}

	// 揪團首頁搜尋框
	private String getByServiceFuzzySearch(HttpServletRequest req, HttpServletResponse res) {
		String searchkey = req.getParameter("grpInfoKeyword");
		List<GrpInfoVO> grpVOList;
		String type = req.getParameter("type");//0:全部 1:我的發起
		
		if (searchkey != null && !searchkey.isEmpty()) {
			grpVOList = grpInfoService.getByServiceFuzzySearch(searchkey);

		} else {
			grpVOList = grpInfoService.getALL();
		}
		if(type.equals("1")) {
			
			List<GrpInfoVO> grpVOTempList = new ArrayList<>();
			String sActNo = "M1206202300001";
			for(GrpInfoVO vo : grpVOList) {
				String OrgMbrNo = vo.getOrgMbrNo();
				if(OrgMbrNo.equals(sActNo)) {
					grpVOTempList.add(vo);
				}
			}
			grpVOList = grpVOTempList;
		}
		
		req.setAttribute("grpVOList", grpVOList);
		req.setAttribute("Skip", true);
		if(type.equals("1")) {
			return "/group/mycreateGroup.jsp";
		}
		return "/group/AllGroup.jsp";
	}
	// 發起揪團搜尋框
	private String getBySrvFuzzySearchcreate(HttpServletRequest req, HttpServletResponse res) {
		String searchkey = req.getParameter("grpInfoKeyword");
		List<GrpInfoVO> grpVOList;
		List<GrpInfoVO> grpVOTempList = new ArrayList<>();
		String sActNo = "M1206202300001";
		
		
		if (searchkey != null && !searchkey.isEmpty()) {
			grpVOList = grpInfoService.getByServiceFuzzySearch(searchkey);

		} else {
			grpVOList = grpInfoService.getALL();
		}
		for(GrpInfoVO vo : grpVOList) {
			String OrgMbrNo = vo.getOrgMbrNo();
			if(OrgMbrNo.equals(sActNo)) {
				grpVOTempList.add(vo);
			}
		}
		grpVOList = grpVOTempList;
		req.setAttribute("grpVOList", grpVOList);
		req.setAttribute("Skip", true);
		return "/group/AllGroup.jsp";
	}

	// 詳細資訊
	private String getGrpInfoVOBygrpNo(HttpServletRequest req, HttpServletResponse res) {
		String grpdetailsinfo = req.getParameter("grpdetailsinfo");
		Integer grpNo = 0;
		try {
			grpNo = Integer.parseInt(grpdetailsinfo);
		} catch (NumberFormatException e) {
			return "/group/AllGroup.jsp";
		}
		GrpInfoVO grpVODetail = grpInfoService.getGrpInfoVOBygrpNo(grpNo);
		req.setAttribute("grpVODetail", grpVODetail);

		//查詢詳細資料的時候把 GrpInfoVO 存起來
		grpTempVo = grpVODetail;
				
				
		return "/group/grpinfoOrgMbr.jsp";
	}

	// 到新增頁面
	private String grpInfoinsert(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		GrpInfoVO grpInfo = new GrpInfoVO();
		grpInfo = setGrpInfomethod(req);
		
		GrpInfoService grpInfoSvc = new GrpInfoService_interface();
		grpInfo = grpInfoSvc.insert(grpInfo);

		return "/group/AllGroup.jsp";

	}

	private String grpInfoupdate(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		GrpInfoVO grpInfo = new GrpInfoVO();

		// 揪團編號
		String grpNoParam = req.getParameter("GrpNo");
		// 發起人會員編號orgMbrNo
		if (grpNoParam != null && !grpNoParam.isEmpty()) {
			Integer infogrpNo = Integer.valueOf(grpNoParam);
			grpInfo.setGrpNo(infogrpNo);
		} else {
			return "strError";

		}
		// 參與狀態 0正常;1取消;2延期
		grpInfo.setGrpStat(1);

		GrpInfoService_interface grpInfoSvc = new GrpInfoService_interface();
		grpInfoSvc.update(grpInfo);

		return "/group/grpinfoOrgMbr.jsp";

	}

	private String creategrpupdate(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {

		//先把資料設定到欄位上
		req.setAttribute("type", "1");
		req.setAttribute("grpVO", grpTempVo);
		System.out.println(grpTempVo);
		//傳送給creategroup.jsp 判斷某些欄位要disabled
		return "/group/creategroup.jsp";

	}
	//設計讓insert跟update去呼叫setGrpInfomethod方法
	private GrpInfoVO setGrpInfomethod(HttpServletRequest req) throws IOException, ServletException {

		GrpInfoVO grpInfo = new GrpInfoVO();
		String strError = "";

		// 發起人(先用編號代替)(串會員資料)
		// grpInfo.setOrgMbrNo("M0059");
		grpInfo.setOrgMbrNo(req.getParameter("OrgMbrNo"));

		// =========發起人連絡電話=========(串會員資料)
		// =========發起人電子信箱=========(串會員資料)

		// 活動名稱OK
		// grpInfo.setGrpName("活動羽球");
		grpInfo.setGrpName(req.getParameter("GrpName"));

		// 運動種類
		// sportTypeNameParam = "8";
		String sportTypeNameParam = req.getParameter("SportTypeName");
		if (sportTypeNameParam != null && !sportTypeNameParam.isEmpty()) {
			Integer SportTypeName = Integer.valueOf(sportTypeNameParam);
			grpInfo.setSportTypeNo(SportTypeName);
		} else {
			strError = "strError";
		}
		// 活動日期OK
		java.sql.Date GrpDate = null;
		String grpDateParam = req.getParameter("GrpDate");

		try {
			DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // 設定日期格式
			LocalDate parsedDate = LocalDate.parse(grpDateParam, dateFormatter); // 解析字串為 LocalDate
			GrpDate = java.sql.Date.valueOf(parsedDate); // 將 LocalDate 轉換為 java.sql.Date

			grpInfo.setGrpDate(GrpDate);
		} catch (DateTimeParseException | IllegalArgumentException e) {
			GrpDate = new java.sql.Date(System.currentTimeMillis());
			strError = "strError";
		}

		// 活動開始時間
		java.sql.Time GrpStartTime = null;
		try {
			if (req.getParameter("GrpStartTime") != null && !req.getParameter("GrpStartTime").isEmpty()) {
				String grpStartTimeParam = req.getParameter("GrpStartTime");
				// User丟進時跟分
				LocalTime time = LocalTime.of(0, 0);
				
				time = LocalTime.parse(grpStartTimeParam, DateTimeFormatter.ofPattern("HH:mm"));

				// 補充秒數，這裡假設秒數為 0
				LocalTime withSeconds = time.withSecond(0);
				GrpStartTime = java.sql.Time.valueOf(withSeconds);
				grpInfo.setGrpStartTime(GrpStartTime);

			} else {
				strError = "strError";
			}
		} catch (IllegalArgumentException e) {
			GrpStartTime = new java.sql.Time(System.currentTimeMillis());
			strError = "strError";
		}

		// 活動結束時間
		// strTemp = "22:10:00";
		java.sql.Time GrpEndTime = null;
		try {	
			if (req.getParameter("GrpEndTime") != null && !req.getParameter("GrpEndTime").isEmpty()) {
				String grpEndTimeParam = req.getParameter("GrpEndTime");
				// User丟進時跟分
				// 補充秒數，這裡假設秒數為 0
				LocalTime time = LocalTime.of(0, 0);
				time = LocalTime.parse(grpEndTimeParam, DateTimeFormatter.ofPattern("HH:mm"));
				LocalTime withSeconds = time.withSecond(0);
				GrpEndTime = java.sql.Time.valueOf(withSeconds);
				grpInfo.setGrpEndTime(GrpEndTime);
			} else {
				strError = "strError";
			}
		} catch (IllegalArgumentException e) {
			GrpEndTime = new java.sql.Time(System.currentTimeMillis());
			strError = "strError";
		}

		// 最低人數
		// grpPplMinParam = "6";
		String grpPplMinParam = req.getParameter("GrpPplMin");

		if (grpPplMinParam != null && !grpPplMinParam.isEmpty()) {
			Integer GrpPplMin = Integer.valueOf(grpPplMinParam);
			grpInfo.setGrpPplMin(GrpPplMin);
		} else {
			strError = "最低人數轉型錯誤";
		}

		// 最高人數
		// grpPplLimitParam = "12";		
		String grpPplLimitParam = req.getParameter("GrpPplLimit");

		if (grpPplLimitParam != null && !grpPplLimitParam.isEmpty()) {
			Integer GrpPplLimit = Integer.valueOf(grpPplLimitParam);
			grpInfo.setGrpPplLimit(GrpPplLimit);
		} else {
			strError = "最高人數轉型錯誤";
		}
		// 活動地點
		// grpInfo.setGrpAddress("新北市三重");
		
		if (req.getParameter("GrpAddress") != null && !req.getParameter("GrpAddress").isEmpty()) {
			grpInfo.setGrpAddress(req.getParameter("GrpAddress"));

		} else {
			strError = "活動地點錯誤";
		}

		// grpInfo.setGrpSignStrTime(java.sql.Timestamp.valueOf("2023-10-01 09:00:00"));
		// grpInfo.setGrpSignEndTime(java.sql.Timestamp.valueOf("2023-10-29 09:30:00"));

		java.sql.Timestamp GrpSignStrTime = null;
		
		String strgrpSignStrDate = req.getParameter("GrpSignStrDate");
		String strgrpSignStrTime = req.getParameter("GrpSignStrTime");
		String strgrpSignEndDate = req.getParameter("GrpSignEndDate");
		String strgrpSignEndTime = req.getParameter("GrpSignEndTime");

		// LocalDateTime 格式化為需要的形式
		LocalDateTime startDateTime = LocalDateTime.parse(strgrpSignStrDate + "T" + strgrpSignStrTime);
		LocalDateTime endDateTime = LocalDateTime.parse(strgrpSignEndDate + "T" + strgrpSignEndTime);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedStartDateTime = startDateTime.format(formatter);
		String formattedEndDateTime = endDateTime.format(formatter);
		// 報名開始時間
		// strTemp = "2023-10-01 15:30:45";
		try {
			GrpSignStrTime = java.sql.Timestamp.valueOf(formattedStartDateTime);
			grpInfo.setGrpSignStrTime(GrpSignStrTime);
		} catch (IllegalArgumentException e) {
			GrpSignStrTime = new java.sql.Timestamp(System.currentTimeMillis());
			strError = "strError";
		}

		// 報名結束時間
		// strTemp = "2023-10-01 15:30:45";

		java.sql.Timestamp GrpSignEndTime = null;

		try {
			GrpSignEndTime = java.sql.Timestamp.valueOf(formattedEndDateTime);
			grpInfo.setGrpSignEndTime(GrpSignEndTime);
		} catch (IllegalArgumentException e) {
			GrpSignEndTime = new java.sql.Timestamp(System.currentTimeMillis());
			strError = "strError";
		}
		// 注意事項
		// grpInfo.setGrpNote("球拍");
		
		grpInfo.setGrpNote(req.getParameter("GrpNote"));

		// 圖片上傳
		
		InputStream in = req.getPart("GrpImg").getInputStream();
		byte[] GrpImg = null;
		try {
			if (in.available() != 0) {
				GrpImg = new byte[in.available()];
				in.read(GrpImg);
				in.close();
			} else {
				System.out.println("請上傳照片");
			}
		} catch (Exception e) {
			System.out.println("壞掉");
		}
		System.out.println(req.getPart("GrpImg"));
		grpInfo.setGrpImg(GrpImg);
		System.out.println("處理"+req.getPart("GrpImg"));
		// 活動狀態
		grpInfo.setGrpStat(0);

		return grpInfo;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}
}
