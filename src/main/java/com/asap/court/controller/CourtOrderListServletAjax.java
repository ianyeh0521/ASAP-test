package com.asap.court.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.asap.court.entity.CourtClosedTimeVO;
import com.asap.court.entity.CourtImgVO;
import com.asap.court.entity.CourtOrderVO;
import com.asap.court.service.CourtClosedTimeService;
import com.asap.court.service.CourtClosedTimeService_interface;
import com.asap.court.service.CourtImgService;
import com.asap.court.service.CourtImgService_interface;
import com.asap.court.service.CourtOrderService;
import com.asap.court.service.CourtOrderService_interface;
import com.asap.util.HibernateProxyTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

@WebServlet("/court/courtOrderListAjax.do")
public class CourtOrderListServletAjax extends HttpServlet{

	private CourtOrderService_interface courtOrderService_interface;
	private CourtImgService_interface courtImgService_interface;
	private CourtClosedTimeService_interface courtClosedTimeService_interface;
	
	@Override
	public void init() throws ServletException{
		courtOrderService_interface = new CourtOrderService();
		courtImgService_interface = new CourtImgService();
		courtClosedTimeService_interface = new CourtClosedTimeService();
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		BufferedReader reader = req.getReader();
		StringBuilder jsonPayload = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonPayload.append(line);
        }

        JSONObject jsonData = new JSONObject(jsonPayload.toString());
        
        String action = jsonData.getString("action");
		String mbrNo = jsonData.getString("mbrNo");
		Integer courtOrdNo = null;
		try {
			courtOrdNo = Integer.valueOf(jsonData.getString("courtOrdNo"));
		} catch (Exception e) {
			courtOrdNo = null;
		}
		
		if("getByMember".equals(action)) {
			getByMember(req, res, mbrNo);
		}else if("cancel".equals(action)) {
			cancel(req,res,courtOrdNo);
		}
		
		
	}
	
	
	
	private void cancel(HttpServletRequest req, HttpServletResponse res, Integer courtOrdNo) {
		// 1. 更改預約單
		CourtOrderVO courtOrderUpdate = courtOrderService_interface.findByPK(courtOrdNo);
		CourtOrderVO courtOrderVO = new CourtOrderVO();
		courtOrderVO.setCourtOrdNo(courtOrderUpdate.getCourtOrdNo());
		courtOrderVO.setCourtOrdDate(courtOrderUpdate.getCourtOrdDate());
		courtOrderVO.setCourtOrdTime(courtOrderUpdate.getCourtOrdTime());
		courtOrderVO.setCourtOrdTimeEnd(courtOrderUpdate.getCourtOrdTimeEnd());
		courtOrderVO.setCourtVO(courtOrderUpdate.getCourtVO());
		courtOrderVO.setMemberVO(courtOrderUpdate.getMemberVO());
		courtOrderVO.setTotalPrice(courtOrderUpdate.getTotalPrice());
		courtOrderVO.setCourtOrdStat(false);
		courtOrderService_interface.update(courtOrderVO);
		
		// 2. 刪除不開放時間
		Integer courtNo = courtOrderUpdate.getCourtVO().getCourtNo();
		Date orderDate = courtOrderUpdate.getCourtOrdDate();
		Integer orderTime = courtOrderUpdate.getCourtOrdTime();
		Integer orderTimeEnd = courtOrderUpdate.getCourtOrdTimeEnd();
		List<CourtClosedTimeVO> timesOnDate = courtClosedTimeService_interface.findByDate(courtNo, orderDate);
		
		List<Integer> closedTimeToDelete = new ArrayList<>();
		for(CourtClosedTimeVO courtClosedTimeVO: timesOnDate){
			Integer time = courtClosedTimeVO.getCourtClosedTime();
			if(time >= orderTime && time < orderTimeEnd){
				closedTimeToDelete.add(courtClosedTimeVO.getCourtClosedTimeNo());
			}
		}
		
		for(Integer ele:closedTimeToDelete) {
			courtClosedTimeService_interface.delete(ele);
		}
		
	}


	private void getByMember(HttpServletRequest req, HttpServletResponse res, String mbrNo) throws IOException {
		res.setContentType("application/json;charset=UTF-8");
		
		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		Gson gson = builder.create();
		
		List<CourtOrderVO> orderList = courtOrderService_interface.findByMember(mbrNo);
		List<CourtOrderVO> orderListPaid = new ArrayList<>();
		List<CourtImgVO> orderImgList = new ArrayList<>();
		List<String> orderImgBase64 = new ArrayList<>();
		for(CourtOrderVO courtOrderVO: orderList) {
			Boolean stat = courtOrderVO.getCourtOrdStat();
			if(stat) {
				orderListPaid.add(courtOrderVO);
				orderImgList = courtImgService_interface.findByCourtNo(courtOrderVO.getCourtVO().getCourtNo());
				for(int i = 0; i < 1;i++) {
					orderImgBase64.add(Base64.getEncoder().encodeToString(orderImgList.get(i).getCourtImg()));
				}
			}	
		}
		
		String jsonObj = gson.toJson(orderListPaid);
		String jsonObjofImg = gson.toJson(orderImgBase64);
		
		JsonObject combinedJson = new JsonObject();
		combinedJson.addProperty("courtOrderList", jsonObj);
		combinedJson.addProperty("orderImgList", jsonObjofImg);
		PrintWriter out = res.getWriter();
		out.println(combinedJson.toString());
		
	}


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
