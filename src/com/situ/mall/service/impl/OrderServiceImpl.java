package com.situ.mall.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.common.ServletRespone;
import com.situ.mall.dao.OrderDao;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService{

	@Autowired
	private OrderDao orderDao;
	
	public boolean addOrderItem(OrderItem orderItem) {
		int result = orderDao.addOrderItem(orderItem);
		return false;
	}

	public boolean addOrder(Order order) {
		int result  = orderDao.addOrder(order);
		return false;
	}

	public List<Order> findOrder(Integer userId) {
		return orderDao.findOrder(userId);
	}

	public List<OrderItem> findOrderItem(Long OrderNo) {
		return orderDao.findOrderItem(OrderNo);
	}

	public List<Order> findAll() {
		return orderDao.findAll();
	}

	public ServletRespone deleteOrder(Long orderNo) {
		int result = orderDao.deleteOrder(orderNo);
				orderDao.deleteOrderItems(orderNo);
				if (result > 0) {
					return ServletRespone.creatSuccess("删除成功");
				} else {
					return ServletRespone.creatError("删除失败");
				}
	}

}
