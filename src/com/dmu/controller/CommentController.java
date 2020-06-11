package com.dmu.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dmu.pojo.Comment;
import com.dmu.pojo.User;
import com.dmu.service.CommentService;

@Controller
public class CommentController {
	@Resource
	private CommentService commentServiceImpl;
	
	/**
	 * 留言
	 * @param pid 传过来的商品id
	 * @param comment 留言内容
	 * @param resp
	 * @param session
	 * @return
	 */
	@RequestMapping("comment")
	public String PublishComment(int pid, Comment comment, HttpServletResponse resp, HttpSession session) {
		//设置响应编码
		//resp.setContentType("text/html;charset=utf-8");
		User user = (User) session.getAttribute("user");
		comment.setUid(user.getId());
		int index = commentServiceImpl.insComment(comment);
		if(index>0) {
			return "productinfo?id="+pid;
		}else {
			return "error.jsp";
		}
	}
}
