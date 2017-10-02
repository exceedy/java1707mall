package com.situ.mall.service;

import com.situ.mall.pojo.User;

public interface ILoginService {

	User getUser(User user);

	boolean addUser(User user);

}
