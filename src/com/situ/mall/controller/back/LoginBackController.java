package com.situ.mall.controller.back;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.common.ServletRespone;
import com.situ.mall.service.ILoginService;

@Service
public class LoginBackController {
	
	@Autowired
	public ILoginService loginService;
	
	@RequestMapping(value="toLogin")
	public String toLogin() {
		return "login";
	}
	
	public ServletRespone login() {
		return null;
	}
}
