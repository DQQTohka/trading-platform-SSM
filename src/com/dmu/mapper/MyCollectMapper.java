package com.dmu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.dmu.pojo.MyCollect;

public interface MyCollectMapper {
	/**
	 * 查询某个用户的收藏
	 * @return
	 */
	List<MyCollect> selAllCollectByUid(int uid);
	/**
	 * 添加收藏
	 */
	@Insert("insert into my_collect values(default,#{0},#{1})")
	int insCollect(int uid, int pid);
	/**
	 * 查看改用户是否收藏有某一个藏品
	 */
	@Select("select * from my_collect where uid=#{0} and pid=#{1}")
	MyCollect selByUidPid(int uid, int pid);
	
	/**
	 * 通过收藏id删除收藏
	 */
	@Delete("delete from my_collect where id = #{0}")
	int delById(int id);
}
