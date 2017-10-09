package com.situ.mall.controller.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.User;
import com.situ.mall.service.ILoginService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Resource(name="loginService")
	private ILoginService loginService;
	
	@RequestMapping(value="/toLogin.shtml")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping(value="/loginIndex.shtml")
	public String login(Model model, HttpServletRequest req, User user) {
		String path = null;
		User resultUser = loginService.getUser(user);
		if (user != null && resultUser != null) {
			if (user.getUserName().equals(resultUser.getUserName() ) && user.getPassword().equals(resultUser.getPassword())) {
				HttpSession session = req.getSession();
				session.setAttribute("user", user);
				
				path =  "redirect:/index.shtml";
			} else {
				path = "register";
			}
		} else {
			path = "register";
		}
		return path;
	}
	
	@RequestMapping(value="toRegister.shtml")
	public String toRegister() {
		return "register";
	}
	
	@RequestMapping(value="register.shtml")
	public String register(User user) {
		boolean result = loginService.addUser(user);
		return "redirect:/login/toLogin.shtml";
	}
}
