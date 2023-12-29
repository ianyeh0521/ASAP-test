package com.asap.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.api.client.auth.oauth2.AuthorizationCodeFlow;
import com.google.api.client.extensions.servlet.auth.oauth2.AbstractAuthorizationCodeServlet;
import com.google.api.client.http.GenericUrl;

@WebServlet("/login")
public class LoginServlet extends AbstractAuthorizationCodeServlet {

	@Override
	protected String getUserId(HttpServletRequest req) throws ServletException, IOException {
		HttpSession httpSession = req.getSession();

		return httpSession.getId();
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
}
