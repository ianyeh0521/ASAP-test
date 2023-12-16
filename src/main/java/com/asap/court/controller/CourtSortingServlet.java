package com.asap.court.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.court.entity.CourtVO;
import com.asap.court.service.CourtService;
import com.asap.court.service.CourtService_interface;
import com.asap.util.HibernateProxyTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/court/courtSorting.do")
public class CourtSortingServlet extends HttpServlet{

	private CourtService_interface courtService_interface;

	
	@Override
	public void init() throws ServletException{
		courtService_interface = new CourtService();
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("application/json;charset=UTF-8");
		String sortBy = req.getParameter("sortBy");
		String userLatitude = req.getParameter("userLatitude");
        String userLongitude = req.getParameter("userLongitude");
        
        GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		
		Gson gson = builder.create();
        if(userLatitude == null && userLongitude == null) {
        	List<CourtVO> courtSortingList = courtService_interface.getAllSorting(sortBy);
    		
    		String jsonCourtSorting = gson.toJson(courtSortingList);
    		System.out.println(jsonCourtSorting);

    		res.getWriter().write(jsonCourtSorting);
        }else {
        	BigDecimal latitude = BigDecimal.valueOf(Double.valueOf(userLatitude));
        	BigDecimal longitude = BigDecimal.valueOf(Double.valueOf(userLongitude));
        	
        	List<CourtVO> courtSortingDistanceList = courtService_interface.getAllCourtsSortingDis(latitude, longitude, sortBy);
        	
        	String jsonCourtSortingDis = gson.toJson(courtSortingDistanceList);
        	res.getWriter().write(jsonCourtSortingDis);
        	
        }
		

	}
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	
}
