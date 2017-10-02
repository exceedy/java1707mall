package com.situ.mall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.LoginDao;
import com.situ.mall.pojo.User;
import com.situ.mall.service.ILoginService;

@Service(value="loginService")
public class LoginServiceImpl implements ILoginService {

	@Autowired
	public LoginDao loginDao;
	public User getUser(User user) {
		return loginDao.getUser(user);
	}
	public boolean addUser(User user) {
		int result = loginDao.addUser(user);
		return false;
	}

}
