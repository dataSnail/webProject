package com.cnpc.action;

import java.util.List;

import com.cnpc.bean.Userinfo;
import com.cnpc.dao.UserDao;
import com.cnpc.filters.SpringInit;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDao userDao = (UserDao) SpringInit.getApplicationContext().getBean("userDao");
	private String type="";
	List<Userinfo> userinfoLs;
	Userinfo userinfo;
	
	public List<Userinfo> getUserinfoLs() {
		return userinfoLs;
	}

	public void setUserinfoLs(List<Userinfo> userinfoLs) {
		this.userinfoLs = userinfoLs;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String userInfo()
	{
		this.setUserinfoLs(userDao.getUserinfo(null));
		return SUCCESS;
	}
	
	public Userinfo getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public String addUser()
	{
		System.out.println("添加用户！");
		
		if(this.getUserinfo()!=null){
			userDao.addUser(this.getUserinfo());
		}
		return SUCCESS;
	}
	
	public String deleteUser()
	{
		return SUCCESS;
	}
	
	public String updateUser()
	{
		return SUCCESS;
	}
	
}
