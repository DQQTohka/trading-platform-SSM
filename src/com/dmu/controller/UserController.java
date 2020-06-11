package com.dmu.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dmu.pojo.User;
import com.dmu.service.UserService;


@Controller
public class UserController {
	@Resource
	private UserService userServiceImpl;
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	@RequestMapping("register")
	public String UserRegister(User user) {
		int index = userServiceImpl.insUserRegister(user);
		if(index>0) {
			return "redirect:/main.jsp";
		}else {
			return "redirect:/error.jsp";
		}
	}
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	@RequestMapping("login")
	public String CheckedUserLogin(User user, HttpSession session, HttpServletRequest request) {
		User u = userServiceImpl.selcheckedUserLogin(user);
		//设置登录后的user的session
		session.setAttribute("user", u);
		if(u!=null) {
			return "redirect:/main.jsp";
		}else {
			//用户名密码不正确的时候显示信息
			request.setAttribute("message", "此用户名或密码错误，请从新输入！");
			return "/login.jsp";
		}
	}
	/**
	 * 用户退出
	 * @param session 强制销毁session
	 * @return
	 */
	@RequestMapping("out")
	public String UserOut(HttpSession session) {
		session.invalidate();
		return "redirect:main.jsp";
	}
	/**
	 * 查看个人信息控制器
	 */
	@RequestMapping("user_info")
	public String UserInfo() {
		return "user_info.jsp";
	}
	
	/**
	 * 商品金额交易
	 * @param price 商品价格
	 * @param uid 卖家id
	 * @return
	 */
	@RequestMapping("updUserBalance")
	public String updBalance(double price, int uid,HttpSession session) {
		User user = (User) session.getAttribute("user");
		//支付金额
		int index = userServiceImpl.updUserPayMoney(price, user.getId(), uid);
		if(index == 2) {
			//金额改变后修改user的session,重新从数据库读取数据
			User u = userServiceImpl.selcheckedUserLogin(user);
			session.setAttribute("user", u);
			return "order";
		}
		else {
			return "error.jsp";
		}
	}
	/**
	 * 更改用户基本信息，更改后要重新获取user的session
	 * @param session
	 * @return
	 */
	@RequestMapping("changeUserInfo")
	public String changeUserInfo(User user, HttpSession session) {
		int index = userServiceImpl.updUserInfo(user);
		if(index>0) {
			//更改后要重新获取user的session
			User getUser = (User) session.getAttribute("user");
			User newUser = userServiceImpl.selcheckedUserLogin(getUser);
			session.setAttribute("user", newUser);
			//return "success.jsp";
			return "redirect:user_info.jsp";
		}else {
			return "error.jsp";
		}
	}
	
	/**
	 * 更改用户密码
	 * @param user
	 * @return
	 */
	@RequestMapping("changeUserPwd")
	public String changeUserPwd(User user, HttpSession session) {
		int index = userServiceImpl.updUserPwd(user);
		//改变后修改user的session,重新从数据库读取数据
		User u = userServiceImpl.selcheckedUserLogin(user);
		session.setAttribute("user", u);
		if(index>0) {
			session.invalidate();
			return "success.jsp";
		}else {
			return "error.jsp";
		}
	}
	
	/**
	 * 通过用户账号进行安全验证，查询用户
	 * @param sno 用户账号
	 * @param req
	 * @return
	 */
	@RequestMapping("findPwd")
	public String selQuestion(String sno, HttpServletRequest req) {
		User user = userServiceImpl.selUserBySno(sno);
		if(user != null) {
			req.setAttribute("user", user);
			return "confAnswer.jsp";
		}else {
			return "error.jsp";
		}
		
	}
	
	/**
	 * 用户充值
	 * @param price 充值的金额
	 * @param session
	 * @return
	 */
	@RequestMapping("recharge")
	public String recharge(double price, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int index = userServiceImpl.updUserRecharge(price, user.getId());
		if(index > 0) {
			User u = userServiceImpl.selcheckedUserLogin(user);
			session.setAttribute("user", u);
			return "redirect:index.jsp";
		}else {
			return "error.jsp";
		}	
	}
}
