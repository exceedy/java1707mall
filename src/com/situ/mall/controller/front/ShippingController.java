package com.situ.mall.controller.front;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.ServletRespone;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.pojo.User;
import com.situ.mall.service.IShippingService;

@Controller
@RequestMapping(value="shipping")
public class ShippingController {
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	
	@Autowired
	private IShippingService shippingService;
	
	@RequestMapping(value="toAddShipping")
	public String toAddShipping() {
		return "add_shipping";
	} 
	
	@RequestMapping(value="addShipping")
	@ResponseBody
	public ServletRespone addShipping(HttpServletRequest req,Shipping shipping) {
		HttpSession session = req.getSession(false);
		if (session != null) {
			User user = (User) session.getAttribute("user");
			System.out.println(user);
			shipping.setUserId(user.getId());
		}
		return shippingService.addShipping(shipping);
	}
}
