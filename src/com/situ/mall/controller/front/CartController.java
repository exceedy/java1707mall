package com.situ.mall.controller.front;

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.CartItemsVo;
import com.situ.mall.vo.CartVo;

@Controller
@RequestMapping(value="/cart")
public class CartController {
	
	@Autowired
	private IProductService productService;
	
	@RequestMapping(value="/addCartItems.shtml")
	public String addCartItems( HttpServletRequest req, HttpServletResponse resp,
			Model model, Integer productId, Integer amount) {
		
		ObjectMapper objectMapper = new ObjectMapper();
		//将对象转化为json时不接受null
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		
		CartVo cart = null;
		//取出所有的cookie
		Cookie[] cookies = req.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				//判断是否有购物车
				if ("cart_items_list".equals(cookie.getName())) {
					//取出cookie中的所有value值
					String value = cookie.getValue();
					try {
						
						cart = objectMapper.readValue(value, CartVo.class);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		//如果cookie里面没有购物车对象，就需要new Cart
		if (cart == null) {
			cart = new CartVo();
		}
		
		if (null != productId) {
			//先获取购物项中商品的详细信息
			Product productTemp = productService.findById(productId);
			//创建一个空的商品对象，用来储存有用信息
			Product product = new Product();
			//将需要存入cookie的值赋值给新的商品对象
			product.setId(productId);
			product.setStock(productTemp.getStock());
			
			CartItemsVo items = new CartItemsVo();
			//将商品和商品 数量存入到购物项
			items.setProduct(product);
			items.setAmount(amount);
			
			//将购物项添加到购物车，在购物车内进行添加判断
			cart.addItems(items);
			cart.setProductId(productId);
			
			//将对象转化为json序列
			StringWriter stringWriter = new StringWriter();
			try {
				objectMapper.writeValue(stringWriter, cart);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//将购物车存入到cookie中
			Cookie cookie = new Cookie("cart_items_list", stringWriter.toString());
			//设置cookie的最大寿命
			cookie.setMaxAge(60 * 60 *24 * 7 );
			//设置cookie的存入路径
			cookie.setPath("/");
			
			//将cookie返回到浏览器
			resp.addCookie(cookie);
		}
		
		//获取购物车里面的购物项
		List<CartItemsVo> items = cart.getItemsList();
		for (CartItemsVo item : items) {
			//获取购物项里面的商品详细信息
			Product product = productService.findById(item.getProduct().getId());
			//将商品存入到购物项内
			item.setProduct(product);
		}
		//将带有详细商品信息的购物项放入到购物车里
		cart.setItemsList(items);
		
		//将购物车返回给浏览器展示
		model.addAttribute("cart", cart);
		
		return "gwc";
	}
	
	@RequestMapping(value="/deleteCartItems.shtml")
	public String deleteCartItems(HttpServletRequest req,HttpServletResponse resp,
			Integer productId) {
		CartVo cart = null;
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		
		Cookie[] cookies  = req.getCookies();
		
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("cart_items_list".equals(cookie.getName())) {
					String value = cookie.getValue();
					try {
						cart = objectMapper.readValue(value,CartVo.class);
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					
					}
				}
			}
		if (null != cart) {
			cart.delteItems(productId);
			
			StringWriter stringWriter = new StringWriter();
			try {
				objectMapper.writeValue(stringWriter,cart);
			} catch (IOException e) {
				e.printStackTrace();
			}
			Cookie cookie = new Cookie("cart_items_list",stringWriter.toString());
			//为了覆盖原cookie所以要让路径和cookie存活时间一致
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 *24 * 7 );
			resp.addCookie(cookie);
			}
		return "redirect:/cart/addCartItems.shtml";
	}
	
	@RequestMapping(value="totalPrice.shtml")
	@ResponseBody
	private Map<String,Integer> totalPrice(Integer[] selectIds, HttpServletRequest req, HttpServletResponse resp) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		CartVo cart = null;
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		
		//获取所有的cookie
		Cookie[] cookies = req.getCookies();
		//初始化总价
		Integer totalPrice = 0;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				//找到购物车的cookie
				if ("cart_items_list".equals(cookie.getName())) {
					String value = cookie.getValue();
					try {
						//获取购物车对象
						cart = objectMapper.readValue(value, CartVo.class);
					} catch (IOException e) {
						e.printStackTrace();
					}
					if (null != selectIds) {
						//判断被选中的id和购物项id是否相等
						for (Integer id : selectIds) {
							for (CartItemsVo cartItems : cart.getItemsList()) {
								if (id == cartItems.getProduct().getId()) {
									//相等就计算该商品的数量与价格的总和
									Product productTemp = productService.findById(id);
									totalPrice += (cartItems.getAmount() * productTemp.getPrice().intValue());
							}
						}
					}
				}
			}
		}
			
		}
		
		//将计算好的总价放入map 
		map.put("totalPrive", totalPrice);
		return map;
	}
}
