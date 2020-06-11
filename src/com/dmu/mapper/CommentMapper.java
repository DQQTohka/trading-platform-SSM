package com.dmu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.dmu.pojo.Comment;

public interface CommentMapper {
	/**
	 * 插入内容
	 */
	@Insert("insert into comment values(default,#{pid},#{uid},#{content},default)")
	int insComment(Comment comment);
	/**
	 * 通过pid查询
	 */
	@Select("select * from comment where pid=#{0}")
	List<Comment> selCommentByPid(int pid);
}
