package com.asap.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json; charset=UTF-8");
		String type= req.getParameter("reporttype");
		String text= req.getParameter("reporttext");
		ForumReportVO forumReportVO= new ForumReportVO();
		forumReportVO.setfRptMsg(text);
		forumReportVO.setfRptTypeNo(Integer.parseInt(type));
		forumReportVO.setMbrNo("M001");
		forumReportVO.setPostNo(1);
		
		ForumReportVOService forumReportVOService= new ForumReportVOServiceImpl();
		forumReportVOService.add(forumReportVO);
		
		System.out.println("success");
//		resp.getWriter().write("Success: true");
//		System.out.println("reporttype "+type);
//		System.out.println("reporttext "+text);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
