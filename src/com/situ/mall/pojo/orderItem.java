package com.situ.mall.pojo;

import java.util.Date;

public class OrderItem {
	private Integer id;//订单详情id
	
	private Integer userId;//用户id
	
	private Long orderNo;//订单编号
	
	private Integer productId;//商品id
	
	private String productName;//商品名称
	
	private String productImage;//商品图片地址
	
	private Double currentUnitPrice;//生成订单时的商品价格
	
	private Integer quantity;//商品数量
	
	private Integer totalPrice;//商品总价
	
	private Date createTime;//创建时间
	
	private Date updateTime;//修改时间
	
	

	public OrderItem(Integer userId, Long orderNo, Integer productId, String productName, String productImage,
			Double currentUnitPrice, Integer qiantity, Integer totaklprice, Date createTime, Date updateTime) {
		super();
		this.userId = userId;
		this.orderNo = orderNo;
		this.productId = productId;
		this.productName = productName;
		this.productImage = productImage;
		this.currentUnitPrice = currentUnitPrice;
		this.quantity = qiantity;
		this.totalPrice = totaklprice;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	


	public OrderItem() {
		super();
	}




	public OrderItem(Integer id, Integer userId, Long orderNo, Integer productId, String productName,
			String productImage, Double currentUnitPrice, Integer qiantity, Integer totaklprice, Date createTime,
			Date updateTime) {
		super();
		this.id = id;
		this.userId = userId;
		this.orderNo = orderNo;
		this.productId = productId;
		this.productName = productName;
		this.productImage = productImage;
		this.currentUnitPrice = currentUnitPrice;
		this.quantity = qiantity;
		this.totalPrice = totaklprice;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public Integer getUserId() {
		return userId;
	}



	public void setUserId(Integer userId) {
		this.userId = userId;
	}



	public Long getOrderNo() {
		return orderNo;
	}



	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}



	public Integer getProductId() {
		return productId;
	}



	public void setProductId(Integer productId) {
		this.productId = productId;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getProductImage() {
		return productImage;
	}



	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}



	public Double getCurrentUnitPrice() {
		return currentUnitPrice;
	}



	public void setCurrentUnitPrice(Double currentUnitPrice) {
		this.currentUnitPrice = currentUnitPrice;
	}



	public Integer getQuantity() {
		return quantity;
	}



	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}



	public Integer getTotalPrice() {
		return totalPrice;
	}



	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}



	public Date getCreateTime() {
		return createTime;
	}



	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}



	public Date getUpdateTime() {
		return updateTime;
	}



	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}



	@Override
	public String toString() {
		return "orderItem [id=" + id + ", userId=" + userId + ", orderNo=" + orderNo + ", productId=" + productId
				+ ", productName=" + productName + ", productImage=" + productImage + ", currentUnitPrice="
				+ currentUnitPrice + ", qiantity=" + quantity + ", totaklprice=" + totalPrice + ", createTime="
				+ createTime + ", updateTime=" + updateTime + "]";
	}
	
	
}
