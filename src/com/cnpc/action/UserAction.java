package com.cnpc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

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
	private JSONObject jsonResult;
	private String newpassword;
	
	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public JSONObject getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(JSONObject jsonResult) {
		this.jsonResult = jsonResult;
	}

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
	
	public String updateAPI(){
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		userinfo = this.getUserinfo();
		System.out.println("id::::"+userinfo.getUsername());
		//检查用户名密码是否正确
		if(userDao.checkUserAndPassword(userinfo.getUsername(),userinfo.getPassword())){
			String new_password = this.getNewpassword();
			int result = userDao.updateUserPasswordByUsername(userinfo.getUsername(),new_password);
			jsonObj.put("status", result);//更新状态标记
			
			//退出此用户
			HttpServletRequest request = ServletActionContext.getRequest();
			request.getSession().removeAttribute("username");
			request.getSession().removeAttribute("priorityStr");
			request.getSession().removeAttribute("result");
		}else{
			jsonObj.put("status", -2);//密码错误
		}
		jsonResult = jsonObj;
		return SUCCESS;
	}
	
	
}
