package com.asap.member.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.Renderer;

import org.mindrot.jbcrypt.BCrypt;

import com.asap.member.entity.MemberVO;
import com.asap.member.service.MemberService;
import com.mysql.cj.Session;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
	}

	private String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
	private String pwdRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$";
	private String phoneRegex = "09[0-9]{8}";
	//引入service
	private MemberService mService = new MemberService();

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//		System.out.println(action);
		res.setContentType("text/html; charset=UTF-8");

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

			if ((inputVerCode.trim()).length() == 0) {
				errorMsgs.add("請輸入驗證碼。");

			}
			if (!errorMsgs.isEmpty()) {

				req.getRequestDispatcher("/member/login.jsp").forward(req, res);
				return;// 程式中斷
			}

			if (!verificationCode.equals(inputVerCode.trim())) {

				errorMsgs.add("驗證碼錯誤，請重新登入。");
			}

			if (!errorMsgs.isEmpty()) {

				req.getRequestDispatcher("/member/login.jsp").forward(req, res);
				return;// 程式中斷
			}

			if ((inputEmail.trim()).length() == 0 || (inputPwd.trim()).length() == 0) {
				errorMsgs.add("帳號或密碼不可為空，請重新登入。");

			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/login.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 尋找資料庫

			MemberVO mVo = mService.findByMbrEmail(inputEmail);
			// 未註冊
			if (mVo == null) {
				session.setAttribute("noRegister", "尚未註冊，請註冊後再登入。");
				session.setAttribute("mbrEmail", inputEmail);
				res.sendRedirect(req.getContextPath() + "/member/register.jsp");
				return;// 程式中斷
			}

			if (!(inputEmail.trim()).matches(emailRegex) || !(inputPwd.trim()).matches(pwdRegex)) {
				errorMsgs.add("帳號或密碼錯誤，請重新登入。");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/login.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 登入失敗
			String password = mVo.getMbrPwd();
			if (!BCrypt.checkpw(inputPwd, password)) {
				errorMsgs.add("密碼錯誤，請重新登入。");
				req.getRequestDispatcher("/member/login.jsp").forward(req, res);
				return;// 程式中斷
			} else {

				session.setAttribute("mbrVo", mVo);
				res.sendRedirect(req.getContextPath() + "/member/home.jsp");
				return;// 程式中斷
			}

		}

		if ("register".equals(action)) {
			// 確認資料
			String mbrEmail = req.getParameter("mbrEmail");
			String mbrPwd = req.getParameter("mbrPwd");
			String mbrPwd2 = req.getParameter("mbrPwd2");
			String mbrName = req.getParameter("mbrName");
			String mbrPhone = req.getParameter("mbrPhone");
			String bankNo = req.getParameter("bankNo");
			String bankBr = req.getParameter("bankBr");
			String bankAcct = req.getParameter("bankAcct");
			String sellIntro = req.getParameter("sellIntro");

			// 設定返回值
			req.setAttribute("mbrEmail", mbrEmail);
			req.setAttribute("mbrName", mbrName);
			req.setAttribute("mbrPhone", mbrPhone);
			req.setAttribute("bankBr", bankBr);
			req.setAttribute("bankAcct", bankAcct);
			req.setAttribute("sellIntro", sellIntro);

			MemberVO mVo = new MemberVO();

			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			if ((mbrEmail.trim()).length() == 0) {
				errorMsgs.add("請輸入Email");
			}

			if (!(mbrEmail.trim()).matches(emailRegex)) {
				errorMsgs.add("Email格式不正確");
			}

			if (mService.findByMbrEmail((mbrEmail.trim())) != null) {
				errorMsgs.add("Email已註冊");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/register.jsp").forward(req, res);
				return;// 程式中斷
			}

			if ((mbrPwd.trim()).length() == 0) {
				errorMsgs.add("請輸入密碼");
			}

			if (!(mbrPwd.trim()).matches(pwdRegex)) {
				errorMsgs.add("密碼格式不正確");
			}

			if (!(mbrPwd.trim()).equals(mbrPwd2)) {
				errorMsgs.add("二次密碼不一致");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/register.jsp").forward(req, res);
				return;// 程式中斷
			}

			if ((mbrName.trim()).length() == 0) {
				errorMsgs.add("請輸入姓名");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/register.jsp").forward(req, res);
				return;// 程式中斷
			}

			if ((mbrPhone.trim()).length() == 0) {
				errorMsgs.add("請輸入手機號碼");
			}
			if (!(mbrPhone.trim()).matches(phoneRegex)) {
				errorMsgs.add("手機號碼格式不正確");

			}

			if (mService.findByMbrPhone(mbrPhone.trim()) != null) {
				errorMsgs.add("手機號碼已註冊");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/register.jsp").forward(req, res);
				return;// 程式中斷
			}

			mVo.setMbrEmail(mbrEmail.trim());
			mVo.setMbrName(mbrName.trim());
			mVo.setMbrPwd(mbrPwd.trim());
			mVo.setMbrPhone(mbrPhone.trim());

			if (bankNo.equals("請選擇")) {
				bankNo = null;
				mVo.setBankNo(bankNo);
			} else {
				mVo.setBankNo(bankNo.trim());
			}

			if ((bankBr.trim()).length() == 0) {
				bankBr = null;
				mVo.setBankBr(bankBr);
			} else {
				mVo.setBankBr(bankBr.trim());
			}

			if ((bankAcct.trim()).length() == 0) {
				bankAcct = null;
				mVo.setBankAcct(bankAcct);
			} else {
				mVo.setBankAcct(bankAcct.trim());
			}

			if ((sellIntro.trim()).length() == 0) {
				sellIntro = null;
				mVo.setSellerIntro(sellIntro);
			} else {
				mVo.setSellerIntro(sellIntro.trim());
			}

			// 寫入資料庫
			String mbrNo = mService.addMem(mVo);
			if (!mbrNo.equals("fail")) {
				HttpSession session = req.getSession();
				session.setAttribute("registerSuccess", "註冊成功，請登入。");
				session.setAttribute("mbrMail", mbrEmail);
				res.sendRedirect(req.getContextPath() + "/member/login.jsp");
				return;
			} else {
				errorMsgs.add("註冊失敗，請稍後再試。");
				req.getRequestDispatcher("/member/register.jsp").forward(req, res);
				return;
			}

		}

		if (action.equals("updateInfo")) {
			// 把資料存入request後轉發
			String mbrEmail = req.getParameter("mbrEmail");
			MemberVO mVo = mService.findByMbrEmail(mbrEmail);
			req.setAttribute("mbrVo", mVo);
			req.getRequestDispatcher("/member/mbrInfoUpdate.jsp").forward(req, res);
			return;
		}

		if (action.equals("saveUpdatedInfo")) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			// 檢查資料

			String mbrEmail = req.getParameter("mbrEmail");
			String mbrName = req.getParameter("mbrName");
			String mbrPhone = req.getParameter("mbrPhone");
			String bankNo = req.getParameter("bankNo");
			String bankBr = req.getParameter("bankBr");
			String bankAcct = req.getParameter("bankAcct");
			String sellIntro = req.getParameter("sellIntro");

			// 設定返回值
			req.setAttribute("mbrName", mbrName);
			req.setAttribute("mbrPhone", mbrPhone);
			req.setAttribute("bankBr", bankBr);
			req.setAttribute("bankAcct", bankAcct);
			req.setAttribute("sellIntro", sellIntro);

			MemberVO mVo = mService.findByMbrEmail(mbrEmail);

			if ((mbrName.trim()).length() == 0) {
				errorMsgs.add("請輸入姓名");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/mbrInfoUpdate.jsp").forward(req, res);
				return;// 程式中斷
			}

			if ((mbrPhone.trim()).length() == 0) {
				errorMsgs.add("請輸入手機號碼");
			}
			if (!(mbrPhone.trim()).matches(phoneRegex)) {
				errorMsgs.add("手機號碼格式不正確");

			}

			if (!(mbrPhone.trim()).equals(mVo.getMbrPhone())) {
				if (mService.findByMbrPhone(mbrPhone) != null) {
					errorMsgs.add("手機號碼已註冊");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/member/mbrInfoUpdate.jsp").forward(req, res);
				return;// 程式中斷
			}

			mVo.setMbrName(mbrName.trim());
			mVo.setMbrPhone(mbrPhone.trim());

			if (bankNo.equals("請選擇")) {
				bankNo = null;
				mVo.setBankNo(bankNo);
			} else {
				mVo.setBankNo(bankNo);
			}

			if ((bankBr.trim()).length() == 0) {
				bankBr = null;
				mVo.setBankBr(bankBr);
			} else {
				mVo.setBankBr(bankBr.trim());
			}

			if ((bankAcct.trim()).length() == 0) {
				bankAcct = null;
				mVo.setBankAcct(bankAcct);
			} else {
				mVo.setBankAcct(bankAcct.trim());
			}

			if ((sellIntro.trim()).length() == 0) {
				sellIntro = null;
				mVo.setSellerIntro(sellIntro);
			} else {
				mVo.setSellerIntro(sellIntro.trim());
			}

			mService.updateMen(mVo);
			HttpSession session = req.getSession();
			session.removeAttribute("mbrVo");
			session.setAttribute("mbrVo", mVo);
			res.sendRedirect(req.getContextPath() + "/member/home.jsp");
			return;

		}
	}

}
