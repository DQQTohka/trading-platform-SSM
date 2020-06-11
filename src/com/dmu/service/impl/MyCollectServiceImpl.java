package com.dmu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dmu.mapper.MyCollectMapper;
import com.dmu.pojo.MyCollect;
import com.dmu.service.MyCollectService;
@Service
public class MyCollectServiceImpl implements MyCollectService{
	@Resource
	private MyCollectMapper myCollectMapper;
	@Override
	public int insAddCollect(int uid, int pid) {
		return myCollectMapper.insCollect(uid, pid);
	}

	@Override
	public List<MyCollect> selCollectByUid(int uid) {
		return myCollectMapper.selAllCollectByUid(uid);
	}

	@Override
	public MyCollect selCheckedCollect(int uid, int pid) {
		return myCollectMapper.selByUidPid(uid, pid);
	}

	@Override
	public int delCollectById(int id) {
		return myCollectMapper.delById(id);
	}

}
