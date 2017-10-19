package com.situ.mall.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping(value="category")
public class CategoryController {
	
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IProductService productService;
	
	@RequestMapping(value="tofindAllProduct.shtml")
	public String toFindAllCategory(Integer sunCategoryId,Model model,Integer pageIndex,Integer pageSize) {
		//List<Product> productList = productService.getCategoryProduct(sunCategoryId);

		int index = 1;
		if (pageIndex != null && pageIndex != 0) {
			index = pageIndex;
		}
		int size = 3;
		if (pageSize != null && pageSize != 0) {
			size  = pageSize;
		}
		PageBean<Product> pageBean = productService.getPageBean(index,sunCategoryId, size);
		List<Category> parentCategoryList = categoryService.findParentCategory();
		List<Category> sunCategoryList = categoryService.findAll();
		model.addAttribute("parentCategoryList", parentCategoryList);
		model.addAttribute("sunCategoryList", sunCategoryList);
		model.addAttribute("pageBean", pageBean);
		//model.addAttribute("productList", productList);
		return "category_list";
	}
	
	@RequestMapping(value="toProduct.shtml")
	public String toProduct(Integer id, Model model) {
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		return "details";
	} 
	
}
