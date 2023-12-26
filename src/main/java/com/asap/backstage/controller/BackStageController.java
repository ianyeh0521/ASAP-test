package com.asap.backstage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.mindrot.jbcrypt.BCrypt;

import com.asap.backstage.entity.BackAccessVO;
import com.asap.backstage.entity.BackStageVO;
import com.asap.backstage.service.BackAccessService;
import com.asap.backstage.service.BackAccessService_interface;
import com.asap.backstage.service.BackAccessTypeService;
import com.asap.backstage.service.BackAccessTypeService_interface;
import com.asap.backstage.service.BackStageService;
import com.asap.backstage.service.BackStageService_interface;
import com.asap.coach.entity.CoachSportTypeVO;
import com.asap.coach.entity.CoachVO;
import com.asap.coach.entity.SportCertVO;
import com.asap.coach.service.CoachService;
import com.asap.coach.service.CoachService_interface;
import com.asap.coach.service.CoachSportTypeService;
import com.asap.coach.service.CoachSportTypeService_interface;
import com.asap.coach.service.SportCertService;
import com.asap.coach.service.SportCertService_interface;

@WebServlet("/BackStageController")
public class BackStageController extends HttpServlet {

	private BackStageService_interface bService;
	private BackAccessService_interface bAceService;
	private BackAccessTypeService_interface bTypeService;
	private CoachService_interface cService;
	private CoachSportTypeService_interface coachSportTypeService;
	private SportCertService_interface sportCertService;
	private String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
	private String pwdRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$";
	private String phoneRegex = "09[0-9]{8}";

