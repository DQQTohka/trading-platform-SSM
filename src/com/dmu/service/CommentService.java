package com.dmu.service;

import com.dmu.pojo.Comment;

public interface CommentService {
	/**
	 * 插入评论
	 * @param comment
	 * @return
	 */
	int insComment(Comment comment);
}
