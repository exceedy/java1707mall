package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.common.ServletRespone;
import com.situ.mall.dao.ShippingDao;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.service.IShippingService;

@Service
public class ShippingServiceImpl implements IShippingService {

	@Autowired
	private ShippingDao shippingDao;
	public List<Shipping> findById(Integer userId) {
		return shippingDao.findByUserId(userId);
	}
	public ServletRespone addShipping(Shipping shipping) {
		int result = shippingDao.addShipping(shipping);
		try {
			if (result > 0) {
				return  ServletRespone.creatSuccess("添加地址成功");
			} else {
				return ServletRespone.creatError("添加地址失败");
			}
		} catch (Exception e) {
			return ServletRespone.creatError("添加地址失败");
		}
	}
	public ServletRespone deleteShipping(Integer shippingId) {
		int result = shippingDao.deleteShipping(shippingId);
		if (result > 0) {
			return ServletRespone.creatSuccess("删除成功");
		}
		return ServletRespone.creatError("删除失败");
	}

}
