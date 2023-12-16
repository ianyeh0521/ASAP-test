package com.asap.court.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.asap.court.dao.CourtDAO;
import com.asap.court.dao.CourtDAO_interface;
import com.asap.court.entity.CourtImgVO;
import com.asap.court.entity.CourtSaveListVO;
import com.asap.court.entity.CourtVO;
import com.asap.court.service.CourtImgService;
import com.asap.court.service.CourtImgService_interface;
import com.asap.court.service.CourtSaveListService;
import com.asap.court.service.CourtSaveListService_interface;
import com.asap.member.dao.MemberDAO;
import com.asap.member.dao.MemberDAO_interface;
import com.asap.member.entity.MemberVO;
import com.asap.util.HibernateProxyTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

@WebServlet("/court/courtSaveListAjax.do")
public class CourtSaveListServletAjax extends HttpServlet{
	
	private CourtSaveListService_interface courtSaveListService_interface;
	private CourtImgService_interface courtImgService_interface;

	@Override
	public void init() throws ServletException{
		courtSaveListService_interface = new CourtSaveListService();
		courtImgService_interface = new CourtImgService();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 try (BufferedReader reader = req.getReader()) {
            StringBuilder jsonPayload = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                jsonPayload.append(line);
            }

            JSONObject jsonData = new JSONObject(jsonPayload.toString());
            
            String action = jsonData.getString("action");
    		String mbrNo = jsonData.getString("mbrNo");
    		Integer courtNo = null;
    		try {
    			courtNo = Integer.valueOf(jsonData.getString("courtNo"));
			} catch (Exception e) {
				courtNo = null;
			}
    		
            
            if("add".equals(action)) {
            	addToSaveList(mbrNo, courtNo);
            }else if("delete".equals(action)){
            	deleteFromSaveList(mbrNo, courtNo);
            }else if("check".equals(action)){
            	checkSaveList(res, req, mbrNo, courtNo);
            }else if ("getByMember".equals(action)) {
				getByMember(res, req, mbrNo);
			}
         
        } catch (JSONException e) {
            e.printStackTrace();
            res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
	}
	
	
	
	private void getByMember(HttpServletResponse res, HttpServletRequest req, String mbrNo) throws IOException {
		res.setContentType("application/json;charset=UTF-8");

		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		Gson gson = builder.create();
		
		List<CourtSaveListVO> saveList= courtSaveListService_interface.findByMember(mbrNo);
		List<CourtImgVO> saveCourtImgList = new ArrayList<>();
		List<String> saveImgBase64 = new ArrayList<>();
		for (CourtSaveListVO courtSaveListVO: saveList) {
			saveCourtImgList = courtImgService_interface.findByCourtNo(courtSaveListVO.getCourtVO().getCourtNo());
			for(int i = 0; i < 1;i++) {
				saveImgBase64.add(Base64.getEncoder().encodeToString(saveCourtImgList.get(i).getCourtImg())) ;
			}
		}
		
		String jsonObj = gson.toJson(saveList);
		String jsonObjofImg = gson.toJson(saveImgBase64);
		
		JsonObject combinedJson = new JsonObject();
		combinedJson.addProperty("courtSaveList", jsonObj);
		combinedJson.addProperty("saveImgList", jsonObjofImg);
		 try (PrintWriter out = res.getWriter()) {
	            out.println(combinedJson.toString());
	        }
		
	}

	private void checkSaveList(HttpServletResponse res, HttpServletRequest req, String mbrNo,Integer courtNo ) throws IOException {
		if(courtSaveListService_interface.findByMemberAndCourtNo(mbrNo, courtNo)==null) {
			 res.setContentType("text/plain");
			 res.getWriter().write("empty");
		}else {
			res.setContentType("text/plain");
			 res.getWriter().write("isOne");
		}
		
	}

	private void deleteFromSaveList(String mbrNo, Integer courtNo) throws IOException {
		CourtSaveListVO courtSaveListVOToD = courtSaveListService_interface.findByMemberAndCourtNo(mbrNo, courtNo);
		courtSaveListService_interface.delete(courtSaveListVOToD) ;
		
	}

	private void addToSaveList(String mbrNo, Integer courtNo) throws IOException {
		if(courtSaveListService_interface.findByMemberAndCourtNo(mbrNo, courtNo)==null) {
			MemberVO memberVO = new MemberVO();
			memberVO.setMbrNo(mbrNo);
			CourtVO courtVO = new CourtVO();
			courtVO.setCourtNo(courtNo);
			CourtSaveListVO courtSaveListVO = new CourtSaveListVO(memberVO, courtVO);
				
			courtSaveListService_interface.insert(courtSaveListVO); 
		}
		else {
			System.out.println("已在收藏列中!");
		}

	}

	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

}
