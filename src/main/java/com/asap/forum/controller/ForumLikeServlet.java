package com.asap.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.forum.service.ForumLikeVOService;
import com.asap.forum.service.ForumLikeVOServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/forum/forumlike.do")
public class ForumLikeServlet extends HttpServlet {

	private ForumLikeVOService forumLikeVOService;

	@Override
	public void init() throws ServletException {
		forumLikeVOService = new ForumLikeVOServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		switch (action) {
		case "likepost":
			likepost(req, res);
			break;
		case "likecmt":
			likecmt(req, res);
			break;
		case "loadlike":
			loadlike(req, res);
			break;
	}
	
	res.setContentType("text/html; charset=UTF-8");
	}

	private void loadlike(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer postno = Integer.parseInt(req.getParameter("postno"));
		ForumLikeVOService postLikeSvc= new ForumLikeVOServiceImpl();
		Integer status = postLikeSvc.postLikecheck("M001", postno);
		Map<String, Integer> data = new HashMap<>();
		data.put("status", status);
		Gson gson= new Gson();
		String statusJson=gson.toJson(data);
		PrintWriter out = res.getWriter();
        out.write(statusJson);          
        out.close();
	}

	private void likepost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer postno = Integer.parseInt(req.getParameter("postno"));
		ForumLikeVOService postLikeSvc= new ForumLikeVOServiceImpl();
//		M001要改
		Integer status=postLikeSvc.postLike("M001", postno);
		
		Map<String, Integer> data = new HashMap<>();
		data.put("status", status);
		Gson gson= new Gson();
		String statusJson=gson.toJson(data);
		PrintWriter out = res.getWriter();
        out.write(statusJson);          
        out.close();  
	}

	private void likecmt(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer cmtno = Integer.parseInt(req.getParameter("cmtno"));
		ForumLikeVOService postLikeSvc= new ForumLikeVOServiceImpl();
//		M002要改
		Integer status=postLikeSvc.cmtLike("M002", cmtno);
		Map<String, Integer> data = new HashMap<>();
		data.put("status", status);
		Gson gson= new Gson();
		String statusJson=gson.toJson(data);
		PrintWriter out = res.getWriter();
        out.write(statusJson);          
        out.close();  
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
