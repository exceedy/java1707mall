package com.situ.mall.controller.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.ServletRespone;
import com.situ.mall.pojo.User;
import com.situ.mall.service.ILoginService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Resource(name="loginService")
	private ILoginService loginService;
	
	@RequestMapping(value="/toLogin.shtml")
	public String toLogin(String returnUrl,Model model) {
		model.addAttribute("returnUrl", returnUrl);
		return "login";
	}
	
	@RequestMapping(value="/loginIndex.shtml")
	public String login(Model model, HttpServletRequest req, User user,String returnUrl) {
		String path = null;
		User resultUser = loginService.getUser(user);
		System.out.println(returnUrl);
		if (user != null && resultUser != null) {
			if (user.getUserName().equals(resultUser.getUserName()) && user.getPassword().equals(resultUser.getPassword())) {
				HttpSession session = req.getSession();
				session.setAttribute("user", resultUser);
					path =  "redirect:"+returnUrl;
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
	@ResponseBody
	public ServletRespone register(User user) {
		return  loginService.addUser(user);
	}
	
	@RequestMapping(value="login.shtml")
	public String login() {
		return "layer_login";
	}
	
	@RequestMapping(value="layerLogin.shtml")
	@ResponseBody
	public ServletRespone layerLogin(User user, HttpServletRequest req) {
		User resultUser = loginService.getUser(user);
		if (user != null && resultUser != null) {
			if (user.getUserName().equals(resultUser.getUserName()) && user.getPassword().equals(resultUser.getPassword())) {
				HttpSession session = req.getSession();
				session.setAttribute("user", resultUser);
				return ServletRespone.creatSuccess("登录成功");
			}  else {
				return ServletRespone.creatError("登录失败");
			}
		} else {
			return ServletRespone.creatError("用户不存在");
		}
		 
	}
	@RequestMapping(value="out.shtml")
	@ResponseBody
	public ServletRespone out(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		System.out.println(session);
		if (session != null) {
			session.removeAttribute("user");
			System.out.println(session);
		}
		return ServletRespone.creatSuccess();
	}
}
