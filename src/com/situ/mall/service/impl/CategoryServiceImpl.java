package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.CategoryDao;
import com.situ.mall.pojo.Category;
import com.situ.mall.service.ICategoryService;

@Service
public class CategoryServiceImpl implements ICategoryService{

	@Autowired
	private CategoryDao categoryMapper;

	public List<Category> findParentCategory() {
		return categoryMapper.findAllParentCategory();
	}

	public List<Category> findAll() {
		return categoryMapper.findAll();
	}

	public List<Category> findCategory(int categoryId) {
		return categoryMapper.findSunCategoryByParentId(categoryId);
	}

	public boolean addParentCategory(Category category) {
		int result  = categoryMapper.addParentCategory(category);
		return result > 0 ? true : false;
	}

	public boolean addSunCategory(Category category) {
		int result = categoryMapper.addSunCategory(category);
		return result > 0 ? true : false;
	}

	public boolean deleteCategory(Integer id) {
		int result = categoryMapper.deleteCategory(id);
		return result > 0 ? true : false;
	}

}
