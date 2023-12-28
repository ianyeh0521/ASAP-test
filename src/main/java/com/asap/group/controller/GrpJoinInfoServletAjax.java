package com.asap.group.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.group.entity.GrpJoinInfoVO;
import com.asap.group.service.GrpJoinInfoService_interface;
import com.asap.member.dao.MemberDAO;
import com.asap.member.entity.MemberVO;
import com.asap.member.service.MemberService;
import com.asap.util.HibernateProxyTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
		if (grpNo != 0) {
			try {
				List<GrpJoinInfoVO> grpJoinInfoList = grpJoinInfoService_interface.getgrpjoinserviceQuery("grpNo",
						String.valueOf(grpNo));
				if (grpJoinInfoList.size() != 0) {
					// 先把 grpJoinInfoList 丟到暫存的 grpTempList
					List<GrpJoinInfoVO> grpTempList = new ArrayList<>();
//					MemberVO MemberVoDetail = new MemberVO();
					
					
					
//					GrpJoinInfoVO grpJoinInfovo = grpJoinInfoService_interface.findByGrpJoinInfoNo(grpNo);
//					String strpartiMbrNo = grpJoinInfovo.getPartiMbrNo().toString();
//					MemberVoDetail = memberService.findByMbrNo(strpartiMbrNo);
					

					// 把List中的資料 每筆抓出來判斷
					for (GrpJoinInfoVO Vo : grpJoinInfoList) {
						// 0:退出 1:參加;如果狀態為1,就把該筆資料新增
						if (Vo.getGrpJoinStat()) {
							
//							Vo.setMemberVO(MemberVoDetail);
							grpTempList.add(Vo);
						}
					}
					if (grpTempList.size() != 0) {
						// 把暫存的 List 丟回原本的 List
						grpJoinInfoList = grpTempList;
						String jsonGrpJoinInfoVO = gson.toJson(grpJoinInfoList);
						res.getWriter().write(jsonGrpJoinInfoVO);
					} else {
						res.getWriter().write("null");
					}
				} else {
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
