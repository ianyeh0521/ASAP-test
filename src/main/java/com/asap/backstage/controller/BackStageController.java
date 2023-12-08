package com.asap.backstage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.asap.backstage.entity.BackAccessVO;
import com.asap.backstage.entity.BackStageVO;
import com.asap.backstage.service.BackAccessService;
import com.asap.backstage.service.BackAccessTypeService;
import com.asap.backstage.service.BackStageService;

@WebServlet("/BackStageController")
public class BackStageController extends HttpServlet {

	private BackStageService bService = new BackStageService();
	private BackAccessService bAceService = new BackAccessService();
	private BackAccessTypeService bTypeService = new BackAccessTypeService();

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");

		if ("load".equals(action)) {
			List<BackStageVO> backStageVOs = bService.getAllBack();
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();

			for (BackStageVO bVo : backStageVOs) {

				JSONObject item = new JSONObject();
				item.put("BackNo", bVo.getBackNo());
				item.put("BackEmail", bVo.getBackEmail());
				item.put("BackName", bVo.getBackName());
				item.put("BackPhone", bVo.getBackPhone());
				item.put("BackSetTime", sdf.format(bVo.getBackSetTime()));
				item.put("BackUpdTime", sdf.format(bVo.getBackUpdTime()));
				if (bVo.getBackStat()) {
					item.put("BackStat", "正常");
				} else {
					item.put("BackStat", "停用");
				}

				String backNo = bVo.getBackNo();

				List<Integer> bAceList = bAceService.findByBackNo(backNo);

				for (Integer i = 1; i <= bTypeService.countAll(); i++) {

					String bString = "BackAceType" + i;

					if (bAceList.contains(i)) {

						item.put(bString, "V");
					} else {
						item.put(bString, "X");
					}
				}

				array.put(item);
			}

			json.put("data", array);

			// 轉換json
			String output = json.toString();
//			System.out.println(output);

			res.setContentType("application/json;charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;
		}

		if ("add".equals(action)) {
			// 返回物件
			JSONObject json = new JSONObject();

			// 取資料
			String backEmail = req.getParameter("backEmail");
			String backName = req.getParameter("backName");
			String backPhone = req.getParameter("backPhone");
			String backAceType1 = req.getParameter("backAceType1");
			String backAceType2 = req.getParameter("backAceType2");
			String backAceType3 = req.getParameter("backAceType3");
			String backAceType4 = req.getParameter("backAceType4");
			String backAceType5 = req.getParameter("backAceType5");
//			System.out.println(backAceType1);
//			System.out.println(backAceType2);
//			System.out.println(backEmail);

			// 與資料庫溝通
			// 設定後台人員vo
			BackStageVO bVo = new BackStageVO();
			bVo.setBackEmail(backEmail);
			bVo.setBackName(backName);
			bVo.setBackPhone(backPhone);
			bVo.setBackPwd(backPhone);// 暫時用手機號碼當密碼

			// 傳入資料庫
			String backNo = bService.addBack(bVo);
			System.out.println(backNo);

			// 設定後台權限vo

			if ("true".equals(backAceType1)) {
				BackAccessVO bAceVo = new BackAccessVO();
				bAceVo.setBackNo(backNo);
				bAceVo.setBackAceTypeNo(1);
				bAceService.add(bAceVo);
				json.put("BackAceType1", "V");
			} else {
				json.put("BackAceType1", "X");
			}

			if ("true".equals(backAceType2)) {
				BackAccessVO bAceVo = new BackAccessVO();
				bAceVo.setBackNo(backNo);
				bAceVo.setBackAceTypeNo(2);
				bAceService.add(bAceVo);
				json.put("BackAceType2", "V");
			} else {
				json.put("BackAceType2", "X");
			}
			if ("true".equals(backAceType3)) {
				BackAccessVO bAceVo = new BackAccessVO();
				bAceVo.setBackNo(backNo);
				bAceVo.setBackAceTypeNo(3);
				bAceService.add(bAceVo);
				json.put("BackAceType3", "V");
			} else {
				json.put("BackAceType3", "X");
			}

			if ("true".equals(backAceType4)) {
				BackAccessVO bAceVo = new BackAccessVO();
				bAceVo.setBackNo(backNo);
				bAceVo.setBackAceTypeNo(4);
				bAceService.add(bAceVo);
				json.put("BackAceType4", "V");
			} else {
				json.put("BackAceType4", "X");
			}

			if ("true".equals(backAceType5)) {
				BackAccessVO bAceVo = new BackAccessVO();
				bAceVo.setBackNo(backNo);
				bAceVo.setBackAceTypeNo(5);
				bAceService.add(bAceVo);
				json.put("BackAceType5", "V");
			} else {
				json.put("BackAceType5", "X");
			}
			// 返回資料
			BackStageVO bStageVO = bService.findByBackNo(backNo);
			json.put("BackNo", bStageVO.getBackNo());
			json.put("BackEmail", bStageVO.getBackEmail());
			json.put("BackName", bStageVO.getBackName());
			json.put("BackPhone", bStageVO.getBackPhone());
			json.put("BackSetTime", sdf.format(bStageVO.getBackSetTime()));
			json.put("BackUpdTime", sdf.format(bStageVO.getBackUpdTime()));
			if (bStageVO.getBackStat()) {
				json.put("BackStat", "正常");
			} else {
				json.put("BackStat", "停用");
			}

			// 轉換json
			String output = json.toString();
//			System.out.println(output);

			res.setContentType("application/json;charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;

		}

		if ("update".equals(action)) {
			// 返回物件
			JSONObject json = new JSONObject();

			// 取資料
			String backNo = req.getParameter("backNo");
			String backName = req.getParameter("backName");
			String backPhone = req.getParameter("backPhone");
			String backAceType1 = req.getParameter("backAceType1");
			String backAceType2 = req.getParameter("backAceType2");
			String backAceType3 = req.getParameter("backAceType3");
			String backAceType4 = req.getParameter("backAceType4");
			String backAceType5 = req.getParameter("backAceType5");

			// 與資料庫溝通
			// 取出欲修改的後台人員vo和權限vo
			BackStageVO bVo = bService.findByBackNo(backNo);
			List<Integer> bAceList = bAceService.findByBackNo(backNo);

			// 設定後台人員vo
			if ((!backName.equals(bVo.getBackName())) || (!backPhone.equals(bVo.getBackPhone()))) {
				bVo.setBackName(backName);
				bVo.setBackPhone(backPhone);
			}

			String result = bService.updateBack(bVo);
			System.out.println(result);

			// 設定後台人員權限vo

			// TYPE1
			if (backAceType1.equals("V")) {
				if (!bAceList.contains(1)) {
					BackAccessVO bAceVo = new BackAccessVO();
					bAceVo.setBackNo(backNo);
					bAceVo.setBackAceTypeNo(1);
					bAceService.add(bAceVo);
				}
			}

			if (backAceType1.equals("X")) {
				if (bAceList.contains(1)) {
					bAceService.delete(bAceService.findVo(backNo, 1));
				}

			}

			// TYPE2
			if (backAceType2.equals("V")) {
				if (!bAceList.contains(2)) {
					BackAccessVO bAceVo = new BackAccessVO();
					bAceVo.setBackNo(backNo);
					bAceVo.setBackAceTypeNo(2);
					bAceService.add(bAceVo);
				}

			}
			if (backAceType2.equals("X")) {
				if (bAceList.contains(2)) {
					bAceService.delete(bAceService.findVo(backNo, 2));
				}

			}

			// TYPE3
			if (backAceType3.equals("V")) {
				if (!bAceList.contains(3)) {
					BackAccessVO bAceVo = new BackAccessVO();
					bAceVo.setBackNo(backNo);
					bAceVo.setBackAceTypeNo(3);
					bAceService.add(bAceVo);
				}

			}
			if (backAceType3.equals("X")) {
				if (bAceList.contains(3)) {
					bAceService.delete(bAceService.findVo(backNo, 3));
				}
			}

			// TYPE4
			if (backAceType4.equals("V")) {
				if (!bAceList.contains(4)) {
					BackAccessVO bAceVo = new BackAccessVO();
					bAceVo.setBackNo(backNo);
					bAceVo.setBackAceTypeNo(4);
					bAceService.add(bAceVo);
				}

			}
			if (backAceType4.equals("X")) {
				if (bAceList.contains(4)) {
					bAceService.delete(bAceService.findVo(backNo, 4));
				}

			}

			// TYPE5
			if (backAceType5.equals("V")) {
				if (!bAceList.contains(5)) {
					BackAccessVO bAceVo = new BackAccessVO();
					bAceVo.setBackNo(backNo);
					bAceVo.setBackAceTypeNo(5);
					bAceService.add(bAceVo);
				}

			}
			if (backAceType5.equals("X")) {
				if (bAceList.contains(5)) {
					bAceService.delete(bAceService.findVo(backNo, 15));
				}

			}

			// 返回資料
			BackStageVO bStageVO = bService.findByBackNo(backNo);
			json.put("BackNo", bStageVO.getBackNo());
			json.put("BackEmail", bStageVO.getBackEmail());
			json.put("BackName", bStageVO.getBackName());
			json.put("BackPhone", bStageVO.getBackPhone());
			json.put("BackSetTime", sdf.format(bStageVO.getBackSetTime()));
			json.put("BackUpdTime", sdf.format(bStageVO.getBackUpdTime()));
			if (bStageVO.getBackStat()) {
				json.put("BackStat", "正常");
			} else {
				json.put("BackStat", "停用");
			}
			json.put("BackAceType1", backAceType1);
			json.put("BackAceType2", backAceType2);
			json.put("BackAceType3", backAceType3);
			json.put("BackAceType4", backAceType4);
			json.put("BackAceType5", backAceType5);

			// 轉換json
			String output = json.toString();
			System.out.println(output);

			res.setContentType("application/json;charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;

		}
	}

}
