package com.cnpc.action;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.cnpc.dao.UserDao;
import com.cnpc.filters.SpringInit;
import com.cnpc.utils.Utils;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String result = "";
	private String userName = null;
	private String passWord = null;
	private UserDao userDao = (UserDao) SpringInit.getApplicationContext().getBean("userDao");
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String loginProcess()
	{
		System.out.println("login");
		return SUCCESS;
	}
	
	public String userLogin()
	{
		String userName = this.getUserName();
		String passWord = this.getPassWord();
		if(userDao.checkUserAndPassword(userName, passWord)) 
		{
			HttpServletRequest request = ServletActionContext.getRequest();
			request.getSession().setAttribute("username", userName);
			//获得过期提醒信息
			List<Map<String,Object>> result = userDao.getOutDateCount();
			
			for(Map<String,Object> remap : result)
			{
				request.getSession().setAttribute(remap.get("outdate")+"", remap.get("num")+"");
			}
			
			//获得用户权限信息
			String userPriorityStr = userDao.getPriorityByUser(userName);
			request.getSession().setAttribute("priorityStr", userPriorityStr);
			
			return SUCCESS;
		}else{
			result = "用户名或密码错误！";
			return ERROR;
		}
	}
	
	public String userLogout()
	{
		String userName = this.getUserName();
		System.out.println(userName+"登出！");
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().removeAttribute(userName);
		request.getSession().removeAttribute("priorityStr");
		request.getSession().removeAttribute("result");
		return SUCCESS;
	}
	
}
