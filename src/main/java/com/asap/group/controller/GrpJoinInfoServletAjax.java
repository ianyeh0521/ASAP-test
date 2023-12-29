package com.asap.group.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.asap.group.entity.GrpJoinInfoVO;
import com.asap.group.service.GrpJoinInfoService_interface;
import com.asap.member.entity.MemberVO;
import com.asap.member.service.MemberService;
import com.asap.util.HibernateProxyTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/GrpJoinInfoAjax.do")
public class GrpJoinInfoServletAjax extends HttpServlet {
	private GrpJoinInfoService_interface grpJoinInfoService_interface;
	private MemberService memberService;
	
	@Override
	public void init() throws ServletException {
		grpJoinInfoService_interface = new GrpJoinInfoService_interface();
		memberService = new MemberService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("application/json;charset=UTF-8");

		String strGrpNo = req.getParameter("GrpNo");
		Integer grpNo = 0;
		try {
			grpNo = Integer.parseInt(strGrpNo);
		} catch (NumberFormatException e) {
			
		}
		
		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);

		Gson gson = builder.create();
		
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVo");
		String jsonMemberVO = gson.toJson(memberVO);
		
		if (grpNo != 0) {
			try {
				List<GrpJoinInfoVO> grpJoinInfoList = grpJoinInfoService_interface.getgrpjoinserviceQuery("grpNo",
						String.valueOf(grpNo));
				if (grpJoinInfoList.size() != 0) {
					// 先把 grpJoinInfoList 丟到暫存的 grpTempList
					List<GrpJoinInfoVO> grpTempList = new ArrayList<>();

					// 把List中的資料 每筆抓出來判斷
					for (GrpJoinInfoVO Vo : grpJoinInfoList) {
						// 0:退出 1:參加;如果狀態為1,就把該筆資料新增
						if (Vo.getGrpJoinStat()) {
							grpTempList.add(Vo);
						}
					}
					if (grpTempList.size() != 0) {
						// 把暫存的 List 丟回原本的 List
						grpJoinInfoList = grpTempList;
						String jsonGrpJoinInfoVO = gson.toJson(grpJoinInfoList);
						
						//將原本的 JSON 資料轉成 JsonArray
						JsonArray jsonArray = JsonParser.parseString(jsonGrpJoinInfoVO).getAsJsonArray();
						
						//取出每筆資料的參與人編號(PartiMbrNo)，查對應的會員資料
				        for (JsonElement element : jsonArray) {
				            JsonObject jsonObject = element.getAsJsonObject();
				            String PartiMbrNo = jsonObject.get("partiMbrNo").getAsString();
				            
				    		MemberVO MemberVoDetail = new MemberVO();
				    		MemberVoDetail = memberService.findByMbrNo(PartiMbrNo);
				    		
				    		//將對應資料寫入 jsonObject
				    		jsonObject.addProperty("m_MbrName", MemberVoDetail.getMbrName());
				    		jsonObject.addProperty("m_MbrPhone", MemberVoDetail.getMbrPhone());
				    		jsonObject.addProperty("m_MbrEmail", MemberVoDetail.getMbrEmail());
				        }
				        
				        //將 jsonObject 重新轉回 JSON 的字串
				        String updatedJsonGrpJoinInfoVO = gson.toJson(jsonArray);
						
						res.getWriter().write(updatedJsonGrpJoinInfoVO);
						
					} 
					else {
						res.getWriter().write("null");
					}
				} 
				else {
					res.setStatus(HttpServletResponse.SC_OK);
					res.getWriter().write("null");
				}
				
			} catch (NumberFormatException e) {
				System.out.println("-------Invalid GrpNo format-------");
			}
		}		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

}
