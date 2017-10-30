package com.situ.mall.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.common.ServletRespone;
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
	public ServletRespone addUser(User user) {
		int result = loginDao.addUser(user);
		if (result > 0) {
			return ServletRespone.creatSuccess("注册成功");
		}
		return ServletRespone.creatError("注册失败");
	}
	
	public ServletRespone isUser(HttpServletRequest req,User user) {
		User resultUser = loginDao.getUser(user);
		if (null != user && null != resultUser) {
			if (user.getUserName().equals(resultUser.getUserName()) && user.getPassword().equals(resultUser.getPassword())) {
				if (resultUser.getRole() == 0) {
					HttpSession session = req.getSession();
					session.setAttribute("user", resultUser);
					return ServletRespone.creatSuccess("登录成功");
				} else {
					return ServletRespone.creatError("权限不足");
				}
			} else if (user.getUserName().equals(resultUser.getUserName()) && !user.getPassword().equals(resultUser.getPassword())) {
				return ServletRespone.creatError("密码错误");
			} else {
				return ServletRespone.creatError("没有该用户，请注册");
			}
		} else {
			return ServletRespone.creatError("没有该用户，请注册");
	}

}
}
