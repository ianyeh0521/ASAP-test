package com.asap.coach.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.activation.DataSource;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.mindrot.jbcrypt.BCrypt;

import com.asap.coach.entity.CoachSportTypeVO;
import com.asap.coach.entity.CoachVO;
import com.asap.coach.entity.SportCertVO;
import com.asap.coach.service.CoachService;
import com.asap.coach.service.CoachService_interface;
import com.asap.coach.service.CoachSportTypeService;
import com.asap.coach.service.CoachSportTypeService_interface;
import com.asap.coach.service.SportCertService;
import com.asap.coach.service.SportCertService_interface;
import com.asap.member.entity.MemberVO;
import com.asap.util.JavaMail;
import com.asap.util.JedisPoolUtil;
import com.asap.util.MailFormat;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@WebServlet("/CoachController")
@MultipartConfig(fileSizeThreshold = 2 * 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 5 * 1024
		* 1024)
public class CoachController extends HttpServlet {

	private CoachService_interface coachSvc;
	private CoachSportTypeService_interface coachSportTypeSvc;
	private SportCertService_interface sportCertSvc;
	private String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
	private String pwdRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$";
	private String phoneRegex = "09[0-9]{8}";
	private String nameRegex = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,10}$";
	private static JedisPool pool = JedisPoolUtil.getJedisPool();

	private static String getTempPwd() {
		StringBuilder sb = new StringBuilder();
		for (int i = 1; i <= 6; i++) {
			int condition = (int) (Math.random() * 3) + 1;
			switch (condition) {
			case 1:
				char c1 = (char) ((int) (Math.random() * 26) + 65);
				sb.append(c1);
				break;
			case 2:
				char c2 = (char) ((int) (Math.random() * 26) + 97);
				sb.append(c2);
				break;
			case 3:
				sb.append((int) (Math.random() * 10));
			}
		}
		return sb.toString();
	}

	@Override
	public void init() throws ServletException {
		coachSvc = new CoachService();
		coachSportTypeSvc = new CoachSportTypeService();
		sportCertSvc = new SportCertService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		res.setContentType("text/html; charset=UTF-8");

		// 註冊功能
		if ("register".equals(action)) {

			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			// 取資料
			String coachEmail = req.getParameter("CoachEmail");
			String coachPwd = req.getParameter("CoachPwd");
			String coachPwd2 = req.getParameter("CoachPwd2");
			String coachName = req.getParameter("CoachName");
			String coachPhone = req.getParameter("CoachPhone");
			String coachIntro = req.getParameter("CoachIntro");
			String[] coachSportTypeNo = req.getParameterValues("CoachSportTypeNo");
			String coachExp = req.getParameter("CoachExp");
			Part coachImg = req.getPart("CoachImg");
			String certSportType1 = req.getParameter("certSportType1");
			Part coachCertImg1 = req.getPart("CoachCertImg1");
			String certSportType2 = req.getParameter("certSportType2");
			Part coachCertImg2 = req.getPart("CoachCertImg2");
			String certSportType3 = req.getParameter("certSportType3");
			Part coachCertImg3 = req.getPart("CoachCertImg3");

			// 設定返回值
			req.setAttribute("coachEmail", coachEmail);
			req.setAttribute("coachName", coachName);
			req.setAttribute("coachPhone", coachPhone);
			req.setAttribute("coachIntro", coachIntro);
			req.setAttribute("coachExp", coachExp);

			// 驗證資料
			// 驗證Email
			if (coachEmail == null || (coachEmail.trim()).length() == 0) {
				errorMsgs.add("請輸入Email");
			} else {
				if (!(coachEmail.trim()).matches(emailRegex)) {
					errorMsgs.add("Email格式不正確");
				}

				if (coachSvc.findByCoachEmail((coachEmail.trim())) != null) {
					errorMsgs.add("Email已註冊");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachRegister.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證密碼
			if (coachPwd == null || coachPwd2 == null || (coachPwd.trim()).length() == 0
					|| (coachPwd2.trim()).length() == 0) {
				errorMsgs.add("請輸入密碼");

			} else {
				if (!(coachPwd.trim()).matches(pwdRegex)) {
					errorMsgs.add("密碼格式不正確");
				}

				if (!(coachPwd.trim()).equals(coachPwd2.trim())) {
					errorMsgs.add("二次密碼不一致");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachRegister.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證名字
			if (coachName == null || (coachName.trim()).length() == 0) {
				errorMsgs.add("請輸入姓名");
			} else {
				if (!(coachName.trim()).matches(nameRegex)) {
					errorMsgs.add("姓名格式不正確");
				}

			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachRegister.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證電話
			if (coachPhone == null || (coachPhone.trim()).length() == 0) {
				errorMsgs.add("請輸入手機號碼");
			} else {
				if (!(coachPhone.trim()).matches(phoneRegex)) {
					errorMsgs.add("手機號碼格式不正確");

				}

				if (coachSvc.findByCoachPhone(coachPhone.trim()) != null) {
					errorMsgs.add("手機號碼已註冊");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachRegister.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證擅長運動種類
			if (coachSportTypeNo == null || coachSportTypeNo.length == 0) {
				errorMsgs.add("請選擇擅長的運動種類");

			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachRegister.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證教學經驗
			if (coachExp == null || (coachExp.trim()).length() == 0) {
				errorMsgs.add("請輸入教學經驗");
			} else {
				if (Integer.parseInt(coachExp.trim()) < 0 || Integer.parseInt(coachExp.trim()) > 100) {
					errorMsgs.add("教學經驗請輸入0~100之整數");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachRegister.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證個人照
			InputStream coachImgIn = coachImg.getInputStream();
			if (coachImgIn.available() == 0) {
				errorMsgs.add("請上傳個人照");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachRegister.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 設置CoachVo
			CoachVO coachVO = new CoachVO();
			coachVO.setCoachEmail(coachEmail.trim());
			coachVO.setCoachPwd(coachPwd.trim());
			coachVO.setCoachName(coachName.trim());
			coachVO.setCoachPhone(coachPhone.trim());
			coachVO.setCoachExp(Integer.parseInt(coachExp.trim()));

			if (coachIntro != null && coachIntro.trim().length() != 0) {

				coachVO.setCoachIntro(coachIntro.trim());
			} else {
				coachVO.setCoachIntro(null);
			}

			byte[] coachImgFile = coachImgIn.readAllBytes();
			coachImgIn.close();
			coachVO.setCoachImg(coachImgFile);
			String coachNo = coachSvc.add(coachVO);
			System.out.println(coachNo);
			if (!coachNo.equals("fail")) {

				// 設置CoachSportTypeVO
				for (String sportType : coachSportTypeNo) {
					CoachSportTypeVO coachSportTypevo = new CoachSportTypeVO();
					coachSportTypevo.setCoachNo(coachNo);
					coachSportTypevo.setSportTypeNo(Integer.parseInt(sportType));
					coachSportTypeSvc.add(coachSportTypevo);
				}
				// 設置SportCertVo
				InputStream coachCertImg1In = coachCertImg1.getInputStream();
				if ((!certSportType1.equals("請選擇")) && coachCertImg1In.available() != 0) {
					byte[] coachCertImg1File = coachCertImg1In.readAllBytes();
					coachCertImg1In.close();
					SportCertVO sportCertVo = new SportCertVO();
					sportCertVo.setCoachNo(coachNo);
					sportCertVo.setSportCertImg(coachCertImg1File);
					sportCertVo.setSportType(Integer.parseInt(certSportType1));
					sportCertSvc.add(sportCertVo);
				}

				InputStream coachCertImg2In = coachCertImg2.getInputStream();
				if ((!certSportType2.equals("請選擇")) && coachCertImg2In.available() != 0) {
					byte[] coachCertImg2File = coachCertImg2In.readAllBytes();
					coachCertImg2In.close();
					SportCertVO sportCertVo = new SportCertVO();
					sportCertVo.setCoachNo(coachNo);
					sportCertVo.setSportCertImg(coachCertImg2File);
					sportCertVo.setSportType(Integer.parseInt(certSportType2));
					sportCertSvc.add(sportCertVo);
				}

				InputStream coachCertImg3In = coachCertImg3.getInputStream();
				if ((!certSportType3.equals("請選擇")) && coachCertImg3In.available() != 0) {
					byte[] coachCertImg3File = coachCertImg3In.readAllBytes();
					coachCertImg3In.close();
					SportCertVO sportCertVo = new SportCertVO();
					sportCertVo.setCoachNo(coachNo);
					sportCertVo.setSportCertImg(coachCertImg3File);
					sportCertVo.setSportType(Integer.parseInt(certSportType3));
					sportCertSvc.add(sportCertVo);
				}

				HttpSession session = req.getSession();
//				session.setAttribute("registerSuccess", "註冊成功，請登入。");
				session.setAttribute("coachNo", coachNo);
//				session.setAttribute("coachEmail", coachEmail);
//				session.setAttribute("coachName", coachName);
//				session.setAttribute("coachEmailcheck", "false");
//				req.getRequestDispatcher("/coach/EmailVerify.jsp").forward(req, res);
				res.sendRedirect(req.getContextPath() + "/coach/CoachEmailVerify.jsp");
				return;
			} else {
				errorMsgs.add("註冊失敗，請稍後再試。");
				req.getRequestDispatcher("/coach/CoachRegister.jsp").forward(req, res);
				return;// 程式中斷
			}

		}

		// 信箱驗證功能
		if ("emailVerify".equals(action)) {

			// 取得資料
			String coachNo = req.getParameter("coachNo");
//			String coachEmail = req.getParameter("coachEmail");
			String emailVerifyCode = req.getParameter("emailVerifyCode");
			// 驗證資料
			if (emailVerifyCode == null || emailVerifyCode.trim().length() == 0) {
				req.setAttribute("errorMsg", "連結信已逾時，請重新申請。");
				req.getRequestDispatcher("/coach/CoachEmailVerify.jsp").forward(req, res);
				return;
			}
			// 取得redis資料
			Jedis jedis = pool.getResource();
			String tempAuth = jedis.get("MailVerify:" + coachNo);
			jedis.close();

			// 返回
			if (tempAuth == null) {
				System.out.println("連結信已逾時，請重新申請");
				req.setAttribute("errorMsg", "連結信已逾時，請重新申請。");
				req.getRequestDispatcher("/coach/CoachEmailVerify.jsp").forward(req, res);
				return;
			} else if ((emailVerifyCode.trim()).equals(tempAuth)) {
				System.out.println("驗證成功!");
				CoachVO cVo = coachSvc.findByPK(coachNo);
//				String coachEmail = cVo.getCoachEmail();
				// 更新資料庫
				cVo.setEmailStat(true);
				String upResult = coachSvc.update(cVo);
				if ("更新成功".equals(upResult)) {
					HttpSession session = req.getSession();
					session.removeAttribute("coachNo");
//					session.removeAttribute("coachName");
//					session.removeAttribute("coachEmailcheck");
//					session.setAttribute("coachEmail", coachEmail);
					session.setAttribute("registerSuccess", "驗證成功，請登入。");
					res.sendRedirect(req.getContextPath() + "/coach/CoachLogin.jsp");
					return;
				} else {
					req.setAttribute("errorMsg", "系統錯誤，請稍後再試。");
					req.getRequestDispatcher("/coach/CoachEmailVerify.jsp").forward(req, res);
					return;
				}

			} else {
				System.out.println("驗證有誤，請重新申請");
				req.setAttribute("errorMsg", "驗證有誤，請重新申請。");
				req.getRequestDispatcher("/coach/CoachEmailVerify.jsp").forward(req, res);
				return;
			}

		}

		// 登入功能

		if ("login".equals(action)) {

			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			// 確認輸入訊息
			HttpSession session = req.getSession();
			String verificationCode = (String) session.getAttribute("verificationCode");
			session.removeAttribute("verificationCode");
			String inputEmail = req.getParameter("coachEmail");
			String inputPwd = req.getParameter("coachPwd");
			String inputVerCode = req.getParameter("verifycode");

//			System.out.println(verificationCode);
//			System.out.println(inputVerCode);
//			System.out.println(inputPwd);
//			System.out.println(inputEmail);

			// 設定返回值
			req.setAttribute("coachEmail", inputEmail);

			if (inputVerCode == null || (inputVerCode.trim()).length() == 0) {
				errorMsgs.add("請輸入驗證碼。");

			} else {
				if (!verificationCode.equals(inputVerCode.trim())) {

					errorMsgs.add("驗證碼錯誤，請重新登入。");
				}
			}

			if (!errorMsgs.isEmpty()) {

				req.getRequestDispatcher("/coach/CoachLogin.jsp").forward(req, res);
				return;// 程式中斷
			}

			if (inputEmail == null || inputPwd == null || (inputEmail.trim()).length() == 0
					|| (inputPwd.trim()).length() == 0) {
				errorMsgs.add("帳號或密碼不可為空，請重新登入。");

			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachLogin.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 尋找資料庫

			CoachVO cVo = coachSvc.findByCoachEmail(inputEmail.trim());
			// 未註冊
			if (cVo == null) {
				session.setAttribute("noRegister", "尚未註冊，請註冊後再登入。");
				session.setAttribute("coachEmail", inputEmail.trim());
				res.sendRedirect(req.getContextPath() + "/coach/CoachRegister.jsp");
				return;// 程式中斷
			}

			if (!(inputEmail.trim()).matches(emailRegex) || !(inputPwd.trim()).matches(pwdRegex)) {
				errorMsgs.add("帳號或密碼錯誤，請重新登入。");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachLogin.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 登入失敗
			String password = cVo.getCoachPwd();
			if (!BCrypt.checkpw(inputPwd.trim(), password)) {
				errorMsgs.add("密碼錯誤，請重新登入。");
				req.getRequestDispatcher("/coach/CoachLogin.jsp").forward(req, res);
				return;// 程式中斷
			} else {
				// 登入成功

				// 取得運動種類
				List<CoachSportTypeVO> sportTypeList = coachSportTypeSvc.findByCoachNo(cVo.getCoachNo());
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
					session.setAttribute("SportType", sportType.toString());

				} else {
					session.setAttribute("SportType", sportType.toString());
				}

				session.setAttribute("coachVo", cVo);
				res.sendRedirect(req.getContextPath() + "/coach/CoachHome.jsp");
				return;// 程式中斷
			}

		}

		// 更新資料
		if ("updateInfo".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			// 取出編號
			HttpSession session = req.getSession();
			CoachVO coachVO = (CoachVO) session.getAttribute("coachVo");
			String coachNo = coachVO.getCoachNo();
			String coachPhoneOld = coachVO.getCoachPhone();

			// 取資料
//			String coachEmail = req.getParameter("CoachEmail");
			String coachName = req.getParameter("CoachName");
			String coachPhone = req.getParameter("CoachPhone");
			String coachIntro = req.getParameter("CoachIntro");
			String[] coachSportTypeNo = req.getParameterValues("CoachSportTypeNo");
			String coachExp = req.getParameter("CoachExp");
			Part coachImg = req.getPart("CoachImg");
			String certSportType1 = req.getParameter("certSportType1");
			Part coachCertImg1 = req.getPart("CoachCertImg1");
			String certSportType2 = req.getParameter("certSportType2");
			Part coachCertImg2 = req.getPart("CoachCertImg2");
			String certSportType3 = req.getParameter("certSportType3");
			Part coachCertImg3 = req.getPart("CoachCertImg3");

			// 驗證資料
			// 驗證名字
			if (coachName == null || (coachName.trim()).length() == 0) {
				errorMsgs.add("請輸入姓名");
			} else {
				if (!(coachName.trim()).matches(nameRegex)) {
					errorMsgs.add("姓名格式不正確");
				}

			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachUpdateInfo.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證電話
			if (coachPhone == null || (coachPhone.trim()).length() == 0) {
				errorMsgs.add("請輸入手機號碼");
			} else {
				if (!(coachPhone.trim()).matches(phoneRegex)) {
					errorMsgs.add("手機號碼格式不正確");

				}

				if (!coachPhoneOld.equals(coachPhone.trim())) {
					if (coachSvc.findByCoachPhone(coachPhone.trim()) != null) {
						errorMsgs.add("手機號碼已註冊");
					}
				}

			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachUpdateInfo.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證擅長運動種類
			if (coachSportTypeNo == null || coachSportTypeNo.length == 0) {
				errorMsgs.add("請選擇擅長的運動種類");

			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachUpdateInfo.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證教學經驗
			if (coachExp == null || (coachExp.trim()).length() == 0) {
				errorMsgs.add("請輸入教學經驗");
			} else {
				if (Integer.parseInt(coachExp.trim()) < 0 || Integer.parseInt(coachExp.trim()) > 100) {
					errorMsgs.add("教學經驗請輸入0~100之整數");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachUpdateInfo.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 取得個人照

			InputStream coachImgIn = coachImg.getInputStream();
			if (coachImgIn.available() != 0) {
				byte[] coachImgFile = coachImgIn.readAllBytes();
				coachImgIn.close();
				coachVO.setCoachImg(coachImgFile);
			}

			// 設置CoachVo
			coachVO.setCoachName(coachName.trim());
			coachVO.setCoachPhone(coachPhone.trim());
			coachVO.setCoachExp(Integer.parseInt(coachExp.trim()));
			if (coachIntro != null && coachIntro.trim().length() != 0) {
				coachVO.setCoachIntro(coachIntro.trim());
			} else {
				coachVO.setCoachIntro(null);
			}

			// 更新資料庫
			String updateResult = coachSvc.update(coachVO);
			System.out.println(updateResult);

			// 移除舊資料CoachSportTypeVO
			String coachSportTypeResult = coachSportTypeSvc.cleanByCoachNo(coachNo);
			System.out.println(coachSportTypeResult);

			// 設置CoachSportTypeVO
			for (String sportType : coachSportTypeNo) {
				CoachSportTypeVO coachSportTypevo = new CoachSportTypeVO();
				coachSportTypevo.setCoachNo(coachNo);
				coachSportTypevo.setSportTypeNo(Integer.parseInt(sportType));
				coachSportTypeSvc.add(coachSportTypevo);
			}

			// 移除舊資料SportCertVo
			List<SportCertVO> sportCertList = sportCertSvc.findByCoachNo(coachNo);
			String sportCertSvcResult = sportCertSvc.cleanByCoachNo(coachNo);
			System.out.println(sportCertSvcResult);

			// 設置SportCertVo
			InputStream coachCertImg1In = coachCertImg1.getInputStream();
			if ((!certSportType1.equals("請選擇")) && coachCertImg1In.available() != 0) {
				byte[] coachCertImg1File = coachCertImg1In.readAllBytes();
				coachCertImg1In.close();
				SportCertVO sportCertVo = new SportCertVO();
				sportCertVo.setCoachNo(coachNo);
				sportCertVo.setSportCertImg(coachCertImg1File);
				sportCertVo.setSportType(Integer.parseInt(certSportType1));
				sportCertSvc.add(sportCertVo);
			} else if (sportCertList != null && (sportCertList.size()) >= 1) {
				sportCertSvc.add(sportCertList.get(0));
			}

			InputStream coachCertImg2In = coachCertImg2.getInputStream();
			if ((!certSportType2.equals("請選擇")) && coachCertImg2In.available() != 0) {
				byte[] coachCertImg2File = coachCertImg2In.readAllBytes();
				coachCertImg2In.close();
				SportCertVO sportCertVo = new SportCertVO();
				sportCertVo.setCoachNo(coachNo);
				sportCertVo.setSportCertImg(coachCertImg2File);
				sportCertVo.setSportType(Integer.parseInt(certSportType2));
				sportCertSvc.add(sportCertVo);
			} else if (sportCertList != null && (sportCertList.size()) >= 2) {
				sportCertSvc.add(sportCertList.get(1));
			}

			InputStream coachCertImg3In = coachCertImg3.getInputStream();
			if ((!certSportType3.equals("請選擇")) && coachCertImg3In.available() != 0) {
				byte[] coachCertImg3File = coachCertImg3In.readAllBytes();
				coachCertImg3In.close();
				SportCertVO sportCertVo = new SportCertVO();
				sportCertVo.setCoachNo(coachNo);
				sportCertVo.setSportCertImg(coachCertImg3File);
				sportCertVo.setSportType(Integer.parseInt(certSportType3));
				sportCertSvc.add(sportCertVo);
			} else if (sportCertList != null && (sportCertList.size()) >= 3) {
				sportCertSvc.add(sportCertList.get(2));
			}
			// 重新放置session中的vo
			CoachVO cVo = coachSvc.findByPK(coachNo);
			session.setAttribute("coachVo", cVo);
			// 取得運動種類
			List<CoachSportTypeVO> sportTypeList = coachSportTypeSvc.findByCoachNo(cVo.getCoachNo());
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
				session.setAttribute("SportType", sportType.toString());

			} else {
				session.setAttribute("SportType", sportType.toString());
			}

			res.sendRedirect(req.getContextPath() + "/coach/CoachHome.jsp");
			return;

		}

		// 忘記密碼
		if ("forgetPwd".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			// 取參數
			String coachEmail = req.getParameter("coachEmail");

			// 驗證Email
			if (coachEmail == null || (coachEmail.trim()).length() == 0) {
				errorMsgs.add("請輸入Email");
			} else {
				if (!(coachEmail.trim()).matches(emailRegex)) {
					errorMsgs.add("Email格式不正確");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachForgetPwd.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 尋找資料庫
			CoachVO coachVO = coachSvc.findByCoachEmail(coachEmail.trim());
			if (coachVO == null) {
				errorMsgs.add("Email尚未註冊");
				req.getRequestDispatcher("/coach/CoachForgetPwd.jsp").forward(req, res);
				return;// 程式中斷
			} else {
				// 設定郵件細節
				int minute = 30;
				String newPwd = getTempPwd();
				String coachName = coachVO.getCoachName();
				String coachNo = coachVO.getCoachNo();
				String coach_Email = coachVO.getCoachEmail();
				// 新密碼郵件

				String title = "ASAP忘記密碼信";
				String content = "您的暫時性密碼為  " + newPwd + "  ,請於 " + minute + " 分鐘內輸入，謝謝。";
				MailFormat mailFormat = new MailFormat(coachName, content);
				InputStream in = getServletContext().getResourceAsStream("/newImg/mailLogo.png");
				DataSource dataSource = new ByteArrayDataSource(in, "application/png");
				// 存入redis
				Jedis jedis = pool.getResource();
				jedis.set("TemporaryPwd:" + coachNo, newPwd);
				jedis.expire("TemporaryPwd:" + coachNo, minute * 60);
				// 關閉redis
				jedis.close();
				// 寄出信件
				JavaMail mail = new JavaMail(coach_Email, title, mailFormat.getMessageTextAndImg(), dataSource);
				mail.sendMail();
				HttpSession session = req.getSession();
				session.setAttribute("coachNo", coachNo);
				res.sendRedirect(req.getContextPath() + "/coach/CoachResetPwd.jsp");
				return;

			}

		}

		// 重設密碼
		if ("resetPwd".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			// 取參數
			HttpSession session = req.getSession();
			String coachNo = (String) session.getAttribute("coachNo");
			String coachTempPwd = req.getParameter("coachTempPwd");
			String coachPwd = req.getParameter("coachPwd");
			String coachPwd2 = req.getParameter("coachPwd2");
			// 確認資料
			if (coachPwd == null || coachPwd2 == null || (coachPwd.trim()).length() == 0
					|| (coachPwd2.trim()).length() == 0) {
				errorMsgs.add("請輸入密碼");
			} else {
				if (!(coachPwd.trim()).matches(pwdRegex)) {
					errorMsgs.add("密碼格式不正確");
				}
				if (!(coachPwd.trim()).equals(coachPwd2.trim())) {
					errorMsgs.add("二次密碼不一致");
				}
			}

			if (coachTempPwd == null || (coachTempPwd.trim()).length() == 0) {
				errorMsgs.add("請輸入暫時性密碼");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/coach/CoachResetPwd.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 取得redis資料
			Jedis jedis = pool.getResource();
			String tempAuth = jedis.get("TemporaryPwd:" + coachNo);
			jedis.close();
			// 驗證
			if (tempAuth == null) {
				errorMsgs.add("連結信已逾時，請重新申請");
				req.getRequestDispatcher("/coach/CoachForgetPwd.jsp").forward(req, res);
				return;
			} else if (coachTempPwd.trim().equals(tempAuth)) {
				System.out.println("驗證成功!");
				CoachVO cVo = coachSvc.findByPK(coachNo);
				// 更新資料庫
				cVo.setCoachPwd(coachPwd.trim());
				String upResult = coachSvc.updatePwd(cVo);
				if ("更新成功".equals(upResult)) {

					session.setAttribute("registerSuccess", "密碼更改成功，請登入。");
					res.sendRedirect(req.getContextPath() + "/coach/CoachLogin.jsp");
					return;
				} else {
					errorMsgs.add("系統錯誤，請稍後再試");
					req.getRequestDispatcher("/coach/CoachResetPwd.jsp").forward(req, res);
					return;
				}

			} else {
//						System.out.println("驗證有誤，請重新申請");
				errorMsgs.add("驗證有誤，請重新申請");
				req.getRequestDispatcher("/coach/CoachForgetPwd.jsp").forward(req, res);
				return;
			}

		}

		// 登出
		if ("logout".equals(action)) {
			HttpSession session = req.getSession();
			session.invalidate();
			res.sendRedirect(req.getContextPath() + "/ASAPwelcome.jsp");
			return;
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

}
