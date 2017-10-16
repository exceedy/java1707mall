package com.situ.mall.pojo;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;

public class Order {
	private Integer id;//订单id
	
	private BigInteger orderNo;//订单号
	
	private Integer userId;//用户id
	
	private Integer shippingId;//收货地址id
	
	private Integer payment;//实付金额
	
	private Integer status;//订单状态
	
	private Integer paymentType;//支付方式
	
	private Integer postage;//运费
	
	private Date paymentTime;//支付时间
	
	private Date sendTime;//发货时间
	
	private Date endTime;//交易结束时间
	
	private Date closeTime;//交易关闭时间
	
	private Date createTime;//创建时间
	
	private Date updateTime;//更新时间
	
	private List<OrderItem> list;

	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}


	
	public Date getUpdateTime() {
		return updateTime;
	}

	
	
	
	public Order() {
		super();
	}


	
	public List<OrderItem> getList() {
		return list;
	}



	public void setList(List<OrderItem> list) {
		this.list = list;
	}



	public Order(Integer id, BigInteger orderNo, Integer userId, Integer shippingId, Integer payment, Integer status,
			Integer paymentType, Integer postage, Date paymentTime, Date sendTime, Date endTime, Date closeTime,
			Date createTime, Date updateTime, List<OrderItem> list) {
		super();
		this.id = id;
		this.orderNo = orderNo;
		this.userId = userId;
		this.shippingId = shippingId;
		this.payment = payment;
		this.status = status;
		this.paymentType = paymentType;
		this.postage = postage;
		this.paymentTime = paymentTime;
		this.sendTime = sendTime;
		this.endTime = endTime;
		this.closeTime = closeTime;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.list = list;
	}
	public Double getTotalPrice() {
		double totalPrice = 0.0;
		for (OrderItem orderItem : list) {
			totalPrice += orderItem.getTotalPrice();
		}
		return totalPrice;
	}


	public Order(Integer id, BigInteger orderNo, Integer userId, Integer shippingId, Integer payment, Integer status,
			Integer paymentType, Integer postage, Date paymentTime, Date senTime, Date endTime, Date close,
			Date createTime, Date updateTime) {
		super();
		this.id = id;
		this.orderNo = orderNo;
		this.userId = userId;
		this.shippingId = shippingId;
		this.payment = payment;
		this.status = status;
		this.paymentType = paymentType;
		this.postage = postage;
		this.paymentTime = paymentTime;
		this.sendTime = senTime;
		this.endTime = endTime;
		this.closeTime = close;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}



	public Order(Integer id, Integer paymentType, BigInteger orderNo, Integer userId, Integer shippingId, Integer status, Date createTime,
			Date updateTime) {
		super();
		this.id = id;
		this.orderNo = orderNo;
		this.userId = userId;
		this.shippingId = shippingId;
		this.status = status;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.paymentType = paymentType;
	}



	public Order(BigInteger orderNo,Integer paymentType, Integer userId, Integer shippingId, Integer status, Date createTime,
			Date updateTime) {
		super();
		this.orderNo = orderNo;
		this.userId = userId;
		this.shippingId = shippingId;
		this.status = status;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.paymentType = paymentType;
	}



	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}



	public BigInteger getOrderNo() {
		return orderNo;
	}



	public void setOrderNo(BigInteger orderNo) {
		this.orderNo = orderNo;
	}



	public Integer getUserId() {
		return userId;
	}



	public void setUserId(Integer userId) {
		this.userId = userId;
	}



	public Integer getShippingId() {
		return shippingId;
	}



	public void setShippingId(Integer shippingId) {
		this.shippingId = shippingId;
	}

	


	public Integer getPaymentType() {
		return paymentType;
	}



	public void setPaymentType(Integer paymentType) {
		this.paymentType = paymentType;
	}



	public Integer getPayment() {
		return payment;
	}



	public void setPayment(Integer payment) {
		this.payment = payment;
	}



	public Integer getStatus() {
		return status;
	}



	public void setStatus(Integer status) {
		this.status = status;
	}



	public Integer getPostage() {
		return postage;
	}



	public void setPostage(Integer postage) {
		this.postage = postage;
	}



	public Date getPaymentTime() {
		return paymentTime;
	}



	public void setPaymentTime(Date paymentTime) {
		this.paymentTime = paymentTime;
	}



	public Date getSendTime() {
		return sendTime;
	}



	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}



	public Date getEndTime() {
		return endTime;
	}



	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}



	public Date getCloseTime() {
		return closeTime;
	}



	public void setCloseTime(Date closeTime) {
		this.closeTime = closeTime;
	}



	public Date getCreateTime() {
		return createTime;
	}



	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}



	@Override
	public String toString() {
		return "Order [id=" + id + ", orderNo=" + orderNo + ", userId=" + userId + ", shippingId=" + shippingId
				+ ", payment=" + payment + ", status=" + status + ", paymentType=" + paymentType + ", postage="
				+ postage + ", paymentTime=" + paymentTime + ", sendTime=" + sendTime + ", endTime=" + endTime
				+ ", closeTime=" + closeTime + ", createTime=" + createTime + ", updateTime=" + updateTime + ", list="
				+ list + "]";
	}




	
	
	
}
