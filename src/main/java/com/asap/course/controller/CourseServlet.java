package com.asap.course.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.coach.entity.CoachVO;
import com.asap.group.entity.SportTypeVO;
import com.asap.course.entity.CourseVO;
import com.asap.course.service.CourseService;
import com.asap.course.service.CourseService_interface;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 30 * 1024 * 1024)
@WebServlet("/course/course.do")
public class CourseServlet extends HttpServlet{
	private CourseService_interface courseSvc;
	
	@Override
	public void init() throws ServletException{
		courseSvc = new CourseService();
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String forwardPath = "";
		
		switch (action) {
		case "add":
			forwardPath = addCourse(req,res);
			break;
		case "update":
			forwardPath = "";
			break;
		default:
			
			break;
		}
		
		res.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
		dispatcher.forward(req, res);
	}
	
	
	
	
	private String addCourse(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		String nameError = null;
		String courseName = req.getParameter("name");
		String enameReg = "^[\\u4e00-\\u9fa5a-zA-Z\\-]{2,20}$";
		if (courseName == null || courseName.trim().length() == 0) {
			nameError = "課程名稱: 請勿空白";
		} else if(!courseName.trim().matches(enameReg)) { 
			nameError = "課程名稱: 只能是中、英文字母和- , 且長度必需在2到20之間";
        }
		
		Integer sportTypeNo = Integer.valueOf(req.getParameter("type"));
		SportTypeVO sportTypeVO = new SportTypeVO();
		sportTypeVO.setSportTypeNo(sportTypeNo);
		
		String addressError = null;
		String courseAddress = req.getParameter("address");
		if (courseAddress == null || courseAddress.trim().length() == 0) {
			addressError = "地址請勿空白";
		}		
		
		String pplLimitError = null;
		Integer coursePplLimit = null;
		try {
			coursePplLimit = Integer.valueOf(req.getParameter("pplLimit"));
			if(coursePplLimit<0) {
				pplLimitError = "人數限制不可小於零";
			}
		} catch (NumberFormatException e) {
			coursePplLimit = 0;
			pplLimitError = "請填寫人數限制";
		}
		
		String priceError = null;
		Integer coursePrice = null;
		try {
			coursePrice = Integer.valueOf(req.getParameter("price"));
			if(coursePrice<0) {
				priceError = "價格不可小於零";
			}
		} catch (NumberFormatException e) {
			coursePrice = 0;
			priceError = "價格請填數字";
		}
		
		String timeError = null;
		String courseStart = null;
		java.sql.Timestamp courseStartTime = null;
		try {
			courseStart = req.getParameter("start");
			courseStartTime = java.sql.Timestamp.valueOf(courseStart);	
		} catch (Exception e) {
			timeError = "請填入時間";
		}

		String courseEnd = null;
		java.sql.Timestamp courseEndTime = null;
		try {
			courseEnd = req.getParameter("end");
			courseEndTime = java.sql.Timestamp.valueOf(courseEnd);	
		} catch (Exception e) {
			timeError = "請填入時間";
		}
		
		String textError = null;
		String courseText = req.getParameter("courseText");
		if (courseText == null || courseText.trim().length() == 0) {
			textError = "課程介紹請勿空白";
		}
		
		Boolean courseStat = true;
		
		String imgError = null;
		InputStream in1 = req.getPart("upFiles1").getInputStream();
		byte[] upFiles1 = null;
		if(in1.available()!=0){
			upFiles1 = new byte[in1.available()];
			in1.read(upFiles1);
			in1.close();
		}  else{
			imgError = "請上傳照片";
			System.out.println("請上傳照片");
		}
		
		String coachNo = req.getParameter("coachNo");
		CoachVO coachVO = new CoachVO();
		coachVO.setCoachNo(coachNo);
		
		if(nameError == null && addressError == null && pplLimitError == null
				&& priceError == null && timeError == null 
				&& textError == null && imgError == null) {
			CourseVO courseVO = new CourseVO();
			courseVO.setCourseName(courseName);
			courseVO.setSportTypeVO(sportTypeVO);
			courseVO.setCourseAddress(courseAddress);
			courseVO.setCoursePplLimit(coursePplLimit);
			courseVO.setCoursePrice(coursePrice);
			courseVO.setCourseStartTime(courseStartTime);
			courseVO.setCourseEndTime(courseEndTime);
			courseVO.setCourseText(courseText);
			courseVO.setCourseStat(courseStat);
			courseVO.setCourseImg(upFiles1);
			courseVO.setCoachVO(coachVO);
			
			courseSvc.insert(courseVO);
			
			return "/course/addCourse.jsp";
		}else {
			req.setAttribute("nameError", nameError);
			req.setAttribute("addressError", addressError);
			req.setAttribute("pplLimitError", pplLimitError);
			req.setAttribute("priceError", priceError);
			req.setAttribute("timeError", timeError);
			req.setAttribute("textError", textError);
			req.setAttribute("imgError", imgError);
			
			return "/course/addCourse.jsp";
		}
	}


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}
	
	
}
