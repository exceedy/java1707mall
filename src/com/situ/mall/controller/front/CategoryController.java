package com.situ.mall.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Campaign;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.service.IProductService;

@Controller
@RequestMapping(value="category")
public class CategoryController {
	
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IProductService productService;
	
	@RequestMapping(value="tofindAllProduct.shtml")
	public String toFindAllCategory(Integer sunCategoryId,Model model) {
		List<Product> productList = productService.getCategoryProduct(sunCategoryId);
		List<Category> parentCategoryList = categoryService.findParentCategory();
		List<Category> sunCategoryList = categoryService.findAll();
		model.addAttribute("parentCategoryList", parentCategoryList);
		model.addAttribute("sunCategoryList", sunCategoryList);
		model.addAttribute("productList", productList);
		return "category_list";
	}
	
}
