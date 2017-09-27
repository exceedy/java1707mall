package com.situ.mall.vo;

import com.situ.mall.pojo.Product;

public class SearchCondition<T> {
	private Integer pageIndex;
	private Integer pageSize;
	private Product product;
	
	
	public SearchCondition() {
		super();
	}


	public SearchCondition(Integer pageIndex, Integer pageSize, Product product) {
		super();
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.product = product;
	}


	public Integer getPageIndex() {
		return pageIndex;
	}


	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}


	public Integer getPageSize() {
		return pageSize;
	}


	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	@Override
	public String toString() {
		return "SearchCondition [pageIndex=" + pageIndex + ", pageSize=" + pageSize + ", product=" + product + "]";
	}
	
	
}
