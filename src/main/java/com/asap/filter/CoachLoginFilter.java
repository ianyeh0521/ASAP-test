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


public class CoachLoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
        
		//session有值
		HttpSession session = req.getSession();
		Object coachVo = session.getAttribute("coachVo");

		if (coachVo != null) {
			//有登入
			chain.doFilter(req, res);
			return;
		}else {
			res.sendRedirect(req.getContextPath()+"/coach/CoachLogin.jsp");
			return;
		}

	}

}
