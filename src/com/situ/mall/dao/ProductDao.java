package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Product;
import com.situ.mall.vo.SearchCondition;

public interface ProductDao {
	/**
	 * 分页列表
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	List<Product> getPageList(@Param(value="pageIndex")int pageIndex, @Param(value="pageSize")int pageSize);
	/**
	 * 分页数量
	 * @return
	 */
	int getCount();
	/**
	 * 查询分页列表
	 * @param searchCondition
	 * @return
	 */
	int getSearchConditionCount(SearchCondition<Product> searchCondition);
	/**
	 * 查询分页总数
	 * @param searchCondition
	 * @return
	 */
	List<Product> getSearchConditionList(SearchCondition<Product> searchCondition);
	/**
	 * 添加商品
	 * @param product
	 * @return 
	 */
	int addProduct(Product product);
	/**
	 * 根据商品id查询商品（用于修改展示）
	 * @param id
	 * @return
	 */
	Product findById(int id);
	/**
	 * 修改商品信息
	 * @param product
	 */
	void updateProduct(Product product);
	/**
	 * 删除商品
	 * @param id
	 */
	void deleteProduct(int id);
	
}
