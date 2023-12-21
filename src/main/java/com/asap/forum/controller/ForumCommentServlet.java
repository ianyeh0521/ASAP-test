package com.asap.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.forum.entity.ForumCommentVO;
import com.asap.forum.entity.ForumReportVO;
import com.asap.forum.entity.PostTypeVO;
import com.asap.forum.entity.PostVO;
import com.asap.forum.service.ForumCommentVOService;
import com.asap.forum.service.ForumCommentVOServiceImpl;
import com.asap.forum.service.PostVOService;
import com.asap.forum.service.PostVOServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/forum/forumcomment.do")
public class ForumCommentServlet extends HttpServlet {

	private ForumCommentVOService forumCommentVOService;

	@Override
	public void init() throws ServletException {
		forumCommentVOService = new ForumCommentVOServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		switch (action) {
		case "addcomment":
			addcomment(req, res);
			break;
		case "getonecomment":
			getOneComment(req, res);
			break;
		case "cmtrptmgmt":
			cmtRptMgmt(req, res);
			break;
	}
	
	res.setContentType("text/html; charset=UTF-8");
	}

	private void cmtRptMgmt(HttpServletRequest req, HttpServletResponse res) {
		Integer cmtno = Integer.parseInt(req.getParameter("cmtno"));
		ForumCommentVO comment=  forumCommentVOService.getOneComment(cmtno);
		comment.setCmtStatus(false);
		forumCommentVOService.uodateComment(comment);
	}

	private void getOneComment(HttpServletRequest req, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		Integer cmtno = Integer.parseInt(req.getParameter("cmtno"));
		ForumCommentVO comment=  forumCommentVOService.getOneComment(cmtno);
		Gson gson= new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		String jsonString=gson.toJson(comment);
		PrintWriter out = res.getWriter();
        out.write(jsonString);          
        out.close();  
	}

	private void addcomment(HttpServletRequest req, HttpServletResponse res) {
		Integer postno = Integer.parseInt(req.getParameter("postno"));
		String commenttext =req.getParameter("comment");
		ForumCommentVO commentVO=new ForumCommentVO();
		commentVO.setPostNo(postno);
		commentVO.setCmtText(commenttext);
		commentVO.setCmtStatus(true);
		
//		--------待刪-----------
		commentVO.setMbrNo("M002");
//		--------待刪-----------
		
		forumCommentVOService.addComment(commentVO);
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
