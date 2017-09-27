package com.situ.mall.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Category;
import com.situ.mall.service.ICategoryService;

@Controller
@RequestMapping(value="category")
public class CategoryController {

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd"), true));
    }

	@Autowired
	private ICategoryService categoryService;

	@RequestMapping(value="findAllCategory" )
	public String findAllCategory(Model model) {
		List<Category> listParentCategory = categoryService.findParentCategory();
		List<Category> listCategory = categoryService.findAll();
		model.addAttribute("listParentCategory", listParentCategory);
		model.addAttribute("listCategory",listCategory);
		return "category_show";
	}
}
