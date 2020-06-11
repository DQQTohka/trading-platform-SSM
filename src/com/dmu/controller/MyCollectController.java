package com.dmu.controller;

import java.util.List;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.dmu.pojo.MyCollect;
import com.dmu.pojo.User;
import com.dmu.service.MyCollectService;


@Controller
public class MyCollectController {
	@Resource
	private MyCollectService myCollectServiceImpl;
	
	/**
	 * 添加收藏
	 * @param id 商品的id
	 * @param session
	 * @return
	 */
	//@ResponseBody
	@RequestMapping("addcollect")
	public String AddCollect(int id, HttpSession session) {
		User u = (User) session.getAttribute("user");
		int index = myCollectServiceImpl.insAddCollect(u.getId(), id);
		if(index>0) {
			//return "redirect:index.jsp";
			//收藏成功返回当前页面
			return "productinfo?id="+id;
		}else {
			return "error.jsp";
		}	
	}
	/**
	 * 添加收藏前判断是否已经存在
	 */
	@RequestMapping("checkedcollect")
	//id 为商品的id
	public String checkedCollect(int id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		MyCollect myCollect = myCollectServiceImpl.selCheckedCollect(user.getId(),id);
		if(myCollect==null) {
			return "addcollect";
		}else {
			return "productinfo?id="+id;
		}
		
	}
	/**
	 * 查看我的收藏
	 * @param req
	 * @param session
	 * @return
	 */
	@RequestMapping("showcollect")
	public String showCollects(HttpServletRequest req, HttpSession session) {
		User u = (User) session.getAttribute("user");
		List<MyCollect> collects = myCollectServiceImpl.selCollectByUid(u.getId());
		req.setAttribute("collects", collects);
		if(collects!=null) {
			return "collect.jsp";
		}else {
			return "error.jsp";
		}
	}
	/**
	 * 删除收藏
	 * @param id 收藏的id
	 * @return
	 */
	@RequestMapping("delCollect")
	public String delCollect(int id) {
		int index = myCollectServiceImpl.delCollectById(id);
		if(index>0) {
			return "showcollect";
		}else {
			return "error.jsp";
		}
	}
}
