package com.situ.mall.pojo;

public class Campaign {
	private Integer id;
	private String name;
	private String subImage;
	private Integer status;
	
	
	
	public Campaign() {
		super();
	}



	public Campaign(String name, String subImage, Integer status) {
		super();
		this.name = name;
		this.subImage = subImage;
		this.status = status;
	}



	public Campaign(Integer id, String name, String subImage, Integer status) {
		super();
		this.id = id;
		this.name = name;
		this.subImage = subImage;
		this.status = status;
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getSubImage() {
		return subImage;
	}



	public void setSubImage(String subImage) {
		this.subImage = subImage;
	}



	public Integer getStatus() {
		return status;
	}



	public void setStatus(Integer status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "Comtaign [id=" + id + ", name=" + name + ", subImage=" + subImage + ", status=" + status + "]";
	}
	
	
	
}
