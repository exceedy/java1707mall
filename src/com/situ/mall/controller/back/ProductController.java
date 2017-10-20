package com.situ.mall.controller.back;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.ServletRespone;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

@Controller
@RequestMapping(value="product")
public class ProductController {
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	@Autowired
	private IProductService productService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value="pageList")
	public String pageList(Model model,Integer pageIndex,Integer pageSize) {
		int index = 1;
		int size = 3;
		if (pageIndex != null) {
			index = pageIndex;
		}
		if (pageSize != null) {
			size = pageSize;
		}
		PageBean<Product> pageBean = productService.pageList(index,size);
		model.addAttribute("pageBean", pageBean);
		return "product_show";
	}
	
	@RequestMapping(value="searchConditionSelect")
	public String searchConditionSelect (Model model,Integer pageIndex,Integer pageSize, Product product ) {
		SearchCondition<Product> searchCondition = new SearchCondition<Product>();
		searchCondition.setProduct(product);
		/*Integer pageIndex = searchCondition.getPageIndex();*/
		int index = 1;
		if (pageIndex != null) {
			index = pageIndex;
		}
	/*	Integer pageSize = searchCondition.getPageSize();*/
		searchCondition.setPageIndex(index);
		int size = 3;
		if (pageSize != null) {
			size = pageSize;
		}
		searchCondition.setPageSize(size);
		PageBean<Product> pageBean = productService.searchConditionSelect(searchCondition);
		model.addAttribute("pageBean", pageBean);
		List<Category> categoryList = categoryService.findAll();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("searchCondition", searchCondition);
		return "product_show";
	}
	
	@RequestMapping(value="toAddProduct")
	public String toAddProduct() {
		return "add_product";
	}
	
	@RequestMapping(value="addProduct")
	@ResponseBody
	public ServletRespone addProgory(Product product) {
		System.out.println(product);
		ServletRespone servletRespone = productService.addProduct(product);
		return servletRespone;
	}
	
	@RequestMapping(value="toUpdateProduct")
	public String toUpdateProduct(Integer id, Model model) {
		List<Category> list = categoryService.findParentCategory();
		Product product = productService.findById(id);
		int preantId = product.getCategory().getParentId();
		List<Category> sunCategoryList = categoryService.findCategory(preantId);
		model.addAttribute("list", list);
		model.addAttribute("sunCategoryList", sunCategoryList);
		model.addAttribute("product", product);
		return "update_product";
	}
	
	@RequestMapping(value="updateProduct")
	public String updateProduct(Product product) {
		boolean retule = productService.updateProduct(product);
		return "redirect:/product/pageList.action";
	}
	
	@RequestMapping(value="deleteProduct")
	@ResponseBody
	public ServletRespone deleteProduct(Integer id) {
		return  productService.deleteProduct(id);
	}
	
	@RequestMapping(value="deleteAll")
	public String deleteAll(Integer[] selectIds) {
		for (Integer id : selectIds) {
			productService.deleteProduct(id);
		}
		return "redirect:/product/pageList.action";
	}
	
	@RequestMapping(value="updateStatusUp")
	public String updateStatusUp(Integer id) {
		int status = 1;
		boolean result = productService.updateStatus(id,status);
		return "redirect:/product/pageList.action";
	}
	@RequestMapping(value="updateStatusDown")
	public String updateStatusDown(Integer id) {
		int status = 2;
		boolean result = productService.updateStatus(id,status);
		return "redirect:/product/pageList.action";
	}
	
	@RequestMapping(value="updateAllStatusUp")
	public String updateAllStatusUp(Integer[] selectIds) {
		for (Integer id : selectIds) {
			productService.updateStatus(id, 1);
		}
		return "redirect:/product/pageList.action";
	}
	
	@RequestMapping(value="updateAllStatusDown")
	public String updateAllStatusDown(Integer[] selectIds) {
		for (Integer id : selectIds) {
			productService.updateStatus(id, 2);
		}
		return "redirect:/product/pageList.action";
	}
	
	@RequestMapping(value="index")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="show")
	@ResponseBody
	public ServletRespone show (Integer id) {
		return  productService.show(id);
	}
	
}
