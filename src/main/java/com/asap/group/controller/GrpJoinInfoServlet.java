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
import com.asap.group.entity.GrpJoinInfoVO;
import com.asap.group.service.GrpInfoService;
import com.asap.group.service.GrpInfoService_interface;
import com.asap.group.service.GrpJoinInfoService_interface;

@WebServlet("/GrpJoinInfo.do")
public class GrpJoinInfoServlet extends HttpServlet {
	private GrpJoinInfoService_interface grpJoinInfoService_interface;

	@Override
	public void init() throws ServletException {
		grpJoinInfoService_interface = new GrpJoinInfoService_interface();

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String forwardPath = "";

		switch (action) {
		// 報名-新增到參與人資訊
		case "insertGrpJoinInfoNo":
			forwardPath = grpJoinInfoinsert(req, res);
			break;
		// 退出-修改參與人狀態
		case "updateGrpJoinInfoNo":
			forwardPath = grpJoinInfoupdate(req, res);
			break;

		default:
			forwardPath = "/group/AllGroup.jsp";
		}

		res.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
		dispatcher.forward(req, res);
	}

	private String grpJoinInfoinsert(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		GrpJoinInfoVO grpJoinInfo = new GrpJoinInfoVO();

		// 揪團編號
		String grpNoParam = req.getParameter("GrpNo");

		// 發起人會員編號orgMbrNo
		grpJoinInfo.setOrgMbrNo(req.getParameter("OrgMbrNo"));

		// 參與人會員編號partiMbrNo
		grpJoinInfo.setPartiMbrNo(req.getParameter("PartiMbrNo"));

		if (grpNoParam != null && !grpNoParam.isEmpty()) {
			Integer joininfogrpNo = Integer.valueOf(grpNoParam);
			grpJoinInfo.setGrpNo(joininfogrpNo);
		} else {
			return "strError";
		}
		// 參與狀態 true;false
		grpJoinInfo.setGrpJoinStat(true);

		GrpJoinInfoService_interface grpJoinInfoSvc = new GrpJoinInfoService_interface();
		grpJoinInfoSvc.insert(grpJoinInfo);

		return "/group/grpinfoOrgMbr.jsp";

	}

	private String grpJoinInfoupdate(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		GrpJoinInfoVO grpJoinInfo = new GrpJoinInfoVO();

		// 揪團編號
		String grpNoParam = req.getParameter("GrpNo");
		// 參與人會員編號partiMbrNo
		grpJoinInfo.setPartiMbrNo(req.getParameter("PartiMbrNo"));
		if (grpNoParam != null && !grpNoParam.isEmpty()) {
			Integer joininfogrpNo = Integer.valueOf(grpNoParam);
			grpJoinInfo.setGrpNo(joininfogrpNo);
		} else {
			return "strError";
		}
		// 參與狀態 true;false
		grpJoinInfo.setGrpJoinStat(false);

		GrpJoinInfoService_interface grpJoinInfoSvc = new GrpJoinInfoService_interface();
		grpJoinInfoSvc.update(grpJoinInfo);

		return "/group/grpinfoOrgMbr.jsp";
	}

//抓參與人數量
//		String findjoinbygrpNo = req.getParameter("grpNo");
//
//		if (findjoinbygrpNo != null && !findjoinbygrpNo.isEmpty()) {
//			try {
//				int grpNo = Integer.parseInt(findjoinbygrpNo);
//				List<GrpJoinInfoVO> grpJoInfoList = grpJoinInfoService_interface.getgrpjoinserviceQuery("grpNo",
//						String.valueOf(grpNo));
////				int partiMbrNoCount = grpJoInfoList.size()+1; //要包含自己所以+1
//				int partiMbrNoCount = 5;
//				req.setAttribute("grpNo", grpNo);
//				req.setAttribute("partiMbrNoCount", partiMbrNoCount);
//				
//				System.out.println("-------grpNo-------" + grpNo);
//				System.out.println("-------partiMbrNoCount-------" + partiMbrNoCount);
//
//				RequestDispatcher successView = req.getRequestDispatcher("/group/AllGroup.jsp");
//				successView.forward(req, res);
//				
//			} catch (NumberFormatException e) {
//				res.getWriter().println("Invalid GrpNo format");
//				System.out.println("-------Invalid GrpNo format-------");
//
//			}
//		} else {
//			res.getWriter().println("GrpNo parameter is missing");
//			System.out.println("-------IGrpNo parameter is missing-------");
//		}
//
//	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

}
