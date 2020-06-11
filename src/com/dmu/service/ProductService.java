package com.dmu.service;

import java.util.List;

import com.dmu.pojo.Product;

public interface ProductService {
	/**
	 * 查看所有发布商品
	 * @return
	 */
	List<Product> selAllProductShow();
	/**
	 * 发布商品
	 */
	int insPublishProduct(Product product);
	/**
	 * 查看登录用户发布的商品
	 */
	List<Product> selUserProduct(int uid);
	/**
	 * 查看某个商品的详细
	 */
	Product selProductInfo(int pid);
	/**
	 * 购买商品
	 */
	int updBuy(int pid);
	/**
	 * 分类查看商品
	 */
	List<Product> selSortProduct(int sort);
	/**
	 * 根据分类和日期对上架商品进行排序，降序
	 */
	List<Product> selSortDayDesc(int sort);
	/**
	 * 根据分类和价格对上架商品进行排序，降序
	 */
	List<Product> selSortPriceDesc(int sort);
	/**
	 * 根据分类和价格对上架商品进行排序，升序
	 */
	List<Product> selSortPriceAsc(int sort);
	/**
	 * 根据商品名字查询
	 */
	List<Product> selSearchProduct(String name);
	
	/**
	 * 通过商品id删除该商品
	 */
	int delProductById(int id);
}
