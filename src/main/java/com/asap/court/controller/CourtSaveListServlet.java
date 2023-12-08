package com.asap.court.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.court.service.CourtSaveListService;
import com.asap.court.service.CourtSaveListService_interface;

@WebServlet("/court/courtSaveList.do")
public class CourtSaveListServlet extends HttpServlet{
	
	private CourtSaveListService_interface courtSaveListService_interface;

	@Override
	public void init() throws ServletException{
		courtSaveListService_interface = new CourtSaveListService();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String forwardPath = "";
		if(!(action.equals("add")||action.equals("delete"))) {
			switch (action) {
				case "getMbrSaveList":
					forwardPath =  getMbrSaveList(req, res);
					break;
				default:
					forwardPath = "/court_savelist.jsp";
			}
			
			res.setContentType("text/html; charset=UTF-8");
			RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
			dispatcher.forward(req, res);
			
		}else {
			switch (action) {
				case "add":
					addToSaveList(req, res);
					break;
				case "delete":
					deleteFromSaveList(req, res);
					break;
				default:
					throw new IllegalArgumentException("Unexpected value: " + action);
			}
			
		}

	}
	
	
	
	private void deleteFromSaveList(HttpServletRequest req, HttpServletResponse res) throws IOException {
		BufferedReader reader = req.getReader();
        StringBuilder jsonInput = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonInput.append(line);
        }
        System.out.println("Received JSON: " + jsonInput.toString());
		
	}

	private void addToSaveList(HttpServletRequest req, HttpServletResponse res) throws IOException {
		BufferedReader reader = req.getReader();
        StringBuilder jsonInput = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonInput.append(line);
        }
        System.out.println("Received JSON: " + jsonInput.toString());
		
	}

	private String getMbrSaveList(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return "/court_savelist.jsp";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

}
