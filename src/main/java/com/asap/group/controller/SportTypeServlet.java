package com.asap.group.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.group.entity.SportTypeVO;
import com.asap.group.service.SportTypeService_interface;

@WebServlet("/SportType.do")
public class SportTypeServlet extends HttpServlet {
	private SportTypeService_interface sportTypeService_interface;

	@Override
	public void init() throws ServletException {
		sportTypeService_interface = new SportTypeService_interface();
	}

	//查詢單筆
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String findbysportTypeNo = req.getParameter("findbysportTypeNo");
		Integer sportTypeNo = 0;
		
		try {
			sportTypeNo = Integer.parseInt(findbysportTypeNo);
			} catch (NumberFormatException e) {
			}
		
		SportTypeVO findonesportType = sportTypeService_interface.findBySportPK(sportTypeNo);
		req.setAttribute("findonesportType",findonesportType);
		

		RequestDispatcher successView = req.getRequestDispatcher("/group/AllGroup.jsp");
		successView.forward(req, res);
		
		
}

		

	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}
}
