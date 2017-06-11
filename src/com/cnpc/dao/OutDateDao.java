package com.cnpc.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.cnpc.bean.Certificationinfo;
import com.cnpc.bean.Equipmentinfo;
import com.cnpc.utils.Utils;

public class OutDateDao extends JdbcDaoSupport{

	public List<Equipmentinfo> getOutDateInfo(String timeType,String type,String outdate,String area,String department)
	{
		List<Equipmentinfo> equipLs = new ArrayList<Equipmentinfo>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String sql;
		try {
			//查询设备
			if ("0".equals(type))
			{
				sql = "select area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes from equipments where 1=1 ";
			}else if ("1".equals(type))//查询证书
			{
				sql = "select area,department,name,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes from certifications where 1=1 "; 
			}else{
				return equipLs;//返回空
			}
			//时间限制
			if(timeType.equals("0"))//30过期
			{
				 sql += " and datediff(exp_date,NOW()) <= 30 ";
			}else if(timeType.equals("1"))//60天内过期
			{
				sql += " and datediff(exp_date,NOW()) > 30 and datediff(exp_date,NOW()) <= 60 ";
			}else if(timeType.equals("2")){//90天过期
				sql += " and datediff(exp_date,NOW()) > 60 and datediff(exp_date,NOW()) <= 90 ";
			}else if (timeType.equals("3")){//自定义
				if(!Utils.checkNull(outdate)){
					sql += " and exp_date <= '"+outdate+"' ";
				}
				if(!Utils.checkNull(department)){
					sql += " and department like '%"+department+"%' ";
				}
			}
			if(!Utils.checkNull(area)){
				if(!"-1".equals(area))//管理员
					sql += " and area = '"+Utils.areaIdMapName.get(area)+"' ";
			}
			sql += " order by exp_date asc";
			
			List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(sql);
			for(Map<String,Object> res:resLs){
				Equipmentinfo ei = new Equipmentinfo();
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
				ei.setNote(res.get("notes")+"");
				ei.setStatus(Double.toString(Math.ceil((ei.getExp_date().getTime()-now.getTime())/(24*60*60*1000.0))));
				equipLs.add(ei);
			}
		} catch (ParseException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return equipLs;

	}
	
	
	public List<Certificationinfo> getCertification(String timeType,String outdate,String area,String department)
	{
		List<Certificationinfo> certifyLs = new ArrayList<Certificationinfo>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String sql = "select area,department,name,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes from certifications where 1=1 "; 
		try {
			//时间限制
			if(timeType.equals("0"))//30过期
			{
				 sql += " and datediff(exp_date,NOW()) <= 30 ";
			}else if(timeType.equals("1"))//60天内过期
			{
				sql += " and datediff(exp_date,NOW()) > 30 and datediff(exp_date,NOW()) <= 60 ";
			}else if(timeType.equals("2")){//90天过期
				sql += " and datediff(exp_date,NOW()) > 60 and datediff(exp_date,NOW()) <= 90 ";
			}else if (timeType.equals("3")){//自定义
				if(!Utils.checkNull(outdate)){
					sql += " and exp_date <= '"+outdate+"' ";
				}
				if(!Utils.checkNull(department)){
					sql += " and name like '%"+department+"%' ";
				}
			}
			if(!Utils.checkNull(area)){
				if(!"-1".equals(area))//管理员
					sql += " and area = '"+Utils.areaIdMapName.get(area)+"' ";
			}
			sql += " order by exp_date asc";
			
			List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(sql);
			for(Map<String,Object> res:resLs){
				Certificationinfo ci = new Certificationinfo();
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
				ci.setNote(res.get("notes")+"");
				ci.setStatus(Double.toString(Math.ceil((ci.getExp_date().getTime()-now.getTime())/(24*60*60*1000.0))));
				certifyLs.add(ci);
			}
		} catch (ParseException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return certifyLs;

	}
	
	
	public int getTest(){
		List<Map<String,Object>> aa = this.getJdbcTemplate().queryForList("select * from equipments");
		
		for(Map<String,Object> a:aa){
			System.out.println(a.get("id"));
		}
		return 0;
	}
	
	
	
	public static void main(String [] args)
	{
		System.out.println();
	}
}
