package com.situ.mall.dao;

import java.math.BigDecimal;
import java.util.List;

import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;

public interface OrderDao {
	
	int addOrderItem(OrderItem orderItem);

	 int addOrder(Order order);
	
	 List<Order> findOrder(Integer userId);
	
	List<OrderItem> findOrderItem(BigDecimal OrderNo);

	List<Order> findAll();
}
