package com.dmu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dmu.mapper.UserMapper;
import com.dmu.pojo.User;
import com.dmu.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper userMapper;
	@Override
	public int insUserRegister(User user) {
		return userMapper.insUser(user);
	}
	@Override
	public User selcheckedUserLogin(User user) {
		return userMapper.selUser(user);
	}
	@Override
	public int updUserPayMoney(double price, int buyId, int sellId) {
		int index = userMapper.updUserBalance(price, sellId);
		index += userMapper.updUserBalance(-price, buyId);
		return index;
	}
	@Override
	public int updUserInfo(User user) {
		return userMapper.updUserById(user);
	}
	@Override
	public int updUserPwd(User user) {
		return userMapper.upaUserPwdById(user);
	}
	@Override
	public User selUserBySno(String sno) {
		return userMapper.selUserBySno(sno);
	}
	@Override
	public int updUserRecharge(double price, int uid) {
		return userMapper.updUserBalance(price, uid);
	}
	
}
