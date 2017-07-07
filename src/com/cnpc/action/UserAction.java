package com.cnpc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

import com.cnpc.bean.Userinfo;
import com.cnpc.dao.OperationLogDao;
import com.cnpc.dao.UserDao;
import com.cnpc.filters.SpringInit;
import com.cnpc.utils.Utils;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDao userDao = (UserDao) SpringInit.getApplicationContext().getBean("userDao");
	private OperationLogDao LogDao = (OperationLogDao) SpringInit.getApplicationContext().getBean("logDao");
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

	public String addUserAPI()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);
		String userName = (String) request.getSession().getAttribute("username");
		userinfo = this.getUserinfo();
		int result = userDao.addUser(this.getUserinfo());
		jsonObj.put("status", result);//更新状态标记
		Object[] obj = {userName,"添加用户："+(result>0?"成功":"失败"),userinfo.getUsername()};
		LogDao.insertLog(obj);
		jsonResult = jsonObj;
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
	/**
	 * 更新用户信息(密码修改)
	 * status: -1:错误；-2密码错误；1：修改成功
	 * @return
	 */
	public String updateUserAPI(){
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		userinfo = this.getUserinfo();
		System.out.println("id::::"+userinfo.getUsername());
		//检查用户名密码是否正确
		if(userDao.checkUserAndPassword(userinfo.getUsername(),userinfo.getPassword())){
			String new_password = this.getNewpassword();
			int result = userDao.updateUserPasswordByUsername(userinfo.getUsername(),new_password);
			jsonObj.put("status", result);//更新状态标记
			Object[] obj = {userinfo.getUsername(),"修改密码："+(result>0?"成功":"失败"),userinfo.getUsername()};
			LogDao.insertLog(obj);
			//退出此用户
			request.getSession().removeAttribute("username");
			request.getSession().removeAttribute("priorityStr");
			request.getSession().removeAttribute("result");
		}else{
			jsonObj.put("status", -2);//密码错误
		}
		jsonResult = jsonObj;
		return SUCCESS;
	}
	
	/**
	 * 删除用户
	 * @return
	 */
	public String deleteUserAPI(){
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		HttpServletRequest request = ServletActionContext.getRequest();
		String userName = (String) request.getSession().getAttribute("username");
		userinfo = this.getUserinfo();
		if(!Utils.checkNull(userName)&&!Utils.checkNull(userinfo.getUsername())){
			int result = userDao.deleteUser(userinfo.getUsername());
//			System.out.println(userinfo.getUsername());
			Object[] obj = {userName,"删除用户："+(result>0?"成功":"失败"),userinfo.getUsername()};
			LogDao.insertLog(obj);
			jsonObj.put("status", result);//更新状态标记
		}
		jsonResult = jsonObj;
		return SUCCESS;
	}
	/**
	 * 重置用户密码
	 * @return
	 */
	public String resetPasswordAPI(){
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		String userName = (String) request.getSession().getAttribute("username");//操作用户名
		userinfo = this.getUserinfo();
		if(!Utils.checkNull(userName)&&!Utils.checkNull(userinfo.getUsername())){
			int result = userDao.updateUserPasswordByUsername(userinfo.getUsername(),"123456");
//			System.out.println(userinfo.getUsername());
			Object[] obj = {userName,"重置密码："+(result>0?"成功":"失败"),userinfo.getUsername()};
			LogDao.insertLog(obj);
			jsonObj.put("status", result);//更新状态标记
		}
		jsonResult = jsonObj;
		return SUCCESS;
	}
}
