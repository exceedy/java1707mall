package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public boolean addProduct(Product product) {
		int result = productDao.addProduct(product);
		return result > 0 ? true : false;
	}

	public Product findById(Integer id) {
		return productDao.findById(id);
	}

	public boolean updateProduct(Product product) {
		int retult = productDao.updateProduct(product);
		return retult > 0 ? true : false;
	}

	public boolean deleteProduct(Integer id) {
		int result = productDao.deleteProduct(id);
		return result > 0 ? true : false;
	}

	public boolean updateStatus(Integer id, int status) {
		int result = productDao.updateStatus(id,status);
		return result > 0 ? true : false ;
	}

	public List<Product> getCategoryProduct(Integer categoryId) {
		return productDao.getCategoryProduct(categoryId);
	}

}
