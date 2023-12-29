package com.asap.member.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.api.client.auth.oauth2.AuthorizationCodeFlow;
import com.google.api.client.auth.oauth2.AuthorizationCodeResponseUrl;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.servlet.auth.oauth2.AbstractAuthorizationCodeCallbackServlet;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.oauth2.Oauth2;
import com.google.api.services.oauth2.model.Userinfo;

@WebServlet("/login-callback")
public class LoginCallbackServlet extends AbstractAuthorizationCodeCallbackServlet {

	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
	private static final HttpTransport HTTP_TRANSPORT;

	static {
		try {
			HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
		} catch (GeneralSecurityException | IOException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	protected AuthorizationCodeFlow initializeFlow() throws ServletException, IOException {

		return GoogleCodeFlow.newFlow();

	}

	@Override
	protected String getRedirectUri(HttpServletRequest req) throws ServletException, IOException {
		GenericUrl url = new GenericUrl(req.getRequestURL().toString());
		url.setRawPath(req.getContextPath() + "/login-callback");
		return url.build();

	}

	@Override
	protected String getUserId(HttpServletRequest req) throws ServletException, IOException {

		return null;
	}

	@Override
	protected void onSuccess(HttpServletRequest req, HttpServletResponse res, Credential credential)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");

		try {
			Oauth2 oauth2 = new Oauth2.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential).setApplicationName("ASAP")
					.build();

			Userinfo userinfo = oauth2.userinfo().get().execute();

			HttpSession session = req.getSession();
			session.setAttribute("userinfo", userinfo);
			// 处理成功获取用户信息后的逻辑
			res.sendRedirect(req.getContextPath() + "/profile"); // 重定向到显示用户信息的页面
		} catch (Exception e) {
			// 处理异常
			// 錯誤訊息
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			errorMsgs.add("發生錯誤，請使用其他方式登入。");
			req.getRequestDispatcher("/member/MemberLogin.jsp").forward(req, res);
			return;// 程式中斷
		}
	}

	@Override
	protected void onError(HttpServletRequest req, HttpServletResponse res, AuthorizationCodeResponseUrl errorResponse)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");

		// 錯誤訊息
		List<String> errorMsgs = new LinkedList<>();
		req.setAttribute("errorMsgs", errorMsgs);
		errorMsgs.add("發生錯誤，請使用其他方式登入。");
		req.getRequestDispatcher("/member/MemberLogin.jsp").forward(req, res);
		return;// 程式中斷

	}
}