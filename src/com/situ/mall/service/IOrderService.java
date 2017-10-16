package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;

public interface IOrderService {

	boolean addOrderItem(OrderItem orderItem);

	boolean addOrder(Order order);
	
	List<Order> findOrder(Integer userId);
	
	List<OrderItem> findOrderItem(Integer OrderNo);

	List<Order> findAll();
}
