package com.situ.mall.controller.back;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.ServletRespone;
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
	@ResponseBody
	public ServletRespone toOrderItem() {
		
		return ServletRespone.creatSuccess();
	}
	@RequestMapping(value="orderItem")
	public String toOrderItem(Long orderNo, Model model) {
		List<OrderItem> orderItems = orderService.findOrderItem(orderNo);
		model.addAttribute("orderItems", orderItems);
		model.addAttribute("orderNo", orderNo);
		return "order_items";
	}
	
}
