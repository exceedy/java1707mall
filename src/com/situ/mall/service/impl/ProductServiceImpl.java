package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.common.ServletRespone;
import com.situ.mall.dao.ProductDao;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

@Service
public class ProductServiceImpl implements IProductService{

	@Autowired
	private ProductDao productDao;

	public PageBean<Product> pageList(int pageIndex, int pageSize) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = productDao.getCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize);
		pageBean.setTotalPage(totalPage);
		int index = (pageIndex - 1) * pageSize;
		List<Product> list = productDao.getPageList(index,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	public PageBean<Product> searchConditionSelect(SearchCondition<Product> searchCondition) {
		PageBean<Product> pageBean = new PageBean<Product>();
		Integer pageIndex = searchCondition.getPageIndex();
		Integer pageSize = searchCondition.getPageSize();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = productDao.getSearchConditionCount(searchCondition);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize);
		pageBean.setTotalPage(totalPage);
		int index = (pageIndex - 1) * pageSize;
		searchCondition.setPageIndex(index);
		List<Product> list = productDao.getSearchConditionList(searchCondition);
		pageBean.setList(list);
		return pageBean;
	}

	public ServletRespone addProduct(Product product) {
		int result = productDao.addProduct(product);
	try {
		if (result > 0) {
			return ServletRespone.creatSuccess("添加成功");
		} else {
			return ServletRespone.creatError("添加失败");
			
		}
	} catch (Exception e) {
		return ServletRespone.creatError("添加失败");
	}	
	}

	public Product findById(Integer id) {
		return productDao.findById(id);
	}

	public boolean updateProduct(Product product) {
		int retult = productDao.updateProduct(product);
		return retult > 0 ? true : false;
	}

	public ServletRespone deleteProduct(Integer id) {
		try {
			int result = productDao.deleteProduct(id);
			if (result > 0) {
				return ServletRespone.creatSuccess("删除成功");
				
			} else {
				return ServletRespone.creatError("删除失败");
			}
		} catch (Exception e) {
			return ServletRespone.creatError("删除失败");
		}
	}

	public boolean updateStatus(Integer id, int status) {
		int result = productDao.updateStatus(id,status);
		return result > 0 ? true : false ;
	}

	/*public List<Product> getCategoryProduct(Integer categoryId) {
		return productDao.getCategoryProduct(categoryId);
	}*/

	public PageBean<Product> getPageBean(Integer pageIndex, Integer sunCategoryId, Integer pageSize) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = productDao.getCategoryProductCount(sunCategoryId);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil((double) totalCount / pageSize);
		pageBean.setTotalPage(totalPage);
		int index = (pageIndex - 1) * pageSize;
		List<Product> list = productDao.getCategoryProduct(index, sunCategoryId, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

}
