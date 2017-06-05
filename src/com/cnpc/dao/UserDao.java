package com.cnpc.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.cnpc.bean.Userinfo;
import com.cnpc.utils.MD5Util;
import com.cnpc.utils.Utils;


public class UserDao extends JdbcDaoSupport{


	
	public boolean checkUserAndPassword(String username,String password)
	{
		boolean result = false;
		String sql = "select count(0) as num from users where username = '"+username+"' and password = '"+MD5Util.MD5_Encode(password)+"'";
		List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(sql);
		if(Integer.parseInt(resLs.get(0).get("num")+"")==1){
			result = true;
			System.out.println(username+":登录成功！-->"+resLs.get(0).get("num"));
		}else{
			System.out.println(username+":登录失败！-->");
		}
		return result;
	}
	
	public List<Userinfo> getUserinfo(String username)
	{
		String sql = "select username,realname,priority,notes from users";
		if (!Utils.checkNull(username))
		{
			sql += " where username = "+username;
		}
		List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(sql);
		List<Userinfo> userinfoLs = new ArrayList<Userinfo>(); 
		for (Map<String,Object> result : resLs){
			Userinfo userinfo = new Userinfo();
			userinfo.setUsername(result.get("username")+"");
			userinfo.setRealname(result.get("realname")+"");
			userinfo.setPriority(result.get("priority").toString().split(","));
			userinfo.setNotes(result.get("notes")+"");
			userinfoLs.add(userinfo);
		}
		return userinfoLs;
	}
	
	public boolean addUser(Userinfo userinfo)
	{
		boolean result = false;
		String[] prority = {"0","0","0","0","0"};
		if(userinfo.getPriority() != null)
		{
			for (String p : userinfo.getPriority())
			{
				prority[Integer.parseInt(p)] = "1";
			}
		}
		String s = Arrays.toString(prority).replace(" ", "");
		String sql = "insert ignore into users(username,password,realname,priority,notes) values ('"+userinfo.getUsername()+"','"+MD5Util.MD5_Encode(userinfo.getPassword())+"','"+userinfo.getRealname()+"','"+s.substring(1,s.length()-1)+"','"+userinfo.getNotes()+"')";
		int res = this.getJdbcTemplate().update(sql);
		if (res == 1) result = true;
		return result;
	}
	
	//查询过期提醒情况
	public List<Map<String,Object>> getOutDateCount()
	{
		List<Map<String,Object>> resultLs;
		String sqle = "SELECT outdate,count(0) as num FROM (SELECT CASE WHEN datediff(exp_date,NOW()) <= 30 THEN 'e30' WHEN  datediff(exp_date,NOW()) <= 60 THEN 'e60' ELSE 'e90' END as outdate FROM equipments WHERE datediff(exp_date,NOW()) <=90 ) a GROUP BY outdate";
		String sqlc = "SELECT outdate,count(0) as num FROM (SELECT CASE WHEN datediff(exp_date,NOW()) <= 30 THEN 'c30' WHEN  datediff(exp_date,NOW()) <= 60 THEN 'c60' ELSE 'c90' END as outdate FROM certifications WHERE datediff(exp_date,NOW()) <=90 ) a GROUP BY outdate";
		
		resultLs = this.getJdbcTemplate().queryForList(sqle);
		resultLs.addAll(this.getJdbcTemplate().queryForList(sqlc));
		
		return resultLs;
	}
	
	//查询用户权限信息
	public String getPriorityByUser(String username)
	{
		String resultStr = "";
		StringBuffer result = new StringBuffer();
		Map<String,Object> priorityMap = null;
		String prioritySql = "SELECT priority FROM users WHERE username = '"+username+"'";
		priorityMap = this.getJdbcTemplate().queryForMap(prioritySql);
		String [] priorityLs = priorityMap.get("priority").toString().split(",");
		for (int i = 0;i < priorityLs.length;i++)
		{
			if ("0".equals(priorityLs[i]))//存放不应该访问的url
			{
				result.append(Utils.priorityMap.get(i+"")+",");
			}
		}
		if(result.length() > 1)
		{
			resultStr = result.substring(0, result.length()-1);
		}
		return resultStr;
	}
	
	
	public static void main(String [] args)
	{
		String[] prority = {"0","0","0","0","0"};
		String s = Arrays.toString(prority);
		System.out.println(s.substring(1,s.length()-1));
	}
	
}
