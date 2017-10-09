package com.situ.mall.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.service.ICategoryService;

@Controller
@RequestMapping(value="category")
public class CategoryController {

	@Autowired
	private ICategoryService categoryService;
	
	public String toFindAllCategory() {
		return "";
	}
}
