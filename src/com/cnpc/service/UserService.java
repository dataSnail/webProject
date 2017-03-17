package com.cnpc.service;

import java.util.List;

import com.cnpc.bean.Userinfo;

public interface UserService {

	/*
	 * 根据页码获得用户信息
	 */
	List<Userinfo> getUserInfoList(int page);
	/*
	 * 添加用户信息
	 */
	String addUser(Userinfo userinfo);
	/*
	 * 根据用户ID删除用户
	 */
	String deleteUser(String userId);
	/*
	 * 编辑用户信息
	 */
	String editUser(Userinfo userinfo);
	/*
	 * 
	 */
	String getUserInfoByName(String username);
}
