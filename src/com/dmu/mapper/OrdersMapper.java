package com.dmu.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.dmu.pojo.Orders;

public interface OrdersMapper {
	/**
	 * 插入订单
	 */
	@Insert("INSERT into orders VALUES(default,default,#{0},#{1},#{2})")
	int insOrders(int uid, int cid, int pid);
	/**
	 * 通过买家用户id查询订单
	 */
	//@Select("select * from orders where uid=#{0}")
	List<Orders> selOrdersByUid(int uid);
	/**
	 * 通过卖家id查询卖出的产品
	 */
	//@Select("select * from orders where cid=#{0}")
	List<Orders> selOrdersByCid(int cid);
}
