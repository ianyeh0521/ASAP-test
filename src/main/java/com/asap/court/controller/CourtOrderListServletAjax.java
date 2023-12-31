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
import com.asap.member.entity.MbrNewsVO;
import com.asap.member.service.MbrActivService;
import com.asap.member.service.MbrActivService_interface;
import com.asap.member.service.MbrNewsService;
import com.asap.member.service.MbrNewsService_interface;
import com.asap.util.HibernateProxyTypeAdapter;
import com.asap.util.JedisPoolUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@WebServlet("/court/courtOrderListAjax.do")
public class CourtOrderListServletAjax extends HttpServlet {

	private CourtOrderService_interface courtOrderService_interface;
	private CourtImgService_interface courtImgService_interface;
	private CourtClosedTimeService_interface courtClosedTimeService_interface;
	private MbrNewsService_interface mbrNewsSvc;
	private MbrActivService_interface mbrActivService_interface;
	private static JedisPool pool = JedisPoolUtil.getJedisPool();

	@Override
	public void init() throws ServletException {
		courtOrderService_interface = new CourtOrderService();
		courtImgService_interface = new CourtImgService();
		courtClosedTimeService_interface = new CourtClosedTimeService();
		mbrActivService_interface = new MbrActivService();
		mbrNewsSvc = new MbrNewsService();
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

		if ("getByMember".equals(action)) {
			getByMember(req, res, mbrNo);
		} else if ("cancel".equals(action)) {
			cancel(req, res, courtOrdNo, mbrNo);
		}

	}

	private void cancel(HttpServletRequest req, HttpServletResponse res, Integer courtOrdNo, String mbrNo) {
		// 1. 更改預約單
		CourtOrderVO courtOrderUpdate = courtOrderService_interface.findByPK(courtOrdNo);
		courtOrderUpdate.setCourtOrdStat(3);
		courtOrderService_interface.update(courtOrderUpdate);

		// 2. 刪除不開放時間
		Integer courtNo = courtOrderUpdate.getCourtVO().getCourtNo();
		Date orderDate = courtOrderUpdate.getCourtOrdDate();
		Integer orderTime = courtOrderUpdate.getCourtOrdTime();
		Integer orderTimeEnd = courtOrderUpdate.getCourtOrdTimeEnd();
		List<CourtClosedTimeVO> timesOnDate = courtClosedTimeService_interface.findByDate(courtNo, orderDate);

		List<Integer> closedTimeToDelete = new ArrayList<>();
		for (CourtClosedTimeVO courtClosedTimeVO : timesOnDate) {
			Integer time = courtClosedTimeVO.getCourtClosedTime();
			if (time >= orderTime && time < orderTimeEnd) {
				closedTimeToDelete.add(courtClosedTimeVO.getCourtClosedTimeNo());
			}
		}

		for (Integer ele : closedTimeToDelete) {
			courtClosedTimeService_interface.delete(ele);
		}

		// 寫入會員消息
		MbrNewsVO vo2 = new MbrNewsVO();
		vo2.setMbrNo(mbrNo);
		vo2.setNewsSubj("場地取消預約通知");
		vo2.setNewsText("您已取消預約單編號：" + courtOrdNo + "之「" + courtOrderUpdate.getCourtVO().getCourtName() + "」場地");
		vo2.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));

		mbrNewsSvc.add(vo2);

		// 移除會員活動
		Jedis jedis = pool.getResource();
		jedis.select(2);
		Integer mbrActivNo = Integer.valueOf(jedis.get("court" + courtOrdNo));
		mbrActivService_interface.delete(mbrActivService_interface.findByPK(mbrActivNo));
	}

	private void getByMember(HttpServletRequest req, HttpServletResponse res, String mbrNo) throws IOException {
		res.setContentType("application/json;charset=UTF-8");

		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		Gson gson = builder.create();

		List<CourtOrderVO> orderList = courtOrderService_interface.findByMember(mbrNo);
		List<CourtImgVO> orderImgList = new ArrayList<>();
		List<String> orderImgBase64 = new ArrayList<>();
		for (CourtOrderVO courtOrderVO : orderList) {

			orderImgList = courtImgService_interface.findByCourtNo(courtOrderVO.getCourtVO().getCourtNo());
			for (int i = 0; i < 1; i++) {
				orderImgBase64.add(Base64.getEncoder().encodeToString(orderImgList.get(i).getCourtImg()));
			}

		}

		String jsonObj = gson.toJson(orderList);
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
