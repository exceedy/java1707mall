package com.situ.mall.controller.back;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.ServletRespone;
import com.situ.mall.pojo.User;
import com.situ.mall.service.ILoginService;

@Service
@RequestMapping(value="loginBack")
public class LoginBackController {
	
	@Autowired
	public ILoginService loginService;
	
	@RequestMapping(value="toLogin")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping(value="login")
	@ResponseBody
	public ServletRespone login(HttpServletRequest req,String checkImg,User user) {
		HttpSession session = req.getSession(false);
		String checkImgSe  = (String) session.getAttribute("checkCodeSession");
		if (session != null) {
			if (checkImg != null && checkImgSe != null) {
				if (!checkImg.equals(checkImgSe)) {
					return ServletRespone.creatError("验证码错误");
				}
			}
		}
		return loginService.isUser(req, user);
	}
	@RequestMapping(value="isCheckImg")
	@ResponseBody
	public ServletRespone isCheckImg(HttpServletRequest req,String checkImg) {
		HttpSession session = req.getSession();
		String checkImgSe  = (String) session.getAttribute("checkCodeSession");
		if (checkImg != null && checkImgSe != null) {
			if (checkImg.equals(checkImgSe)) {
				return ServletRespone.creatSuccess("验证成功");
			} else {
				return ServletRespone.creatError("验证码输入错误");
			}
		} else {
			return ServletRespone.creatError("验证码不能为空");
		}
	}
	
	@RequestMapping(value="out")
	public String out (HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if (null != session) {
			session.removeAttribute("user");
		}
		return "login";
	}
	
	@RequestMapping(value="toRegister")
	public String toRegister() {
		return "register";
	}
	
	@RequestMapping(value="register")
	@ResponseBody
	public ServletRespone register (User user) {
		return loginService.addUser(user);
	}
}
