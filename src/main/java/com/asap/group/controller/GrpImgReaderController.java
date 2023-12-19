package com.asap.group.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.group.service.GrpInfoService;
import com.asap.group.service.GrpInfoService_interface;
@WebServlet("/GrpImgReader")
public class GrpImgReaderController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			Integer grpNo = Integer.valueOf(req.getParameter("grpNo"));
			GrpInfoService grpInfoSvc = new GrpInfoService_interface();
			out.write(grpInfoSvc.getGrpInfoVOBygrpNo(grpNo).getGrpImg());
			} 
		catch (Exception e) {
			InputStream in = getServletContext().getResourceAsStream("/group/nopic.jpg");
			byte[] buf = new byte[in.available()];
			in.read(buf);
			out.write(buf);
			in.close();

		}
	}

}

