package com.cnpc.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.cnpc.bean.Cataloginfo;
import com.cnpc.bean.Certificationinfo;
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
		String sqle = "SELECT outdate,count(0) as num FROM (SELECT CASE WHEN datediff(exp_date,NOW()) <= 30 THEN 'e30' WHEN  datediff(exp_date,NOW()) <= 60 THEN 'e60' ELSE 'e90' END as outdate FROM equipments WHERE datediff(exp_date,NOW()) <=90 and out_date_flag = 0 ";
		String sqlc = "SELECT outdate,count(0) as num FROM (SELECT CASE WHEN datediff(exp_date,NOW()) <= 30 THEN 'c30' WHEN  datediff(exp_date,NOW()) <= 60 THEN 'c60' ELSE 'c90' END as outdate FROM certifications WHERE datediff(exp_date,NOW()) <=90 and out_date_flag = 0 ";
				
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
	
	public List<Map<String,Object>> getEquipStatistic(String areaId){
		List<Map<String,Object>> resultLs;
		List<Map<String,Object>> typeLs;
		String areaSql = "select distinct type from equipments where 1=1";
		String sql = "SELECT area,type,count(0) as num from equipments where 1=1";
		StringBuffer sb = new StringBuffer("SELECT area,");
		if(!"-1".equals(areaId)){
			sql += " and area = '"+Utils.areaIdMapName.get(areaId)+"'";
			areaSql += " and area = '"+Utils.areaIdMapName.get(areaId)+"'";
		}
		sql += " GROUP BY area,type ORDER BY area,type DESC";
		
		typeLs = this.getJdbcTemplate().queryForList(areaSql);
		
		if(typeLs!=null){
			for(Map<String,Object> item:typeLs){
				sb.append("sum(CASE WHEN type = ");
				sb.append(item.get("type"));
				sb.append(" THEN num ELSE 0 END) as '");
				if(!"-1".equals(item.get("type")+"")){
					sb.append(Utils.equipCertiIdMapName.get(item.get("type")+"")+"',");
				}else{
					sb.append("未知类型',");
				}
			}
		}
		sb.deleteCharAt(sb.length()-1);
		sb.append(" FROM (");
		sb.append(sql);
		sb.append(") a GROUP BY area");
		
		resultLs = this.getJdbcTemplate().queryForList(sb.toString());
		return resultLs;
	}
	public List<Map<String,Object>> getCertifyStatistic(String areaId){
		List<Map<String,Object>> resultLs;
		List<Map<String,Object>> typeLs;
		String areaSql = "select distinct type from certifications where 1=1";
		String sql = "SELECT area,type,count(0) as num from certifications where 1=1";
		StringBuffer sb = new StringBuffer("SELECT area,");
		if(!"-1".equals(areaId)){
			sql += " and area = '"+Utils.areaIdMapName.get(areaId)+"'";
			areaSql += " and area = '"+Utils.areaIdMapName.get(areaId)+"'";
		}
		sql += " GROUP BY area,type ORDER BY area,type DESC";
		
		typeLs = this.getJdbcTemplate().queryForList(areaSql);
		
		if(typeLs!=null){
			for(Map<String,Object> item:typeLs){
				sb.append("sum(CASE WHEN type = ");
				sb.append(item.get("type"));
				sb.append(" THEN num ELSE 0 END) as '");
				if(!"-1".equals(item.get("type")+"")){
					sb.append(Utils.equipCertiIdMapName.get(item.get("type")+"")+"',");
				}else{
					sb.append("未知类型',");
				}
			}
		}
		sb.deleteCharAt(sb.length()-1);
		sb.append(" FROM (");
		sb.append(sql);
		sb.append(") a GROUP BY area");
		
		resultLs = this.getJdbcTemplate().queryForList(sb.toString());
		return resultLs;
	}
	
	
	
	public JSONObject getECDistribution(String outDateAreaId){
		List<Map<String,Object>> resultLs_e;
		List<Map<String,Object>> resultLs_c;
		JSONObject jsonResult = new JSONObject();
		JSONArray jsonData_e = new JSONArray();
		JSONArray jsonData_c = new JSONArray();
		String sqle = "SELECT outdate,count(0) as num FROM (SELECT CASE WHEN datediff(exp_date,NOW()) <= 30 and out_date_flag = 0 THEN '30天过期设备' WHEN  datediff(exp_date,NOW()) <= 60 and out_date_flag = 0 THEN '60天过期设备' WHEN datediff(exp_date,NOW()) <=90 and out_date_flag = 0 THEN '90天过期设备' ELSE '正常设备' END as outdate FROM equipments WHERE 1=1 ";
		String sqlc = "SELECT outdate,count(0) as num FROM (SELECT CASE WHEN datediff(exp_date,NOW()) <= 30 and out_date_flag = 0 THEN '30天过期证书' WHEN  datediff(exp_date,NOW()) <= 60 and out_date_flag = 0 THEN '60天过期证书' WHEN datediff(exp_date,NOW()) <=90 and out_date_flag = 0 THEN '90天过期证书' ELSE '正常证书' END as outdate FROM certifications WHERE 1=1 ";
		if(!"-1".equals(outDateAreaId)){
			sqle += " and area = '"+Utils.areaIdMapName.get(outDateAreaId)+"'";
			sqlc += " and area = '"+Utils.areaIdMapName.get(outDateAreaId)+"'";
		}
		sqle += " ) a GROUP BY outdate";
		sqlc += " ) a GROUP BY outdate";
		
		resultLs_e = this.getJdbcTemplate().queryForList(sqle);
		resultLs_c = this.getJdbcTemplate().queryForList(sqlc);
		for(Map<String,Object> item : resultLs_e){
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("value", item.get("num")+"");
			jsonObj.put("name", item.get("outdate")+"");
			jsonData_e.add(jsonObj);
		}
		for(Map<String,Object> item : resultLs_c){
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("value", item.get("num")+"");
			jsonObj.put("name", item.get("outdate")+"");
			jsonData_c.add(jsonObj);
		}
		jsonResult.put("category", "['30天过期','60天过期','90天过期','正常']");
		jsonResult.put("datae", jsonData_e);
		jsonResult.put("datac", jsonData_c);
		return jsonResult;
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
	
	public List<Cataloginfo> getEquipCertiStr(String userName){
		List<Cataloginfo> catalogLs = new ArrayList<Cataloginfo>();
		String user_area = "";
		String sql = "select distinct area_id from users where username = '"+userName+"'";
		user_area = this.getJdbcTemplate().queryForMap(sql).get("area_id").toString();
		String catalogSql = "SELECT distinct types,types_type_id,types_type FROM catalog ";
		if (!"-1".equals(user_area)){
			catalogSql += " WHERE area_id = "+user_area;
		}
		List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(catalogSql);
		for(Map<String,Object> res:resLs){
			Cataloginfo ci = new Cataloginfo();
			ci.setTypes(res.get("types")+"");
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
	
	public List<Equipmentinfo> getSpeEquipInfo(String area_id){
		List<Equipmentinfo> equipLs = new ArrayList<Equipmentinfo>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String sql = "select id,type,area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,out_date_flag,notes from equipments where out_date_flag=1 ";
		if(!"-1".equals(area_id)){
			sql += " and area = '"+Utils.areaIdMapName.get(area_id)+"' ";
		}
		try{
			List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(sql);
			for(Map<String,Object> res:resLs){
				Equipmentinfo ei = new Equipmentinfo();
				ei.setId(res.get("id")+"");
				ei.setTypeName(Utils.equipCertiIdMapName.get(res.get("type")+""));
				ei.setArea(res.get("area")+"");
				ei.setDepartment(res.get("department")+"");
				ei.setRoomId(res.get("room")+"");
				ei.setSpecification(res.get("specification")+"");
				ei.setLabel(res.get("label")+"");
				ei.setLocation(res.get("location")+"");
				ei.setExp_date(df.parse(res.get("exp_date")+""));
				ei.setResponsible_dep(res.get("responsible_dep")+"");
				ei.setResponsible_person(res.get("responsible_person")+"");
				ei.setPerson_pic(res.get("person_pic")+"");
				ei.setOutDateFlag(res.get("out_date_flag")+"");
				ei.setNote(res.get("notes")+"");
				ei.setStatus(Double.toString(Math.ceil((ei.getExp_date().getTime()-now.getTime())/(24*60*60*1000.0))));
				equipLs.add(ei);
			}
		}catch (ParseException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return equipLs;
	}
	public List<Certificationinfo> getSpeCertification(String area_id){
		List<Certificationinfo> certifyLs = new ArrayList<Certificationinfo>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String sql = "select id,type,area,department,name,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,out_date_flag,notes from certifications where out_date_flag=1 ";
		if(!"-1".equals(area_id)){
			sql += " and area = '"+Utils.areaIdMapName.get(area_id)+"' ";
		}
		try{
			List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(sql);
			for(Map<String,Object> res:resLs){
				Certificationinfo ci = new Certificationinfo();
				ci.setId(res.get("id")+"");
				ci.setTypeName(Utils.equipCertiIdMapName.get(res.get("type")+""));
				ci.setArea(res.get("area")+"");
				ci.setDepartment(res.get("department")+"");
				ci.setName(res.get("name")+"");
				ci.setSpecification(res.get("specification")+"");
				ci.setLabel(res.get("label")+"");
				ci.setLocation(res.get("location")+"");
				ci.setExp_date(df.parse(res.get("exp_date")+""));
				ci.setResponsible_dep(res.get("responsible_dep")+"");
				ci.setResponsible_person(res.get("responsible_person")+"");
				ci.setPerson_pic(res.get("person_pic")+"");
				ci.setOutDateFlag(res.get("out_date_flag")+"");
				ci.setNote(res.get("notes")+"");
				ci.setStatus(Double.toString(Math.ceil((ci.getExp_date().getTime()-now.getTime())/(24*60*60*1000.0))));
				certifyLs.add(ci);
			}
		}catch (ParseException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return certifyLs;
	}
	
	
	public static void main(String [] args)
	{
		String[] prority = {"0","0","0","0","0"};
		String s = Arrays.toString(prority);
		System.out.println(s.substring(1,s.length()-1));
	}
	
}
