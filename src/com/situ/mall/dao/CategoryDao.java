package com.situ.mall.dao;

import java.util.List;

import com.situ.mall.pojo.Category;

public interface CategoryDao {
	List<Category> findAll();
	List<Category> findAllParentCategory();
	List<Category> findSunCategoryByParentId(int categoryId);
	int addParentCategory(Category category);
	int addSunCategory(Category category);
	int deleteCategory(Integer id);
	
}
