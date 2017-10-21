package com.situ.mall.dao;

import java.util.List;

import com.situ.mall.pojo.Shipping;

public interface ShippingDao {
	List<Shipping> findByUserId(Integer userId);

	int addShipping(Shipping shipping);

	int deleteShipping(Integer shippingId);
}
