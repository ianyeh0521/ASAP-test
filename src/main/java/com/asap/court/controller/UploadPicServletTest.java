package com.asap.court.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.court.entity.CourtImgVO;
import com.asap.court.entity.CourtVO;
import com.asap.court.service.CourtImgService;
import com.asap.court.service.CourtImgService_interface;

@MultipartConfig(fileSizeThreshold = 0 * 1024 * 1024, maxFileSize = 1 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
@WebServlet("/court/courtImgUp.do")
public class UploadPicServletTest extends HttpServlet{

	private CourtImgService_interface courtImgService_interface;
	
	@Override
	public void init() throws ServletException {
		courtImgService_interface = new CourtImgService();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		InputStream in = req.getPart("upFiles").getInputStream();
		byte[] upFiles = null;
		if(in.available()!=0){
			upFiles = new byte[in.available()];
			in.read(upFiles);
			in.close();
		}  else{
			System.out.println("請上傳照片");
		}
		
		
		Integer courtNo = Integer.valueOf(req.getParameter("courtNo").trim());
		CourtVO courtVO = new CourtVO(courtNo);
		
		CourtImgVO courtImgVO = new CourtImgVO(courtVO, upFiles);
		Integer result = courtImgService_interface.insert(courtImgVO);
		System.out.println(result);
	}
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	

	
}
