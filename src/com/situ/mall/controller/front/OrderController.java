package com.situ.mall.controller.front;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.pojo.User;
import com.situ.mall.service.IOrderService;
import com.situ.mall.service.IProductService;
import com.situ.mall.service.IShippingService;
import com.situ.mall.vo.CartItemsVo;
import com.situ.mall.vo.CartVo;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	@Autowired
	private IShippingService shippingService;
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IOrderService orderService;
	
	
	@RequestMapping(value="/toAddOrder.shtml")
	public String toAddOrder(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		List<Shipping> shippingList = new ArrayList<Shipping>();
		if (session != null) {
			User user = (User) session.getAttribute("user");
			System.out.println(user);
			shippingList =  shippingService.findById(user.getId());
		}
		
		CartVo cart = null;
		
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("cart_items_list".equals(cookie.getName())) {
					String value = cookie.getValue();
					try {
						cart = objectMapper.readValue(value, CartVo.class);
						System.out.println(cart);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		if (null != cart) {
			List<CartItemsVo> cartItemsList = cart.getItemsList();
			for (CartItemsVo cartItems : cartItemsList) {
				Product product = productService.findById(cartItems.getProduct().getId());
				cartItems.setProduct(product);
			}
			cart.setItemsList(cartItemsList);
		}
		System.out.println(cart);
		model.addAttribute("cart", cart);
		model.addAttribute("shippingList", shippingList);
		return "order";
	}
	
	@RequestMapping(value="addOrder.shtml")
	public String addOrder(Model model, Integer shippingId, Integer paymentType, HttpServletRequest req, HttpServletResponse resp, BigDecimal currentUnitPrice) {
		Order order = new Order();
		
		order.setShippingId(shippingId);
		
		order.setPaymentType(paymentType);
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String dateStr = simpleDateFormat.format(date);
		BigDecimal orderNo = new BigDecimal(dateStr);
		
		order.setOrderNo(orderNo);
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user"); 
		order.setUserId(user.getId());
		
		Integer status = 10;
		order.setStatus(status);
		
		boolean result = orderService.addOrder(order);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		
		CartVo cart = null;
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("cart_items_list".equals(cookie.getName())) {
					String value = cookie.getValue();
					try {
						cart = objectMapper.readValue(value, CartVo.class);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		if (null != cart) {
			List<CartItemsVo> items = cart.getItemsList();
			for (CartItemsVo item : items) {
				OrderItem orderItem = new OrderItem();
				Integer productId = item.getProduct().getId();
				orderItem.setProductId(productId);//商品id
				
				Product productTemp = productService.findById(productId);
				
				String productName = productTemp.getName();
				orderItem.setProductName(productName);//商品姓名
				
				String productImage = productTemp.getMainImage();
				orderItem.setProductImage(productImage);//商品主图
				
				orderItem.setCurrentUnitPrice((double)currentUnitPrice.intValue());
				Integer totalPrice = currentUnitPrice.intValue() * item.getAmount();
				orderItem.setTotalPrice(totalPrice);//商品总价
				
				orderItem.setQuantity(item.getAmount());//商品数量
				
				orderItem.setUserId(user.getId());
				
				orderItem.setOrderNo(orderNo);
				
				boolean resultItem = orderService.addOrderItem(orderItem);
			}
		}
		
		
				//清除购物车
				Cookie cookie = new Cookie("cart_items_list",null);
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 7);
				
				resp.addCookie(cookie);
				
				
		return "redirect:/order/toOrederItems.shtml";
	}
	
	@RequestMapping(value="toOrederItems")
	public String orderItems(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession(false);
		User user = (User) session.getAttribute("user");
		Integer userId = user.getId();
				
		//将订单返回给前台展示
		List<Order> orderItems = orderService.findOrder(userId);
		model.addAttribute("orderItems", orderItems);
		for (Order order : orderItems) {
			System.out.println(order);
			List<OrderItem> list = order.getList();
			for (OrderItem orderItem : list) {
				System.out.println(orderItem);
			}
		}
		
		return "order_items";
	}
}
