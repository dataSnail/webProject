package com.cnpc.action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String result = "";
	private String userName = null;
	private String passWord = null;
	
	
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
		if("admin".equals(userName)&&"admin".equals(passWord)) 
		{
			HttpServletRequest request = ServletActionContext.getRequest();
			request.getSession().setAttribute("username", userName); 
			return SUCCESS;
		}else{
			result = "用户名或密码错误！";
			return ERROR;
		}
	}
	
	
}
