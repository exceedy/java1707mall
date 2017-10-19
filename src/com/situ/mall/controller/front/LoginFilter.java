package com.situ.mall.controller.front;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.situ.mall.pojo.User;

public class LoginFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String uri  = req.getRequestURI();
		String requestPath = uri.substring(uri.lastIndexOf('/') + 1, uri.length());
		if (requestPath.equals("toShop.shtml")) {
			HttpSession session = req.getSession(false);
			User user = (User) session.getAttribute("user");
			if (user == null || session == null) {
				resp.sendRedirect(req.getContextPath() + "login/toLogin.shtml");
			}
			doFilter(request, response, chain);
		} else {
			doFilter(request, response, chain);
		}
		
	}

	public void destroy() {
		
	}

	

}
