package com.situ.mall.filter;

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
		
		String uri = req.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/") + 1, uri.length());
		System.out.println(path);
		if ("toLogin.action".equals(path) || "login.action".equals(path) 
				|| "login.jsp".equals(path) || "checkImg".equals(path)) {
			chain.doFilter(request, response);
			return;
		}
		//前端登录拦截
		if (uri != null && uri.startsWith("/Java1707Mall/order")) {
			HttpSession session = req.getSession(false);
			String returnUrl = req.getServletPath();
			if (session != null) {
				User user = (User) session.getAttribute("user");
				if (user == null) {
					session.setAttribute("returnUrl", returnUrl);
					resp.sendRedirect(req.getContextPath() + "/login/toLogin.shtml");
					return;
				} else {
					chain.doFilter(request, response);
				}
			} else {
				chain.doFilter(request, response);
			}
			//后台登录拦截
		} else if (uri != null && uri.endsWith(".action")) {
			HttpSession session = req.getSession(false);
			if (session != null) {
				User user = (User) session.getAttribute("user");
				if (user == null) {
					resp.sendRedirect(req.getContextPath() + "/loginBack/toLogin.action");
				} else {
					chain.doFilter(request, response);
				}
			} else {
				chain.doFilter(request, response);
			}
		} else {
			chain.doFilter(request, response);
		}
		 
	}

	public void destroy() {
		
	}

}
