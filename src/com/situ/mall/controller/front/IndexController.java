package com.situ.mall.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Campaign;
import com.situ.mall.pojo.Category;
import com.situ.mall.service.ICampaignService;
import com.situ.mall.service.ICategoryService;

@Controller
public class IndexController {
	@Autowired
	private ICategoryService categoryService;	

	@Autowired
	private ICampaignService campaignService;
	
		@RequestMapping(value="index.shtml")
		 public String index(Model model) {
			List<Category> list = categoryService.findParentCategory();
			List<Category> sunCategoryList = categoryService.findAll();
			List<Campaign> campaignList = campaignService.findAll();
			model.addAttribute("list", list);
			model.addAttribute("sunCategoryList", sunCategoryList);
			model.addAttribute("campaignList", campaignList);
			
			return "index";
		 }
}
