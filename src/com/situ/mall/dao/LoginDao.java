package com.situ.mall.dao;

import com.situ.mall.pojo.User;

public interface LoginDao {

	User getUser(User user);

	int addUser(User user);

}
