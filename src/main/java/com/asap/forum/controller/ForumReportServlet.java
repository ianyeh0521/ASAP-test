package com.asap.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.forum.entity.ForumCommentVO;
import com.asap.forum.entity.ForumReportVO;
import com.asap.forum.service.ForumReportVOService;
import com.asap.forum.service.ForumReportVOServiceImpl;

@WebServlet("/forum/forumreport.do")
public class ForumReportServlet extends HttpServlet {
	
	private ForumReportVOService forumreportVOService;

	@Override
	public void init() throws ServletException {
		forumreportVOService = new ForumReportVOServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		switch (action) {
		case "reportcomment":
			reportComment(req, res);
			break;
		case "reportpost":
			reportPost(req, res);
			break;
		
	}
	
	res.setContentType("text/html; charset=UTF-8");
		
		
		//		req.setCharacterEncoding("UTF-8");
//		resp.setContentType("application/json; charset=UTF-8");
//		String type= req.getParameter("reporttype");
//		String text= req.getParameter("reporttext");
//		ForumReportVO forumReportVO= new ForumReportVO();
//		forumReportVO.setfRptMsg(text);
//		forumReportVO.setfRptTypeNo(Integer.parseInt(type));
//		forumReportVO.setMbrNo("M001");
//		forumReportVO.setPostNo(1);
//		
//		ForumReportVOService forumReportVOService= new ForumReportVOServiceImpl();
//		forumReportVOService.add(forumReportVO);
//		
//		System.out.println("success");
//		resp.getWriter().write("Success: true");
//		System.out.println("reporttype "+type);
//		System.out.println("reporttext "+text);
	}

	private void reportPost(HttpServletRequest req, HttpServletResponse res) {
		Integer postno = Integer.parseInt(req.getParameter("postno"));
		Integer rpttype = Integer.parseInt(req.getParameter("rpttype"));
		String rpttext =req.getParameter("rpttext");
		res.setContentType("application/json; charset=UTF-8");
		ForumReportVO forumReportVO= new ForumReportVO();
		forumReportVO.setfRptMsg(rpttext);
		forumReportVO.setfRptTypeNo(rpttype);
		forumReportVO.setPostNo(postno);
		
		//待刪
		forumReportVO.setMbrNo("M001");
		//待刪
		
		ForumReportVOService forumReportVOService= new ForumReportVOServiceImpl();
		forumReportVOService.add(forumReportVO);
		System.out.println("success");
		
	}

	private void reportComment(HttpServletRequest req, HttpServletResponse res) {
		Integer cmtno = Integer.parseInt(req.getParameter("cmtno"));
		Integer rpttype = Integer.parseInt(req.getParameter("rpttype"));
		String rpttext =req.getParameter("rpttext");
		res.setContentType("application/json; charset=UTF-8");
		ForumReportVO forumReportVO= new ForumReportVO();
		forumReportVO.setfRptMsg(rpttext);
		forumReportVO.setfRptTypeNo(rpttype);
		forumReportVO.setCmtNo(cmtno);
		
		//待刪
		forumReportVO.setMbrNo("M001");
		//待刪
		ForumReportVOService forumReportVOService= new ForumReportVOServiceImpl();
		forumReportVOService.add(forumReportVO);
		System.out.println("success");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
