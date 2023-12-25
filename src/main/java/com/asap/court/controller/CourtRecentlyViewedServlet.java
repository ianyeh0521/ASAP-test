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

import org.json.JSONArray;
import org.json.JSONObject;

import com.asap.court.entity.CourtImgVO;
import com.asap.court.entity.CourtVO;
import com.asap.court.service.CourtImgService;
import com.asap.court.service.CourtImgService_interface;
import com.asap.court.service.CourtService;
import com.asap.court.service.CourtService_interface;
import com.asap.util.HibernateProxyTypeAdapter;
import com.asap.util.JedisPoolUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;


@WebServlet("/court/courtRecView.do")
public class CourtRecentlyViewedServlet extends HttpServlet{

	private static JedisPool pool = JedisPoolUtil.getJedisPool();
	private CourtService_interface courtService_interface;
	private CourtImgService_interface courtImgService_interface;
	
	@Override
	public void init() throws ServletException{
		courtService_interface = new CourtService();
		courtImgService_interface = new CourtImgService();
	}

	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action =  req.getParameter("action");
		
		String mbrNo = req.getParameter("mbrNo");
		
		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		Gson gson = builder.create();
		
		// Redis 連線
		Jedis jedis = pool.getResource();
		jedis.select(2);
		
		if("write".equals(action)) {
			Integer courtNo = Integer.valueOf(req.getParameter("courtNo"));
			CourtVO courtVO = courtService_interface.getCourtByCourtNo(courtNo);
			
			List<CourtImgVO>  courtImgVO = courtImgService_interface.findByCourtNo(courtNo);
			String imgBase64 = null;
			for(int i = 0; i < 1;i++) {
				imgBase64 = Base64.getEncoder().encodeToString(courtImgVO.get(i).getCourtImg());
			}
			
			String courtVOJson = gson.toJson(courtVO);
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("img", imgBase64);
			
			JsonParser jsonParser = new JsonParser();
			JsonElement courtVOJsonElement = jsonParser.parse(courtVOJson);
			JsonElement imgJsonElement = jsonParser.parse(jsonObject.toString());
			JsonObject mergedJson = new JsonObject();
			mergedJson.add("courtVO", courtVOJsonElement);
			mergedJson.add("img", imgJsonElement);
			
			String mergedJsonString = mergedJson.toString();
			
			
			// 放入 Redis
			Long length = jedis.llen(mbrNo);
			boolean foundCourtNo = false;
			
			// 判斷是否有重複的場地，並改變排序
			int locaCount = 0;
			List<String> list = jedis.lrange(mbrNo, 0, -1);
			for(String court: list) {
				locaCount += 1;
				JsonObject jsonObj = new Gson().fromJson(court, JsonObject.class);
				int getcourtNo = jsonObj.getAsJsonObject("courtVO").get("courtNo").getAsInt();		// 取得其 courtNo 去判斷
				if(courtNo == getcourtNo) {
					if(locaCount == 2){
						if(length==2) {
							String first = jedis.lpop(mbrNo);
							jedis.rpush(mbrNo, first);
						}else {
							String first = jedis.lpop(mbrNo);
							String last = jedis.rpop(mbrNo);
							jedis.rpush(mbrNo, first);
							jedis.rpush(mbrNo, last);
						}
					}else if(locaCount == 3) {
						String last = jedis.rpop(mbrNo);
						jedis.lpush(mbrNo, last);
					}
					foundCourtNo = true;
					break;
				}
			}
			
			if(!foundCourtNo) {
				if(length <3) {
					jedis.lpush(mbrNo, mergedJsonString);
				}else if(length == 3) {
					jedis.rpop(mbrNo);
					jedis.lpush(mbrNo, mergedJsonString);
				}	
			}	
			
			jedis.expire(mbrNo, 3600);	// 放一小時
			
			jedis.close();
			
		}else if("get".equals(action)) {
			List<String> list = jedis.lrange(mbrNo, 0, -1);
			String jsonString = new Gson().toJson(list);
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(jsonString);
		}
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	
}
