package com.situ.mall.service;

import java.util.List;

import com.situ.mall.common.ServletRespone;
import com.situ.mall.pojo.Shipping;

public interface IShippingService {

	List<Shipping> findById(Integer id);

	ServletRespone addShipping(Shipping shipping);

	
}
