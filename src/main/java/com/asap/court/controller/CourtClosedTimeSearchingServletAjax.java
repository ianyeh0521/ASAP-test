package com.asap.court.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.court.entity.CourtClosedTimeVO;
import com.asap.court.service.CourtClosedTimeService;
import com.asap.court.service.CourtClosedTimeService_interface;
import com.asap.util.HibernateProxyTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/court/courtClosedTimeAjax.do")
public class CourtClosedTimeSearchingServletAjax extends HttpServlet{

	private CourtClosedTimeService_interface courtClosedTimeService_interface;
	
	@Override
	public void init() throws ServletException {
		courtClosedTimeService_interface = new CourtClosedTimeService();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Integer courtNo = Integer.valueOf(req.getParameter("courtNo").trim());
		java.sql.Date getDate = null;
		try {
			getDate = java.sql.Date.valueOf(req.getParameter("getDate").trim());
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}
		List<CourtClosedTimeVO> timeOfDateList = courtClosedTimeService_interface.findByDate(courtNo, getDate);
		
		res.setContentType("application/json;charset=UTF-8");
		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		
		Gson gson = builder.create();
		
		String jsontimeOfDate;
	    if (timeOfDateList != null) {
	        jsontimeOfDate = gson.toJson(timeOfDateList);
	    } else {
	        jsontimeOfDate = "[]";
	    }
		res.getWriter().write(jsontimeOfDate);
			
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
