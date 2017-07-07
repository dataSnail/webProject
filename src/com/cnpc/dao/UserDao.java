package com.cnpc.dao;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.cnpc.bean.Cataloginfo;
import com.cnpc.bean.Equipmentinfo;
import com.cnpc.bean.Userinfo;
import com.cnpc.utils.MD5Util;
import com.cnpc.utils.Utils;


public class UserDao extends JdbcDaoSupport{


	/**
	 * 检查用户名密码是否正确
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean checkUserAndPassword(String username,String password)
	{
		boolean result = false;
		String sql = "select count(0) as num from users where username = '"+username+"' and password = '"+MD5Util.MD5_Encode(password)+"'";
		List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(sql);
		if(Integer.parseInt(resLs.get(0).get("num")+"")==1){
			result = true;
			System.out.println(username+":验证成功！-->"+resLs.get(0).get("num"));
		}else{
			System.out.println(username+":验证失败！-->");
		}
		return result;
	}
	/**
	 * 获得用户信息
	 * @param username
	 * @return
	 */
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
	/**
	 * 添加用户
	 * @param userinfo
	 * @return
	 */
	public int addUser(Userinfo userinfo)
	{
		int result = -1;
		String[] prority = {"1","1","1","0","0"};//默认有设备管理、资产证照、过期设备查看权限，转由用户的地区信息控制显示
		if(userinfo.getPriority() != null)
		{
			
			for (String p : userinfo.getPriority()[0].split(","))
			{
				if(!Utils.checkNull(p)){
					prority[Integer.parseInt(p)] = "1";
				}
			}
		}
		String s = Arrays.toString(prority).replace(" ", "");
		String sql = "insert ignore into users(username,password,realname,area_id,priority,notes) values ('"+userinfo.getUsername()+"','"+MD5Util.MD5_Encode(userinfo.getPassword())+"','"+userinfo.getRealname()+"',"+userinfo.getAreaId()+",'"+s.substring(1,s.length()-1)+"','"+userinfo.getNotes()+"')";
		result = this.getJdbcTemplate().update(sql);
		return result;
	}
	/**
	 * 根据用户名，删除用户
	 * @param username
	 * @return
	 */
	public int deleteUser(String username){
		int result = -1;
		String sql = "delete from users where username = '"+username+"'";
		result = this.getJdbcTemplate().update(sql);
		return result;
	}	
	
	/**
	 * 查询过期提醒情况
	 * @param outDateAreaId
	 * @return
	 */
	public List<Map<String,Object>> getOutDateCount(String outDateAreaId)
	{
		List<Map<String,Object>> resultLs;
		String sqle = "SELECT outdate,count(0) as num FROM (SELECT CASE WHEN datediff(exp_date,NOW()) <= 30 THEN 'e30' WHEN  datediff(exp_date,NOW()) <= 60 THEN 'e60' ELSE 'e90' END as outdate FROM equipments WHERE datediff(exp_date,NOW()) <=90 ";
		String sqlc = "SELECT outdate,count(0) as num FROM (SELECT CASE WHEN datediff(exp_date,NOW()) <= 30 THEN 'c30' WHEN  datediff(exp_date,NOW()) <= 60 THEN 'c60' ELSE 'c90' END as outdate FROM certifications WHERE datediff(exp_date,NOW()) <=90 ";
				
		if(!"-1".equals(outDateAreaId)){
			sqle += " and area = '"+Utils.areaIdMapName.get(outDateAreaId)+"'";
			sqlc += " and area = '"+Utils.areaIdMapName.get(outDateAreaId)+"'";
		}
		sqle += " ) a GROUP BY outdate";
		sqlc += " ) a GROUP BY outdate";
		resultLs = this.getJdbcTemplate().queryForList(sqle);
		resultLs.addAll(this.getJdbcTemplate().queryForList(sqlc));
		
		return resultLs;
	}
	
	/**
	 * 查询用户权限信息
	 * @param username
	 * @return
	 */
	public String[] getPriorityByUser(String username)
	{
		String[] resultStr = new String[2];
		StringBuffer result = new StringBuffer();
		Map<String,Object> priorityMap = null;
		String prioritySql = "SELECT priority,area_id FROM users WHERE username = '"+username+"'";
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
			resultStr[0] = result.substring(0, result.length()-1);
		}
		resultStr[1] = priorityMap.get("area_id").toString();
		return resultStr;
	}
	
	
	/**
	 * 获得用户目录
	 * @param username
	 * @return
	 */
	public List<Cataloginfo> getCatalog(String username){
		List<Cataloginfo> catalogLs = new ArrayList<Cataloginfo>();
		String user_area = "";
		String sql = "select distinct area_id from users where username = '"+username+"'";
		user_area = this.getJdbcTemplate().queryForMap(sql).get("area_id").toString();
		//TODO user_area 可能为空？
		System.out.println("userarea : "+user_area);
		String catalogSql = "SELECT types_id,types,area_id,area,types_type_id,types_type FROM catalog ";
		if (!"-1".equals(user_area)){
			catalogSql += " WHERE area_id = "+user_area;
		}
		catalogSql += " ORDER BY types_id,area_id ASC";
		List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(catalogSql);
		for(Map<String,Object> res:resLs){
			Cataloginfo ci = new Cataloginfo();
			ci.setTypes_id(res.get("types_id")+"");
			ci.setTypes(res.get("types")+"");
			ci.setArea_id(res.get("area_id")+"");
			ci.setArea(res.get("area")+"");
			ci.setTypes_type_id(res.get("types_type_id")+"");
			ci.setTypes_type(res.get("types_type")+"");
			catalogLs.add(ci);
		} 
		return catalogLs;
	}
	
	/**
	 * 
	 * @param username
	 * @param newpassword
	 * @return
	 */
	public int updateUserPasswordByUsername(String username,String newpassword){
		int result = -1;
		if(Utils.checkNull(username)) return result;
		String sql = "update users set password = '"+MD5Util.MD5_Encode(newpassword)+"' where username = '"+username+"'";
		result = this.getJdbcTemplate().update(sql);
		return result;
	}
	
	/**
	 * 初始化地区列表
	 * @return
	 */
	public Map<String,String> initAreaID()
	{
		String sql = "SELECT DISTINCT area_id,area FROM catalog";
		Map<String,Object> areaMap = this.getJdbcTemplate().queryForMap(sql);
		
		System.out.println("initAreaID");
		return null;
		
	}
	
	public static void main(String [] args)
	{
		String[] prority = {"0","0","0","0","0"};
		String s = Arrays.toString(prority);
		System.out.println(s.substring(1,s.length()-1));
	}
	
}
