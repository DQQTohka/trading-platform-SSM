package com.dmu.pojo;

import java.util.List;

public class Product {
	private int id;
	private String name;		
	private String remark;			//商品详细信息
	private double price;
	private int sort;				//商品类别 1：数码科技，2：生活百货，3：鞋服配饰，4：文具书籍，5：其他
	private int uid;				//发布用户id
	private int display;			//商品是否被下架
	private String image; 			//商品图片地址
	private String day; 			//商品修改日期
	private List<Comment> comment;  //商品留言
	private User user;				//上架该商品的用户
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Comment> getComment() {
		return comment;
	}
	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getDisplay() {
		return display;
	}
	public void setDisplay(int display) {
		this.display = display;
	}
	
	
}
