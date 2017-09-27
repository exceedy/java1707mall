package com.situ.mall.service;

import com.situ.mall.pojo.Product;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

public interface IProductService {

	PageBean<Product> pageList(int index, int size);

	PageBean<Product> searchConditionSelect(SearchCondition<Product> searchCondition);

	boolean addProduct(Product product);

}
