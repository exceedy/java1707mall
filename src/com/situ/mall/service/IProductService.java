package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Product;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

public interface IProductService {

	PageBean<Product> pageList(int index, int size);

	PageBean<Product> searchConditionSelect(SearchCondition<Product> searchCondition);

	boolean addProduct(Product product);

	Product findById(Integer id);

	boolean updateProduct(Product product);

	boolean deleteProduct(Integer id);

	boolean updateStatus(Integer id, int status);

	List<Product> getCategoryProduct(Integer sunCategoryId);

}
