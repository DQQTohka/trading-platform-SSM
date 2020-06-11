package com.dmu.service;

import com.dmu.pojo.User;

public interface UserService {
	int insUserRegister(User user);
	
	User selcheckedUserLogin(User user);
	
	/**
	 * 用户支付金钱
	 * @param price 商品价格
	 * @param buyId 购买用户id
	 * @param sellId 出售用户id
	 * @return
	 */
	int updUserPayMoney(double price, int buyId, int sellId);
	
	/**
	 * 更改基本用户信息
	 * @param user
	 * @return
	 */
	int updUserInfo(User user);
	
	/**
	 * 更改用户密码
	 * @param user
	 * @return
	 */
	int updUserPwd(User user);
	
	/**
	 * 用户账号
	 * @param sno
	 * @return
	 */
	User selUserBySno(String sno);
	
	/**
	 * 
	 * @param price 充值的金额
	 * @param uid	用户id
	 * @return
	 */
	int updUserRecharge(double price, int uid);
}
