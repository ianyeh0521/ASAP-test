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

public class MemberLoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		// session有值
		HttpSession session = req.getSession();
		Object memberVo = session.getAttribute("memberVo");

		// 開放路徑
		String[] openPath = { "/court/court.do", "/court/courtClosedTimeAjax.do", "/court/courtClosedTime.do",
				"/court/courtImgAjax.do", "/court/courtMap.do", "/court/courtOrderListAjax.do",
				"/court/courtOrderServlet.do", "/court/courtRecView.do", "/court/courtSaveList.do",
				"/court/courtSaveListAjax.do", "/court/courtAjax.do", "/court/ecPayReturn.do", "/course/course.do",
				"/course/courseEcPayReturn.do", "/course/DBGifReader", "/course/mbrCourseServlet",
				"/forum/forumcomment.do", "/forum/forumlike.do", "/forum/forumreport.do", "/forum/post.do",
				"/forum/savepost.do" };
		String path = req.getServletPath();

		if (memberVo != null) {
			// 有登入
			chain.doFilter(req, res);
			return;
		}

		for (String open : openPath) {
			if (path.equals(open)) {
				chain.doFilter(request, response);
				return;
			}
		}

		res.sendRedirect(req.getContextPath() + "/member/MemberLogin.jsp");
		return;

	}

}
