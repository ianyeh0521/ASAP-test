package com.asap.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.forum.entity.PostVO;
import com.asap.forum.entity.SavePostVO;
import com.asap.forum.service.PostVOServiceImpl;
import com.asap.forum.service.SavePostVOService;
import com.asap.forum.service.SavePostVOServiceImpl;
import com.google.gson.Gson;

@WebServlet("/forum/savepost.do")
public class SavePostServlet extends HttpServlet {

	private SavePostVOService savePostVOService;

	@Override
	public void init() throws ServletException {
		savePostVOService = new SavePostVOServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		switch (action) {
		case "getmysave":
			getMySave(req, resp);
			break;
		case "savepost":
			savePost(req, resp);
			break;
		}
	}

	private void savePost(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub

	}

	public void getMySave(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		List<SavePostVO> savePostList = savePostVOService.getAll();
//		System.out.println(savePostList);

		Gson gson = new Gson();
		String jsonString = gson.toJson(savePostList);
		System.out.println(jsonString);
		resp.setContentType("application/json; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.write(jsonString);
		out.close();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
