package com.asap.forum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.forum.entity.PostVO;
import com.asap.forum.entity.SavePostVO;
import com.asap.forum.service.PostVOService;
import com.asap.forum.service.PostVOServiceImpl;
import com.google.gson.Gson;



@WebServlet("/forum/post.do")
public class PostServlet extends HttpServlet {
	// 一個 servlet 實體對應一個 service 實體
	private PostVOService postVOService;

	@Override
	public void init() throws ServletException {
		postVOService = new PostVOServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String forwardPath = "";
		switch (action) {
			case "loadpost":
				loadPost(req, res);
				break;
			case "search":
				searchByTitle(req,res);
				break;
//			case "getAll":
//				forwardPath = getAllPosts(req, res);
//				break;
//			case "compositeQuery":
//				forwardPath = getCompositeEmpsQuery(req, res);
//				break;
//			case "addnewpost":
//				forwardPath = addNewPost(req,res);
//				break;
//			default:
//				forwardPath = "/index.jsp";
		}
		
		res.setContentType("text/html; charset=UTF-8");
//		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
//		dispatcher.forward(req, res);
	}

	private void searchByTitle(HttpServletRequest req, HttpServletResponse res) throws IOException {
		res.setContentType("application/json;charset=UTF-8");
		String title=req.getParameter("keyword");
		List <PostVO> searchList=postVOService.getbyPostTitle(title);
		Gson gson= new Gson();
		String jsonString=gson.toJson(searchList);
//		System.out.println(searchList);
		PrintWriter out = res.getWriter();
        out.write(jsonString);         
        out.close();
	}

	private void loadPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		res.setContentType("application/json;charset=UTF-8");
		List<PostVO> postList = postVOService.getAlltoShow();
		Gson gson= new Gson();
		String jsonString=gson.toJson(postList);
		PrintWriter out = res.getWriter();
        out.write(jsonString);          
        out.close();  
		
	}

	private String addNewPost(HttpServletRequest req, HttpServletResponse res) {
		Integer posttypeno = Integer.parseInt(req.getParameter("posttypeno"));
		String posttitle =req.getParameter("posttitle");
		String posttext=req.getParameter("posttext");
		PostVO postvo=new PostVO();
		postvo.setPostTitle(posttitle);
		postvo.setPostTypeNo(posttypeno);
		postvo.setPostText(posttext);
		postvo.setPostStatus(1);
		postvo.setPostViews(0);
		
//		--------待刪-----------
		postvo.setMbrNo("M001");
//		--------待刪-----------
		PostVOService postVOService= new PostVOServiceImpl();
		postVOService.addPost(postvo);
		return "/forum/01_forum_home.html";
		
	}

//	private String getAllPosts(HttpServletRequest req, HttpServletResponse res) {
//		String page = req.getParameter("page");//拿到空值
//		int currentPage = (page == null) ? 1 : Integer.parseInt(page);
//		
//		List<PostVO> postList = postVOService.getAllPosts(currentPage);
//
//		if (req.getSession().getAttribute("empPageQty") == null) {
//			int postPageQty = postVOService.getPageTotal();
//			req.getSession().setAttribute("empPageQty", postPageQty);
//		}
//		
//		req.setAttribute("empList", postList);
//		req.setAttribute("currentPage", currentPage);
////		System.out.println(postList.get(0));
//		return "/forum/listAllPosts.jsp";
//	}
	
//	private String getCompositeEmpsQuery(HttpServletRequest req, HttpServletResponse res) {
//		Map<String, String[]> map = req.getParameterMap();
//		
//		if (map != null) {
//			List<PostVO> postList = postVOService.getPostsByCompositeQuery(map);
//			req.setAttribute("empList", postList);
//		} else {
//			return "/index.jsp";
//		}
//		return "/forum/listCompositeQueryEmps.jsp";
//	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
