package com.dmu.service;

import java.util.List;

import com.dmu.pojo.MyCollect;

public interface MyCollectService {
	/**
	 * 加入收藏
	 * @param uid
	 * @param pid
	 * @return
	 */
	int insAddCollect(int uid, int pid);
	/**
	 * 查看登录用户所有收藏
	 */
	List<MyCollect> selCollectByUid(int uid);
	/**
	 * 在添加收藏前查看该商品是否已经存在收藏夹
	 */
	MyCollect selCheckedCollect(int uid, int pid);
	
	/**
	 * 删除收藏
	 * @param id 收藏id
	 * @return
	 */
	int delCollectById(int id);
}
