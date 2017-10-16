package com.situ.mall.vo;

import com.situ.mall.pojo.Product;

public class CartItemsVo {
	private Product product;
	
	private Integer amount;
	
	private Integer checked;
	
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	

	public Integer getChecked() {
		return checked;
	}

	public void setChecked(Integer checked) {
		this.checked = checked;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "CartItemsVo [product=" + product + ", amount=" + amount + ", checked=" + checked + "]";
	}
	
	
}
