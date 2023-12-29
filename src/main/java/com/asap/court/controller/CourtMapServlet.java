package com.asap.court.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.court.entity.CourtVO;
import com.asap.court.service.CourtService;
import com.asap.court.service.CourtService_interface;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/court/courtMap.do")
public class CourtMapServlet extends HttpServlet {

	private CourtService_interface courtSvc;

	@Override
	public void init() throws ServletException {
		courtSvc = new CourtService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<CourtVO> courtList = courtSvc.getAllCourts();
		List<GeoPoint> geoPoints = new ArrayList<>();
		for (CourtVO courtVO : courtList) {
			double courtLat = courtVO.getCourtLat().doubleValue();
			double courtLong = courtVO.getCourtLong().doubleValue();
			String courtName = courtVO.getCourtName();
			String courtText = courtVO.getCourtText();
			String courtNo = String.valueOf(courtVO.getCourtNo());

			GeoPoint geoPoint = new GeoPoint(courtLat, courtLong, courtName, courtText, courtNo);
			geoPoints.add(geoPoint);
		}

		String geoJSON = convertToGeoJSON(geoPoints);

//		System.out.println(geoJSON);

		res.setContentType("application/json;charset=UTF-8");
		res.getWriter().write(geoJSON);
	}

	public static String convertToGeoJSON(List<GeoPoint> geoPoints) {
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		return gson.toJson(geoPoints);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

}

class GeoPoint {
	private String type = "Feature";
	private Geometry geometry;
	private Properties properties;

	public GeoPoint(double latitude, double longitude, String name, String text, String courtNo) {
		this.geometry = new Geometry("Point", new double[] { longitude, latitude });
		this.properties = new Properties(name, text, courtNo);
	}

	private static class Geometry {
		private String type;
		private double[] coordinates;

		public Geometry(String type, double[] coordinates) {
			this.type = type;
			this.coordinates = coordinates;
		}
	}

	private static class Properties {
		private String name;
		private String text;
		private String courtNo;

		public Properties(String name, String text, String courtNo) {
			this.name = name;
			this.text = text;
			this.courtNo = courtNo;
		}
	}
}
