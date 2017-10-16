package com.situ.mall.controller.back;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.service.IOrderService;

@Controller
@RequestMapping(value="orderBack")
public class OrderController {
		
	@Autowired
	private IOrderService orderService;
	
	@RequestMapping(value="toOrder")
	public String toOrder(Model model) {
		List<Order> orderList = orderService.findAll();
		model.addAttribute("orderList", orderList);
		return "order";
	}
	
	@RequestMapping(value="toOrderItem")
	public String toOrderItem(BigInteger orderNo, Model model) {
		List<OrderItem> orderItems = orderService.findOrderItem(orderNo.intValue());
		model.addAttribute("orderItems", orderItems);
		return "order_items";
	}
}
