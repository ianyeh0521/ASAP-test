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

import com.asap.member.entity.MemberVO;
import com.asap.member.service.MemberService;
import com.asap.member.service.MemberService_interface;
import com.google.api.services.oauth2.model.Userinfo;

@WebServlet("/profile")
public class Profile extends HttpServlet {
	private MemberService_interface memberSvc;

	@Override
	public void init() throws ServletException {
		memberSvc = new MemberService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");

		// 錯誤訊息
		List<String> errorMsgs = new LinkedList<>();
		req.setAttribute("errorMsgs", errorMsgs);

		// 取得登入信息
		HttpSession session = req.getSession();
		Object userinfo = session.getAttribute("userinfo");

		if (userinfo != null) {

			Userinfo profile = (Userinfo) userinfo;
			String mbrEmail = profile.getEmail();
			String mbrName = profile.getName();
			// 尋找資料庫
			MemberVO mVo = memberSvc.findByMbrEmail(mbrEmail);

			// 第一次登入
			if (mVo == null) {
				MemberVO member = new MemberVO();
				member.setMbrEmail(mbrEmail);
				if (mbrName != null) {
					member.setMbrName(mbrName);
				} else {
					member.setMbrName("Member");
				}

				String mbrNo = memberSvc.addMemByGoogle(member);
				
				//新增成功
				if (!"fail".equals(mbrNo)) {
					MemberVO memberVo = memberSvc.findByMbrEmail(mbrEmail);
					session.setAttribute("memberVo", memberVo);
					res.sendRedirect(req.getContextPath() + "/member/MemberHome.jsp");
					return;// 程式中斷
				} else {
					errorMsgs.add("發生錯誤，請重新登入。");
					req.getRequestDispatcher("/member/MemberLogin.jsp").forward(req, res);
					return;// 程式中斷
				}

			} else {
				// 登入過

				session.setAttribute("memberVo", mVo);
				res.sendRedirect(req.getContextPath() + "/member/MemberHome.jsp");
				return;// 程式中斷
			}

		}

	}

}
