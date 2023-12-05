package com.asap.court.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.court.entity.CourtClosedTimeVO;
import com.asap.court.entity.CourtImgVO;
import com.asap.court.entity.CourtVO;
import com.asap.court.service.CourtClosedTimeService;
import com.asap.court.service.CourtClosedTimeService_interface;
import com.asap.court.service.CourtImgService;
import com.asap.court.service.CourtImgService_interface;

@MultipartConfig(fileSizeThreshold = 0 * 1024 * 1024, maxFileSize = 1 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
@WebServlet("/court/courtClosedTime.do")
public class AddCourtClosedTimeServlet extends HttpServlet{

	private CourtClosedTimeService_interface courtClosedTimeService_interface;
	
	@Override
	public void init() throws ServletException {
		courtClosedTimeService_interface = new CourtClosedTimeService();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String forwardPath = "";
		switch (action) {
			case "insert":
				forwardPath = addTime(req, res);
				break;
			case "delete":
				forwardPath = deleteTime(req, res);
				break;
			default:
				forwardPath = "/court/UploadPicAddDeleteTime.jsp";
		}
		res.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
		dispatcher.forward(req, res);
	
		
	}
	
	
	
	private String deleteTime(HttpServletRequest req, HttpServletResponse res) {
		
		// 接收 courtNo、courtClosedTime、courtClosedDate
		Integer courtNo = Integer.valueOf(req.getParameter("courtNo").trim());
		java.sql.Date closedDate = null;
		try {
			closedDate = java.sql.Date.valueOf(req.getParameter("closedDate").trim());
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}
		Integer closedTime= Integer.valueOf(req.getParameter("closedTime").trim());
		
		// 找出所有此 courtNo 的不開放時間資料變成一個 List
		List<CourtClosedTimeVO> courtClosedTimeList = courtClosedTimeService_interface.findByCourtNo(courtNo);
		
		// List 跑回圈，若符合接收到的 Date 和 Time 便刪除
		ListIterator<CourtClosedTimeVO> it = courtClosedTimeList.listIterator();
		while(it.hasNext()) {
			CourtClosedTimeVO courtClosedTime = it.next();

			if((courtClosedTime.getCourtClosedDate().equals(closedDate)) && (courtClosedTime.getCourtClosedTime() == closedTime)) {
				courtClosedTimeService_interface.delete(courtClosedTime.getCourtClosedTimeNo());
				
			}
		}
		return "/court/UploadPicAddDeleteTime.jsp";
	}

	private String addTime(HttpServletRequest req, HttpServletResponse res) {
		Integer courtNo = Integer.valueOf(req.getParameter("courtNo").trim());
		Integer closedTime= Integer.valueOf(req.getParameter("closedTime").trim());
		
		java.sql.Date closedDateS = null;
		try {
			closedDateS = java.sql.Date.valueOf(req.getParameter("closedDate").trim());
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}
		
		
		CourtVO courtVO = new CourtVO(courtNo);
		CourtClosedTimeVO courtClosedTimeVO = new CourtClosedTimeVO(courtVO, closedDateS, closedTime);	
		courtClosedTimeService_interface.insert(courtClosedTimeVO);
		return  "/court/UploadPicAddDeleteTime.jsp";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	

	
}
