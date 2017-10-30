package com.situ.mall.service;

import javax.servlet.http.HttpServletRequest;

import com.situ.mall.common.ServletRespone;
import com.situ.mall.pojo.User;

public interface ILoginService {

	User getUser(User user);

	ServletRespone addUser(User user);

	ServletRespone isUser(HttpServletRequest req,User user);

}
