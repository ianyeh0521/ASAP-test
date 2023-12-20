package com.asap.course.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.asap.course.service.CourseService;
import com.asap.course.service.CourseService_interface;
import com.asap.course.entity.*;

@WebServlet("/course/DBGifReader")
public class DBGifReaderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			Integer courseNo = Integer.valueOf(req.getParameter("courseNo"));
			CourseService_interface courseSvc = new CourseService();
			out.write(courseSvc.findByPK(courseNo).getCourseImg());
		} catch (Exception e) {
//			InputStream in = getServletContext().getResourceAsStream("/resources/NoData/nopic.jpg");
//			byte[] buf = new byte[in.available()];
//			in.read(buf);
//			out.write(buf);
//			in.close();
			e.printStackTrace();

		}
	}

}
