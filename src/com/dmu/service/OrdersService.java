package com.dmu.service;

import java.util.List;

import com.dmu.pojo.Orders;

public interface OrdersService {
	/**
	 * 插入订单信息
	 * @param uid
	 * @param pid
	 * @return
	 */
	int insOrders(int uid, int cid, int pid);
	/**
	 * 查询用户的所有订单信息
	 * @param uid
	 * @return
	 */
	List<Orders> selMyOrders(int uid);
	/**
	 * 查询该用户卖出的商品订单
	 * @param cid 用户id
	 * @return
	 */
	List<Orders> selSellOrders(int cid);
}
