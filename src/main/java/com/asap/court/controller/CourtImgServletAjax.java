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
import com.asap.court.service.CourtImgService;
import com.asap.court.service.CourtImgService_interface;
import com.asap.util.HibernateProxyTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/court/courtImgAjax.do")
public class CourtImgServletAjax extends HttpServlet{

	private CourtImgService_interface courtImgService_interface;
	
	@Override
	public void init() throws ServletException{
		courtImgService_interface = new CourtImgService();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		res.setContentType("application/json;charset=UTF-8");
//
//        GsonBuilder builder = new GsonBuilder();
//        builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
//
//        Gson gson = builder.create();
//        List<List<String>> result = new ArrayList<>();
//        
//        try {
//            int page = Integer.parseInt(req.getParameter("page"));
//            int itemsPerPage = Integer.parseInt(req.getParameter("itemsPerPage"));
//
//            List<CourtImgVO> courtImgList = courtImgService_interface.getAll(page, itemsPerPage);
//
//            for (final CourtImgVO courtImgVO : courtImgList) {
//                List<String> noAndImg = new ArrayList<>();
//                noAndImg.add(String.valueOf(courtImgVO.getCourtVO().getCourtNo()));
//                noAndImg.add(Base64.getEncoder().encodeToString(courtImgVO.getCourtImg()));
//                result.add(noAndImg);
//            }
//        } catch (NumberFormatException e) {
//            // Handle invalid or missing parameters
//            res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            res.getWriter().write("Invalid or missing pagination parameters.");
//            return;
//        }
//
//        String jsonObj = gson.toJson(result);
//        System.out.println(jsonObj);
//        res.getWriter().write(jsonObj);
		
		res.setContentType("application/json;charset=UTF-8");

		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		
		Gson gson = builder.create();
		List<List<String>> result = new ArrayList<>();
		List<CourtImgVO> courtImgList = courtImgService_interface.getAll();
		for(final CourtImgVO courtImgVO:courtImgList) {
			List<String> NoAndImg = new ArrayList<>();
			NoAndImg.add(String.valueOf(courtImgVO.getCourtVO().getCourtNo()));
			NoAndImg.add(Base64.getEncoder().encodeToString(courtImgVO.getCourtImg()));
			result.add(NoAndImg);
		}
		String jsonObj = gson.toJson(result);
		res.getWriter().write(jsonObj);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
