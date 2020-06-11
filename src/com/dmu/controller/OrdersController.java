package com.dmu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dmu.pojo.Orders;
import com.dmu.pojo.User;
import com.dmu.service.OrdersService;

@Controller
public class OrdersController {
	@Resource
	private OrdersService ordersServiceImpl;
	/**
	 * 更新用户金额后，支付成功，插入订单信息
	 * @param id 商品id
	 * @param uid 卖家id
	 * @param session 获取买家id
	 * @return
	 */
	@RequestMapping("order")
	//id为商品id
	public String Buy(int id, int uid, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int index = ordersServiceImpl.insOrders(user.getId(), uid, id);
		if(index>0) {
			return "redirect:success.jsp";
		}else {
			return "error.jsp";
		}
	}
	/**
	 * 查看我已经完成的订单
	 * @param session
	 * @param req
	 * @return
	 */
	@RequestMapping("showmyorders")
	public String ShowMyOrders(HttpSession session, HttpServletRequest req) {
		User user = (User) session.getAttribute("user");
		List<Orders> orders = ordersServiceImpl.selMyOrders(user.getId());
		if(orders!=null) {
			req.setAttribute("orders", orders);
			return "orders.jsp";
		}else {
			return "error.jsp";
		}
	}
	
	@RequestMapping("showmysell")
	public String ShowMySell(HttpSession session, HttpServletRequest req) {
		User user = (User) session.getAttribute("user");
		List<Orders> mysell = ordersServiceImpl.selSellOrders(user.getId());
		if(mysell!=null) {
			req.setAttribute("mysell", mysell);
			return "my_sell.jsp";
		}else {
			return "error.jsp";
		}
	}
}
