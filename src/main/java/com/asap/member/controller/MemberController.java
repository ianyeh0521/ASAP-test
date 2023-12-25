package com.asap.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.activation.DataSource;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.asap.coach.entity.CoachVO;
import com.asap.member.entity.MemberVO;
import com.asap.member.service.MemberService;
import com.asap.member.service.MemberService_interface;
import com.asap.util.JedisPoolUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import com.asap.util.JavaMail;
import com.asap.util.MailFormat;
import com.mysql.cj.Session;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet {

	private String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
	private String pwdRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$";
	private String phoneRegex = "09[0-9]{8}";
	private String nameRegex = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,10}$";
	private MemberService_interface mService;
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
		// 引入service
		mService = new MemberService();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		res.setContentType("text/html; charset=UTF-8");

		// 登入功能
		if ("login".equals(action)) {

			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			// 確認輸入訊息
			HttpSession session = req.getSession();
			String verificationCode = (String) session.getAttribute("verificationCode");
			session.removeAttribute("verificationCode");
			String inputEmail = req.getParameter("mbrEmail");
			String inputPwd = req.getParameter("mbrPwd");
			String inputVerCode = req.getParameter("verifycode");

//			System.out.println(verificationCode);
//			System.out.println(inputVerCode);
//			System.out.println(inputPwd);
//			System.out.println(inputEmail);

			if ((inputVerCode.trim()).length() == 0 || inputVerCode == null) {
				errorMsgs.add("請輸入驗證碼。");

			} else {
				if (!inputVerCode.trim().equals(verificationCode)) {

					errorMsgs.add("驗證碼錯誤，請重新登入。");
				}
			}
			if (!errorMsgs.isEmpty()) {

				req.getRequestDispatcher("/member/MemberLogin.jsp").forward(req, res);
				return;// 程式中斷
			}

			if ((inputEmail.trim()).length() == 0 || (inputPwd.trim()).length() == 0) {
				errorMsgs.add("帳號或密碼不可為空，請重新登入。");

			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/MemberLogin.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 尋找資料庫

			MemberVO mVo = mService.findByMbrEmail(inputEmail);
			// 未註冊
			if (mVo == null) {
				session.setAttribute("noRegister", "尚未註冊，請註冊後再登入。");
				session.setAttribute("mbrEmail", inputEmail);
				res.sendRedirect(req.getContextPath() + "/member/MemberRegister.jsp");
				return;// 程式中斷
			}

			if (!(inputEmail.trim()).matches(emailRegex) || !(inputPwd.trim()).matches(pwdRegex)) {
				errorMsgs.add("帳號或密碼錯誤，請重新登入。");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/MemberLogin.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 登入失敗
			String password = mVo.getMbrPwd();
			if (!BCrypt.checkpw(inputPwd, password)) {
				errorMsgs.add("密碼錯誤，請重新登入。");
				req.getRequestDispatcher("/member/MemberLogin.jsp").forward(req, res);
				return;// 程式中斷
			} else {
				session.setAttribute("memberVo", mVo);
				res.sendRedirect(req.getContextPath() + "/member/MemberHome.jsp");
				return;// 程式中斷
			}

		}
		// 註冊功能
		if ("register".equals(action)) {
			// 取得資料
			String mbrEmail = req.getParameter("mbrEmail");
			String mbrPwd = req.getParameter("mbrPwd");
			String mbrPwd2 = req.getParameter("mbrPwd2");
			String mbrName = req.getParameter("mbrName");
			String mbrPhone = req.getParameter("mbrPhone");
			String sellIntro = req.getParameter("sellIntro");

			// 設定返回值
			req.setAttribute("mbrEmail", mbrEmail);
			req.setAttribute("mbrName", mbrName);
			req.setAttribute("mbrPhone", mbrPhone);
			req.setAttribute("sellIntro", sellIntro);

			// 驗證資料
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			// 驗證Email
			if ((mbrEmail.trim()).length() == 0 || mbrEmail == null) {
				errorMsgs.add("請輸入Email");
			} else {
				if (!(mbrEmail.trim()).matches(emailRegex)) {
					errorMsgs.add("Email格式不正確");
				}
				if (mService.findByMbrEmail((mbrEmail.trim())) != null) {
					errorMsgs.add("Email已註冊");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/MemberRegister.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證密碼
			if ((mbrPwd.trim()).length() == 0 || (mbrPwd2.trim()).length() == 0 || mbrPwd == null || mbrPwd2 == null) {
				errorMsgs.add("請輸入密碼");
			} else {
				if (!(mbrPwd.trim()).matches(pwdRegex)) {
					errorMsgs.add("密碼格式不正確");
				}
				if (!(mbrPwd.trim()).equals(mbrPwd2)) {
					errorMsgs.add("二次密碼不一致");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/MemberRegister.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證姓名
			if ((mbrName.trim()).length() == 0 || mbrName == null) {
				errorMsgs.add("請輸入姓名");
			} else {
				if (!(mbrName.trim()).matches(nameRegex)) {
					errorMsgs.add("姓名格式不正確");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/register.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證手機
			if ((mbrPhone.trim()).length() == 0) {
				errorMsgs.add("請輸入手機號碼");
			} else {
				if (!(mbrPhone.trim()).matches(phoneRegex)) {
					errorMsgs.add("手機號碼格式不正確");
				}
				if (mService.findByMbrPhone(mbrPhone.trim()) != null) {
					errorMsgs.add("手機號碼已註冊");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/register.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 設置MemberVo
			MemberVO mVo = new MemberVO();
			mVo.setMbrEmail(mbrEmail.trim());
			mVo.setMbrName(mbrName.trim());
			mVo.setMbrPwd(mbrPwd.trim());
			mVo.setMbrPhone(mbrPhone.trim());

			if ((sellIntro.trim()).length() == 0 || sellIntro == null) {
				sellIntro = null;
				mVo.setSellerIntro(sellIntro);
			} else {
				mVo.setSellerIntro(sellIntro.trim());
			}

			// 寫入資料庫
			String mbrNo = mService.addMem(mVo);

			// 轉發
			if (!mbrNo.equals("fail")) {
				HttpSession session = req.getSession();
				session.setAttribute("memberNo", mbrNo);
				res.sendRedirect(req.getContextPath() + "/member/MemberEmailVerify.jsp");
				return;
			} else {
				errorMsgs.add("註冊失敗，請稍後再試。");
				req.getRequestDispatcher("/member/MemberRegister.jsp").forward(req, res);
				return;
			}

		}

//		if (action.equals("updateInfo")) {
//			// 把資料存入request後轉發
//			String mbrEmail = req.getParameter("mbrEmail");
//			MemberVO mVo = mService.findByMbrEmail(mbrEmail);
//			req.setAttribute("mbrVo", mVo);
//			req.getRequestDispatcher("/member/mbrInfoUpdate.jsp").forward(req, res);
//			return;
//		}

		// 更新資料功能
		if (action.equals("updateInfo")) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			// 取出編號
			HttpSession session = req.getSession();
			MemberVO mVo = (MemberVO) session.getAttribute("memberVo");
			String mbrNo = mVo.getMbrNo();
			String mbrPhoneOld = mVo.getMbrPhone();

			// 取資料

//			String mbrEmail = req.getParameter("mbrEmail");
			String mbrName = req.getParameter("mbrName");
			String mbrPhone = req.getParameter("mbrPhone");

			// 驗證資料
			// 驗證名字
			if ((mbrName.trim()).length() == 0 || mbrName == null) {
				errorMsgs.add("請輸入姓名");
			} else {
				if (!(mbrName.trim()).matches(nameRegex)) {
					errorMsgs.add("姓名格式不正確");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/MemberUpdateInfo.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 驗證手機
			if ((mbrPhone.trim()).length() == 0 || mbrPhone == null) {
				errorMsgs.add("請輸入手機號碼");
			} else {
				if (!(mbrPhone.trim()).matches(phoneRegex)) {
					errorMsgs.add("手機號碼格式不正確");

				}
				if (!mbrPhoneOld.equals((mbrPhone.trim()))) {
					if (mService.findByMbrPhone(mbrPhone) != null) {
						errorMsgs.add("手機號碼已註冊");
					}
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/MemberUpdateInfo.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 設置memberVo
			mVo.setMbrName(mbrName.trim());
			mVo.setMbrPhone(mbrPhone.trim());

			// 與資料庫溝通
			mService.updateMen(mVo);
			session.setAttribute("memberVo", mVo);
			res.sendRedirect(req.getContextPath() + "/member/MemberHome.jsp");
			return;

		}
		// 信箱驗證功能
		if ("emailVerify".equals(action)) {

			// 取得資料
			String memberNo = req.getParameter("memberNo");
			String emailVerifyCode = req.getParameter("emailVerifyCode");
			// 取得redis資料
			Jedis jedis = pool.getResource();
			String tempAuth = jedis.get("MailVerify:" + memberNo);
			jedis.close();

			// 返回
			if (tempAuth == null) {
				System.out.println("連結信已逾時，請重新申請");
				req.setAttribute("errorMsg", "連結信已逾時，請重新申請。");
				req.getRequestDispatcher("/member/MemberEmailVerify.jsp").forward(req, res);
				return;
			} else if (emailVerifyCode.equals(tempAuth)) {
				System.out.println("驗證成功!");
				MemberVO mVo = mService.findByMbrNo(memberNo);
				// 更新資料庫
				mVo.setEmailStat(true);
				String upResult = mService.updateMen(mVo);
				if ("更新成功".equals(upResult)) {
					HttpSession session = req.getSession();
					session.removeAttribute("memberNo");
					session.setAttribute("registerSuccess", "驗證成功，請登入。");
					res.sendRedirect(req.getContextPath() + "/member/MemberLogin.jsp");
					return;
				} else {
					req.setAttribute("errorMsg", "系統錯誤，請稍後再試。");
					req.getRequestDispatcher("/member/MemberEmailVerify.jsp").forward(req, res);
					return;
				}

			} else {
				System.out.println("驗證有誤，請重新申請");
				req.setAttribute("errorMsg", "驗證有誤，請重新申請。");
				req.getRequestDispatcher("/member/MemberEmailVerify.jsp").forward(req, res);
				return;
			}

		}

		// 忘記密碼
		if ("forgetPwd".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			// 取參數
			String mbrEmail = req.getParameter("mbrEmail");

			// 驗證Email
			if (mbrEmail == null || (mbrEmail.trim()).length() == 0) {
				errorMsgs.add("請輸入Email");
			} else {
				if (!(mbrEmail.trim()).matches(emailRegex)) {
					errorMsgs.add("Email格式不正確");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/MemberForgetPwd.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 尋找資料庫
			MemberVO memberVO = mService.findByMbrEmail(mbrEmail.trim());
			if (memberVO == null) {
				errorMsgs.add("Email尚未註冊");
				req.getRequestDispatcher("/member/MemberForgetPwd.jsp").forward(req, res);
				return;// 程式中斷
			} else {
				// 設定郵件細節
				int minute = 30;
				String newPwd = getTempPwd();
				String memberName = memberVO.getMbrName();
				String memberNo = memberVO.getMbrNo();
				String memberEmail = memberVO.getMbrEmail();
				// 新密碼郵件

				String title = "ASAP忘記密碼信";
				String content = "您的暫時性密碼為  " + newPwd + "  ,請於 " + minute + " 分鐘內輸入，謝謝。";
				MailFormat mailFormat = new MailFormat(memberName, content);
				InputStream in = getServletContext().getResourceAsStream("/newImg/mailLogo.png");
				DataSource dataSource = new ByteArrayDataSource(in, "application/png");
				// 存入redis
				Jedis jedis = pool.getResource();
				jedis.set("TemporaryPwd:" + memberNo, newPwd);
				jedis.expire("TemporaryPwd:" + memberNo, minute * 60);
				// 關閉redis
				jedis.close();
				// 寄出信件
				JavaMail mail = new JavaMail(memberEmail, title, mailFormat.getMessageTextAndImg(), dataSource);
				String result = mail.sendMail();
				HttpSession session = req.getSession();
				session.setAttribute("memberNo", memberNo);
				res.sendRedirect(req.getContextPath() + "/member/MemberResetPwd.jsp");
				return;

			}

		}

		// 重設密碼
		if ("resetPwd".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			// 取參數
			String memberNo = req.getParameter("memberNo");
			String mbrTempPwd = req.getParameter("mbrTempPwd");
			String mbrPwd = req.getParameter("mbrPwd");
			String mbrPwd2 = req.getParameter("mbrPwd2");
			// 確認資料
			if (mbrPwd == null || mbrPwd2 == null || (mbrPwd.trim()).length() == 0 || (mbrPwd2.trim()).length() == 0) {
				errorMsgs.add("請輸入密碼");
			} else {
				if (!(mbrPwd.trim()).matches(pwdRegex)) {
					errorMsgs.add("密碼格式不正確");
				}
				if (!(mbrPwd.trim()).equals(mbrPwd2.trim())) {
					errorMsgs.add("二次密碼不一致");
				}
			}

			if (mbrTempPwd == null || (mbrTempPwd.trim()).length() == 0) {
				errorMsgs.add("請輸入暫時性密碼");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/MemberResetPwd.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 取得redis資料
			Jedis jedis = pool.getResource();
			String tempAuth = jedis.get("TemporaryPwd:" + memberNo);
			jedis.close();
			// 驗證
			if (tempAuth == null) {

				errorMsgs.add("連結信已逾時，請重新申請");
				req.getRequestDispatcher("/member/MemberForgetPwd.jsp").forward(req, res);
				return;
			} else if (mbrTempPwd.trim().equals(tempAuth)) {
				System.out.println("驗證成功!");
				MemberVO mVo = mService.findByMbrNo(memberNo);
				// 更新資料庫
				mVo.setMbrPwd(mbrPwd.trim());
				String upResult = mService.updatePwd(mVo);
				if ("更新成功".equals(upResult)) {
					HttpSession session = req.getSession();
					session.setAttribute("registerSuccess", "密碼更改成功，請登入。");
					res.sendRedirect(req.getContextPath() + "/member/MemberLogin.jsp");
					return;
				} else {
					errorMsgs.add("系統錯誤，請稍後再試");
					req.getRequestDispatcher("/member/MemberResetPwd.jsp").forward(req, res);
					return;
				}

			} else {
//				System.out.println("驗證有誤，請重新申請");
				errorMsgs.add("驗證有誤，請重新申請");
				req.getRequestDispatcher("/member/MemberForgetPwd.jsp").forward(req, res);
				return;
			}

		}
	}

}