	@Override
	public void init() throws ServletException {
		bService = new BackStageService();
		bAceService = new BackAccessService();
		bTypeService = new BackAccessTypeService();
		cService = new CoachService();
		coachSportTypeService = new CoachSportTypeService();
		sportCertService = new SportCertService();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		/* dataTables 讀資料 */
		if ("loadBack".equals(action)) {
			res.setContentType("application/json;charset=UTF-8");
			// 返回json
			List<BackStageVO> backStageVOs = bService.getAllBack();
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();

			for (BackStageVO bVo : backStageVOs) {

				String backNo = bVo.getBackNo();
				List<Integer> bAceList = bAceService.findByBackNo(backNo);

				JSONObject item = new JSONObject();
				item.put("BackNo", bVo.getBackNo());
				item.put("BackEmail", bVo.getBackEmail());
				item.put("BackName", bVo.getBackName());
				item.put("BackPhone", bVo.getBackPhone());
				item.put("BackSetTime", sdf.format(bVo.getBackSetTime()));
				item.put("BackUpdTime", sdf.format(bVo.getBackUpdTime()));

				if (bVo.getBackStat()) {
					item.put("BackStat", "正常");

					for (Integer i = 1; i <= bTypeService.countAll(); i++) {

						String bString = "BackAceType" + i;

						if (bAceList.contains(i)) {
							item.put(bString, "V");
						} else {
							item.put(bString, "X");
						}
					}

				} else {
					item.put("BackStat", "停用");

					for (Integer i = 1; i <= bTypeService.countAll(); i++) {

						String bString = "BackAceType" + i;

						item.put(bString, "-");

					}
				}

				array.put(item);
			}

			json.put("data", array);

			// 轉換json
			String output = json.toString();

			// 輸出
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;
		}

		/* 新增人員 */

		if ("add".equals(action)) {
			res.setContentType("application/json;charset=UTF-8");
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

			// 驗證資料

			StringBuffer errorMsgs = new StringBuffer();

			// 驗證名字
			if (backName.trim().length() == 0) {
				errorMsgs.append("姓名不得為空值!\n");
			}

			if (!errorMsgs.toString().equals("")) {
				json.put("result", "fail");
				json.put("errorMsgs", errorMsgs);
				// 轉換json
				String output = json.toString();
				PrintWriter out = res.getWriter();
				out.print(output);
				out.flush();
				return;
				// 程式中斷
			}

			// 驗證Email
			if ((backEmail.trim()).length() == 0) {
				errorMsgs.append("Email不得為空值!\n");
			}

			if (!(backEmail.trim()).matches(emailRegex)) {
				errorMsgs.append("Email格式不正確!\n");
			}

			if (!errorMsgs.toString().equals("")) {
				json.put("result", "fail");
				json.put("errorMsgs", errorMsgs);
				// 轉換json
				String output = json.toString();
				PrintWriter out = res.getWriter();
				out.print(output);
				out.flush();
				return;
				// 程式中斷
			}

			// 驗證手機
			if ((backPhone.trim()).length() == 0) {
				errorMsgs.append("手機號碼不得為空值!\n");
			}

			if (!(backPhone.trim()).matches(phoneRegex)) {
				errorMsgs.append("手機號碼格式不正確!\n");
			}

			if (!errorMsgs.toString().equals("")) {
				json.put("result", "fail");
				json.put("errorMsgs", errorMsgs);
				// 轉換json
				String output = json.toString();
				PrintWriter out = res.getWriter();
				out.print(output);
				out.flush();
				return;
				// 程式中斷
			}

			// 驗證權限
			if ("false".equals(backAceType1) && "false".equals(backAceType2) && "false".equals(backAceType3)
					&& "false".equals(backAceType4) && "false".equals(backAceType5)) {
				errorMsgs.append("請選擇權限種類!");
			}

			if (!errorMsgs.toString().equals("")) {
				json.put("result", "fail");
				json.put("errorMsgs", errorMsgs);
				// 轉換json
				String output = json.toString();
				PrintWriter out = res.getWriter();
				out.print(output);
				out.flush();
				return;
				// 程式中斷
			}

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
			json.put("result", "success");
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
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;

		}

		/* 更新權限 */

		if ("update".equals(action)) {
			res.setContentType("application/json;charset=UTF-8");
			// 返回物件
			JSONObject json = new JSONObject();

			// 取資料
			String backNo = req.getParameter("backNo");
			String backAceType1 = req.getParameter("backAceType1");
			String backAceType2 = req.getParameter("backAceType2");
			String backAceType3 = req.getParameter("backAceType3");
			String backAceType4 = req.getParameter("backAceType4");
			String backAceType5 = req.getParameter("backAceType5");
			System.out.println("後台收到的數據: " + backNo);

			// 驗證資料
			StringBuffer errorMsgs = new StringBuffer();
			// 驗證權限
			if ("X".equals(backAceType1) && "X".equals(backAceType2) && "X".equals(backAceType3)
					&& "X".equals(backAceType4) && "X".equals(backAceType5)) {
				errorMsgs.append("請選擇權限種類!");
			}

			if (!errorMsgs.toString().equals("")) {
				json.put("result", "fail");
				json.put("errorMsgs", errorMsgs);
				// 轉換json
				String output = json.toString();
				PrintWriter out = res.getWriter();
				out.print(output);
				out.flush();
				return;
				// 程式中斷
			}

			// 與資料庫溝通
			// 取出欲修改的後台人員vo
			BackStageVO bVo = bService.findByBackNo(backNo);
			String result = bService.updateBack(bVo);
			System.out.println("backstage的更新結果: " + result);

			// 取出欲修改的後台人員權限vo
			bAceService.suspend(backNo);

			// TYPE1
			if (backAceType1.equals("V")) {
				BackAccessVO bAceVo = new BackAccessVO();
				bAceVo.setBackNo(backNo);
				bAceVo.setBackAceTypeNo(1);
				bAceService.add(bAceVo);

			}

			// TYPE2
			if (backAceType2.equals("V")) {

				BackAccessVO bAceVo = new BackAccessVO();
				bAceVo.setBackNo(backNo);
				bAceVo.setBackAceTypeNo(2);
				bAceService.add(bAceVo);

			}

			// TYPE3
			if (backAceType3.equals("V")) {

				BackAccessVO bAceVo = new BackAccessVO();
				bAceVo.setBackNo(backNo);
				bAceVo.setBackAceTypeNo(3);
				bAceService.add(bAceVo);

			}

			// TYPE4
			if (backAceType4.equals("V")) {

				BackAccessVO bAceVo = new BackAccessVO();
				bAceVo.setBackNo(backNo);
				bAceVo.setBackAceTypeNo(4);
				bAceService.add(bAceVo);

			}

			// TYPE5
			if (backAceType5.equals("V")) {

				BackAccessVO bAceVo = new BackAccessVO();
				bAceVo.setBackNo(backNo);
				bAceVo.setBackAceTypeNo(5);
				bAceService.add(bAceVo);

			}

			// 返回資料
			BackStageVO bStageVO = bService.findByBackNo(backNo);
			json.put("result", "success");
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
			List<Integer> bAcelist = bAceService.findByBackNo(backNo);
			json.put("BackAceType1", bAcelist.contains(1) ? "V" : "X");
			json.put("BackAceType2", bAcelist.contains(2) ? "V" : "X");
			json.put("BackAceType3", bAcelist.contains(3) ? "V" : "X");
			json.put("BackAceType4", bAcelist.contains(4) ? "V" : "X");
			json.put("BackAceType5", bAcelist.contains(5) ? "V" : "X");

			// 轉換json
			String output = json.toString();
			System.out.println("傳給前端的結果: " + output);

			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;

		}

		if ("delete".equals(action)) {
			res.setContentType("application/json;charset=UTF-8");
			// 返回物件
			JSONObject json = new JSONObject();
			// 取資料
			String backNo = req.getParameter("backNo");
			System.out.println("後台收到的數據: " + backNo);
			// 與資料庫溝通
			// 取出欲修改的後台人員vo
			BackStageVO bVo = bService.findByBackNo(backNo);
			bVo.setBackStat(false);
			String result = bService.updateBack(bVo);
			System.out.println("backstage的更新結果: " + result);

			// 取出欲修改的後台人員權限vo
			bAceService.suspend(backNo);

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
			List<Integer> bAcelist = bAceService.findByBackNo(backNo);
			if (bAcelist.isEmpty()) {
				json.put("BackAceType1", "-");
				json.put("BackAceType2", "-");
				json.put("BackAceType3", "-");
				json.put("BackAceType4", "-");
				json.put("BackAceType5", "-");

			} else {
				System.out.println("backAccess更新錯誤");
			}

			// 轉換json
			String output = json.toString();
			System.out.println("傳給前端的結果: " + output);

			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;

		}

		/* dataTables 讀資料 */
		if ("loadCoach".equals(action)) {
			res.setContentType("application/json;charset=UTF-8");
			// 返回json
			List<CoachVO> coachVOs = cService.getAll();
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();

			for (CoachVO cVo : coachVOs) {

				String coachNo = cVo.getCoachNo();
				List<CoachSportTypeVO> sportTypeList = coachSportTypeService.findByCoachNo(coachNo);
				List<SportCertVO>  sportCertList = sportCertService.findByCoachNo(coachNo);
				
				JSONObject item = new JSONObject();
				item.put("CoachNo", cVo.getCoachNo());
				item.put("CoachEmail", cVo.getCoachEmail());
				item.put("CoachName", cVo.getCoachName());
				item.put("CoachPhone", cVo.getCoachPhone());
				item.put("CoachExp", cVo.getCoachExp());
				item.put("CoachStat", cVo.getCoachStat() ? "已啟用" : "未啟用");
				item.put("EmailStat", cVo.getEmailStat() ? "已驗證" : "未驗證");
                //運動證照
				if(sportCertList != null ) {
					if(sportCertList.size() > 0 ) {
						item.put("coachCertImg1", sportCertList.get(0).getSportCertNo());
					}else {
						item.put("coachCertImg1", " ");
					}
					if(sportCertList.size() > 1 ) {
						item.put("coachCertImg2", sportCertList.get(1).getSportCertNo());
					}else {
						item.put("coachCertImg2", " ");
					}
					if(sportCertList.size() > 2 ) {
						item.put("coachCertImg3", sportCertList.get(2).getSportCertNo());
					}else {
						item.put("coachCertImg3", " ");
					}
				}
                //運動種類
				StringBuffer sportType = new StringBuffer(" ");
				if (sportTypeList != null && (!sportTypeList.isEmpty())) {

					for (CoachSportTypeVO vo : sportTypeList) {

						switch (vo.getSportTypeNo()) {
						case 1: {
							sportType.append("游泳 ");
							break;
						}
						case 2: {
							sportType.append("棒球 ");
							break;
						}
						case 3: {
							sportType.append("網球 ");
							break;
						}
						case 4: {
							sportType.append("手球 ");
							break;
						}
						case 5: {
							sportType.append("籃球 ");
							break;
						}
						case 6: {
							sportType.append("排球 ");
							break;
						}
						case 7: {
							sportType.append("桌球 ");
							break;
						}
						case 8: {
							sportType.append("羽球 ");
							break;
						}
						case 9: {
							sportType.append("跑步 ");
							break;
						}
						case 10: {
							sportType.append("自行車 ");
							break;
						}
						case 11: {
							sportType.append("足球 ");
							break;
						}
						case 12: {
							sportType.append("高爾夫 ");
							break;
						}
						default: {
							sportType.append(" ");
							break;
						}
						}
					}
					item.put("SportType", sportType.toString());

				} else {
					item.put("SportType", sportType.toString());
				}

				array.put(item);
			}

			json.put("data", array);

			// 轉換json
			String output = json.toString();

			// 輸出
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;
		}

		// 更新教練權限
		/* dataTables 讀資料 */
		if ("startCoachAcct".equals(action)) {
			res.setContentType("application/json;charset=UTF-8");
			// 設定返回物件
			JSONObject json = new JSONObject();

			// 更新帳號狀態
			String coachNo = req.getParameter("CoachNo");
			CoachVO cVo = cService.findByPK(coachNo);
			if (cVo != null) {
				cVo.setCoachStat(true);
				String result = cService.update(cVo);

				if ("更新失敗".equals(result)) {
					json.put("result", "fail");
				} else {
					json.put("result", "success");
				}
			}

			// 轉換json
			String output = json.toString();

			// 輸出
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;

		}

		/* 後台登入 */
		if ("login".equals(action)) {
			res.setContentType("text/html; charset=UTF-8");
			// 錯誤訊息
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			// 取得參數
			String backEmail = req.getParameter("backEmail");
			String backPwd = req.getParameter("backPwd");
			// 檢查
			if (backEmail == null || backEmail.trim().length() == 0) {
				errorMsgs.add("帳號不得為空值，請重新登入。");
			}

			if (backPwd == null || backPwd.trim().length() == 0) {
				errorMsgs.add("密碼不得為空值，請重新登入。");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/backStage/BackageLogin.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 尋找資料庫
			BackStageVO vo = bService.findByBackEmail(backEmail.trim());

			HttpSession session = req.getSession();
			// 登入
			if ("tha104asap@gmail.com".equals(backEmail.trim()) && "@asap2154".equals(backPwd.trim())) {
				// 主帳號為root,密碼為123456
				session.setAttribute("backVo", "root");
				res.sendRedirect(req.getContextPath() + "/backStage/BackStage.jsp");
				return;
			} else if (vo != null) {
				// 驗證密碼
				String password = vo.getBackPwd();
				if (BCrypt.checkpw(backPwd.trim(), password)) {
					// 成功
					session.setAttribute("backVo", vo);
					res.sendRedirect(req.getContextPath() + "/backStage/BackageHome.jsp");
					return;
				} else {
					errorMsgs.add("帳號或密碼錯誤，請重新登入。");
					req.getRequestDispatcher("/backStage/BackageLogin.jsp").forward(req, res);
					return;// 程式中斷
				}
			} else {
				errorMsgs.add("帳號或密碼錯誤，請重新登入。");
				req.getRequestDispatcher("/backStage/BackageLogin.jsp").forward(req, res);
				return;// 程式中斷
			}
		}
		
		/*登出*/
		if("logout".equals(action)) {
			
			HttpSession session = req.getSession();
			session.invalidate();
			res.sendRedirect(req.getContextPath() + "/backStage/BackageLogin.jsp");
			return;
			
		}
	}

}
