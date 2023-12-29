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

import net.bytebuddy.utility.dispatcher.JavaDispatcher.IsConstructor;

@WebServlet("/court/courtAjax.do")
public class CourtServletAjax extends HttpServlet {

	private CourtService_interface courtService_interface;

	@Override
	public void init() throws ServletException {
		courtService_interface = new CourtService();

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		Gson gson = builder.create();

		boolean getTotalPage = Boolean.parseBoolean(req.getParameter("getTotalPage"));

		if (getTotalPage) {
			int totalPage = courtService_interface.getTotalPage();

			String jsonTotalPageString = gson.toJson(totalPage);
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(jsonTotalPageString);
		} else {
			try {
//				String page = req.getParameter("page");
//				int currentPage = (page == null) ? 1 : Integer.parseInt(page);

				List<CourtVO> courtList = courtService_interface.getAllCourts();

				String json = gson.toJson(courtList);
				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");
				res.getWriter().write(json);
			} catch (NumberFormatException e) {
				res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				res.getWriter().write("Invalid or missing pagination parameters.");
			}
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

}
