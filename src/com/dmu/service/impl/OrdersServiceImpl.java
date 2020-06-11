package com.dmu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dmu.mapper.OrdersMapper;
import com.dmu.pojo.Orders;
import com.dmu.service.OrdersService;
@Service
public class OrdersServiceImpl implements OrdersService{
	@Resource
	private OrdersMapper ordersMapper;
	@Override
	public int insOrders(int uid, int cid, int pid) {
		return ordersMapper.insOrders(uid, cid, pid);
	}
	/**
	 * 查看我的订单
	 */
	@Override
	public List<Orders> selMyOrders(int uid) {
		return ordersMapper.selOrdersByUid(uid);
	}
	@Override
	public List<Orders> selSellOrders(int cid) {
		return ordersMapper.selOrdersByCid(cid);
	}
}
