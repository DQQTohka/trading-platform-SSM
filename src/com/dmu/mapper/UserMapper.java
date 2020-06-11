package com.dmu.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.dmu.pojo.User;

public interface UserMapper {
	/**
	 * 插入一个用户
	 * @param user
	 * @return
	 */
	@Insert("insert into user values(default,#{sno},#{password},#{clazz},#{address},#{username},#{sex},#{question},#{answer},5000,default)")
	int insUser(User user);
	/**
	 * 通过sno和password选择一个用户
	 * @param user
	 * @return
	 */
	@Select("select * from user where sno=#{sno} and password=#{password}")
	User selUser(User user);
	/**
	 * 通过id查询用户
	 */
	@Select("select * from user where id=#{0}")
	User selUserByUid(int uid);
	
	/**
	 * 通过用户id更新用户余额
	 */
	@Update("update user set balance=balance+#{0} where id=#{1}")
	int updUserBalance(double price, int id);
	
	/**
	 * 通过用户id更改用户基本信息
	 * @param user
	 * @return
	 */
	int updUserById(User user);
	
	/**
	 * 通过id更改用户密码
	 * @param user
	 * @return
	 */
	@Update("update user set password=#{password} where id=#{id}")
	int upaUserPwdById(User user);
	
	/**
	 * 通过sno查询用户
	 */
	@Select("select * from user where sno=#{0}")
	User selUserBySno(String sno);
	
	
}
