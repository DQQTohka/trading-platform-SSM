package com.dmu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dmu.mapper.CommentMapper;
import com.dmu.pojo.Comment;
import com.dmu.service.CommentService;
@Service
public class CommentServiceImpl implements CommentService{
	@Resource
	private CommentMapper commentMapper;
	@Override
	public int insComment(Comment comment) {
		return commentMapper.insComment(comment);
	}

}
