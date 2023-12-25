package com.asap.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.asap.member.entity.MbrActivVO;
import com.asap.member.service.MbrActivService;
import com.asap.member.service.MbrActivService_interface;

@WebServlet("/memberCalendar")
public class MemberCalendar extends HttpServlet {

	private MbrActivService_interface mbrActivSvc;

	@Override
	public void init() throws ServletException {
		mbrActivSvc = new MbrActivService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		res.setContentType("application/json;charset=UTF-8");

		if ("getEvents".equals(action)) {
			String memberNo = req.getParameter("memberNo");
			List<MbrActivVO> activlist = mbrActivSvc.findByMbrNo(memberNo);

			JSONArray array = new JSONArray();

//			{
//	 			title : "Business Lunch",
//	 			start : "2023-01-03T13:00:00",
//	 			constraint : "businessHours",start : "2023-01-13T10:00:00",
// 			end : "2023-01-13T16:00:00",
//	 		}

			if (activlist != null) {

				for (MbrActivVO vo : activlist) {
					JSONObject json = new JSONObject();
					json.put("title", vo.getActivSubj());
					json.put("start", sdf.format(vo.getActivStartTime()));
					json.put("end", sdf.format(vo.getActivEndTime()));
					array.put(json);

				}

			}

			// 轉換json
			String output = array.toString();

			// 輸出
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;

		}

	}

}
