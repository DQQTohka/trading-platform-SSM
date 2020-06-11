package com.dmu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dmu.mapper.ProductMapper;
import com.dmu.pojo.Product;
import com.dmu.service.ProductService;
@Service
public class ProductServiceImpl implements ProductService{
	@Resource
	private ProductMapper productMapper;
	@Override
	public List<Product> selAllProductShow() {
		return productMapper.selAllProduct();
	}
	@Override
	public int insPublishProduct(Product product) {
		return productMapper.insProduct(product);
	}
	@Override
	public List<Product> selUserProduct(int uid) {
		return productMapper.selProductByUid(uid);
	}
	@Override
	public Product selProductInfo(int pid) {
		return productMapper.selProductById(pid);
	}
	@Override
	public int updBuy(int pid) {
		return productMapper.updProductDisplay(pid);
	}
	@Override
	public List<Product> selSortProduct(int sort) {
		return productMapper.selProductBySort(sort);
	}
	@Override
	public List<Product> selSortDayDesc(int sort) {
		return productMapper.selByDayDesc(sort);
	}
	@Override
	public List<Product> selSortPriceDesc(int sort) {
		return productMapper.selByPriceDesc(sort);
	}
	@Override
	public List<Product> selSortPriceAsc(int sort) {
		return productMapper.selByPriceAsc(sort);
	}
	@Override
	public List<Product> selSearchProduct(String name) {
		return productMapper.selProductByName(name);
	}
	@Override
	public int delProductById(int id) {
		return productMapper.delById(id);
	}

}
