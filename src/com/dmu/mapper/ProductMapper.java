package com.dmu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.dmu.pojo.Product;

public interface ProductMapper {
	/**
	 * 选择所有上架的商品
	 * @return
	 */
	@Select("select * from product where display=1")
	List<Product> selAllProduct();
	/**
	 * 插入商品信息
	 */
	@Insert("insert into product values(default,#{name},#{remark},#{price},#{sort},#{uid},default,#{image},default)")
	int insProduct(Product product);
	/**
	 * 根据商品id查询某个商品
	 */
	Product selProductById(int id);
	//@Select("select * from product where id=#{0}")
	/**
	 * 根据用户id查询发布的商品
	 */
	@Select("select * from product where uid=#{0} and display=1")
	List<Product> selProductByUid(int uid);
	/**
	 * 根据商品的id更新display
	 */
	@Update("update product set display=0 where id=#{0}")
	int updProductDisplay(int pid);
	/**
	 * 根据上架的商品类别sort查询
	 */
	@Select("select * from product where display=1 and sort=#{0}")
	List<Product> selProductBySort(int sort);
	/**
	 * 根据商品发布日期降序排序
	 */
	List<Product> selByDayDesc(@Param("sort") int sort);
	/**
	 * 根据商品价格降序排序
	 */
	List<Product> selByPriceDesc(@Param("sort") int sort);
	/**
	 * 根据商品价格升排序
	 */
	List<Product> selByPriceAsc(@Param("sort") int sort);
	/**
	 * 根据商品名字搜索
	 * 不使用concat会出现
	 * Parameter index out of range (1 > number of parameters, which is 0)这个错误
	 * mysql CONCAT（）函数用于将多个字符串连接成一个字符串
	 */
	@Select("select * from product where name like CONCAT('%',#{0},'%') and display = 1")
	List<Product> selProductByName(String name);
	
	/**
	 * 通过id删除商品
	 * @param id
	 * @return
	 */
	@Delete("delete from product where id=#{0}")
	int delById(int id);
}
