package com.situ.mall.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.situ.mall.constans.MallConstant;

public class Product implements Serializable {
		private Integer id;//商品id
		
		private Integer categoryId;//分类id
		
		private String name;//商品名称
		
		private String subtitle;//
		
		private String mainImage;
		
		private String subImages;
		
		private String detail;
		
		private BigDecimal price;
		
		private Integer stock;
		
		private Integer status;
		
		private Date createTime;
		
		private Date updateTime;
		
		private Category category;
		
		public Product() {
			super();
		}
		
		
		
		public Product(Integer categoryId, String name, String subtitle, BigDecimal price, Integer stock, Integer status,
				Date createTime, Date updateTime) {
			super();
			this.categoryId = categoryId;
			this.name = name;
			this.subtitle = subtitle;
			this.price = price;
			this.stock = stock;
			this.status = status;
			this.createTime = createTime;
			this.updateTime = updateTime;
		}



		public Product(Integer categoryId, String name, String subtitle, String mainImage, String subImages,
				String detail, BigDecimal price, Integer stock, Integer status, Date createTime, Date updateTime) {
			super();
			this.categoryId = categoryId;
			this.name = name;
			this.subtitle = subtitle;
			this.mainImage = mainImage;
			this.subImages = subImages;
			this.detail = detail;
			this.price = price;
			this.stock = stock;
			this.status = status;
			this.createTime = createTime;
			this.updateTime = updateTime;
		}



		public Product(Integer id, Integer categoryId, String name, String subtitle, String mainImage,
				String subImages, String detail, BigDecimal price, Integer stock, Integer status, Date updateTime,
				Category category) {
			super();
			this.id = id;
			this.categoryId = categoryId;
			this.name = name;
			this.subtitle = subtitle;
			this.mainImage = mainImage;
			this.subImages = subImages;
			this.detail = detail;
			this.price = price;
			this.stock = stock;
			this.status = status;
			this.updateTime = updateTime;
			this.category = category;
		}
		

		public String getDetail() {
			return detail;
		}


		public void setDetail(String detail) {
			this.detail = detail;
		}


		public Category getCategory() {
			return category;
		}


		public void setCategory(Category category) {
			this.category = category;
		}


		public Product(Integer categoryId, String name, String subtitle, String mainImage, String subImages,
				String detail, BigDecimal price, Integer stock, Integer status, Date createTime, Category category) {
			super();
			this.categoryId = categoryId;
			this.name = name;
			this.subtitle = subtitle;
			this.mainImage = mainImage;
			this.subImages = subImages;
			this.detail = detail;
			this.price = price;
			this.stock = stock;
			this.status = status;
			this.createTime = createTime;
			this.category = category;
		}


		public Product(Integer id, Integer categoryId, String name, String subtitle, String mainImage,
				String subImages, String detail, BigDecimal price, Integer stock, Integer status, Date createTime,
				Date updateTime, Category category) {
			super();
			this.id = id;
			this.categoryId = categoryId;
			this.name = name;
			this.subtitle = subtitle;
			this.mainImage = mainImage;
			this.subImages = subImages;
			this.detail = detail;
			this.price = price;
			this.stock = stock;
			this.status = status;
			this.createTime = createTime;
			this.updateTime = updateTime;
			this.category = category;
		}


		public Product(Integer id, Integer categoryId, String name, String subtitle, String mainImage,
				String subImages, String detail, BigDecimal price, Integer stock, Integer status, Date createTime,
				Date updateTime) {
			super();
			this.id = id;
			this.categoryId = categoryId;
			this.name = name;
			this.subtitle = subtitle;
			this.mainImage = mainImage;
			this.subImages = subImages;
			this.detail = detail;
			this.price = price;
			this.stock = stock;
			this.status = status;
			this.createTime = createTime;
			this.updateTime = updateTime;
		}

		
		public Product(Integer categoryId, String name, String subtitle, String mainImage, String subImages,
				String detail, BigDecimal price, Integer stock, Integer status, Date createTime) {
			super();
			this.categoryId = categoryId;
			this.name = name;
			this.subtitle = subtitle;
			this.mainImage = mainImage;
			this.subImages = subImages;
			this.detail = detail;
			this.price = price;
			this.stock = stock;
			this.status = status;
			this.createTime = createTime;
		}
		
		

		public Product(Integer id, Integer categoryId, String name, String subtitle, String mainImage,
				String subImages, String detail, BigDecimal price, Integer stock, Integer status, Date updateTime) {
			super();
			this.id = id;
			this.categoryId = categoryId;
			this.name = name;
			this.subtitle = subtitle;
			this.mainImage = mainImage;
			this.subImages = subImages;
			this.detail = detail;
			this.price = price;
			this.stock = stock;
			this.status = status;
			this.updateTime = updateTime;
		}


		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public Integer getCategoryId() {
			return categoryId;
		}

		public void setCategoryId(Integer categoryId) {
			this.categoryId = categoryId;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getSubtitle() {
			return subtitle;
		}

		public void setSubtitle(String subtitle) {
			this.subtitle = subtitle;
		}
		
		@JsonInclude
		public String getMainImage() {
			return MallConstant.SERVER_ADDRES+mainImage;
		}

		public void setMainImage(String mainImage) {
			this.mainImage = mainImage;
		}

		public String getSubImages() {
			return subImages;
		}

		public void setSubImages(String subImages) {
			this.subImages = subImages;
		}

		public BigDecimal getPrice() {
			return price;
		}

		public void setPrice(BigDecimal price) {
			this.price = price;
		}

		public Integer getStock() {
			return stock;
		}

		public void setStock(Integer stock) {
			this.stock = stock;
		}

		public Integer getStatus() {
			return status;
		}

		public void setStatus(Integer status) {
			this.status = status;
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
			return "Product [id=" + id + ", categoryId=" + categoryId + ", name=" + name + ", subtitle=" + subtitle
					+ ", mainImage=" + mainImage + ", subImages=" + subImages + ", price=" + price + ", stock="
					+ stock + ", status=" + status + ", createTime=" + createTime + ", updateTime=" + updateTime + "]";
		}
		
		
		
}
