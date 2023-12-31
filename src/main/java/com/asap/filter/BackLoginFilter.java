package com.asap.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BackLoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 開放的頁面
		String[] openPaths = { "/backStage/BackageLogin.jsp", "/backStage/dataTable.css" };
		String path = req.getServletPath();

		// session有值
		HttpSession session = req.getSession();
		Object backVo = session.getAttribute("backVo");

		// 有登入
		if (backVo != null) {
			chain.doFilter(req, res);
			return;
		}

		for (String openPath : openPaths) {

			if (path.equals(openPath)) {
				// 開放頁
				chain.doFilter(req, res);
				return;
			}
		}

		res.sendRedirect(req.getContextPath() + "/backStage/BackageLogin.jsp");
		return;
	}

}
