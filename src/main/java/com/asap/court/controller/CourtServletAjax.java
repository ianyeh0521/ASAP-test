package com.asap.court.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.court.entity.CourtImgVO;
import com.asap.court.entity.CourtVO;
import com.asap.court.service.CourtImgService;
import com.asap.court.service.CourtImgService_interface;
import com.asap.court.service.CourtService;
import com.asap.court.service.CourtService_interface;
import com.asap.util.HibernateProxyTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/court/courtAjax.do")
public class CourtServletAjax extends HttpServlet{

	private CourtService_interface courtService_interface;
	
	@Override
	public void init() throws ServletException {
		courtService_interface = new CourtService();
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("application/json;charset=UTF-8");

		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		
		Gson gson = builder.create();
		// 取得 CourtVO List
		List<CourtVO> courtList = courtService_interface.getAllCourts();
		System.out.println(courtList);
			
		String jsonCourtVO = gson.toJson(courtList);
		System.out.println(jsonCourtVO);
		
		
		
		res.getWriter().write(jsonCourtVO);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	
	
	
}
