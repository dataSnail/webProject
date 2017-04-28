package com.cnpc.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.cnpc.bean.Equipmentinfo;

public class OutDateDao extends JdbcDaoSupport{

	public List<Equipmentinfo> getOutDateInfo(String timeType,String type)
	{
		List<Equipmentinfo> equipLs = new ArrayList<Equipmentinfo>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String sql;
		try {
			
			if ("0".equals(type))
			{
				sql = "select area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes from equipments";
			}else if ("1".equals(type))
			{
				sql = "select area,department,name,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes from certifications"; 
			}else{
				return equipLs;//返回空
			}
			if(timeType.equals("0"))//过期
			{
				 sql += " where datediff(exp_date,NOW()) <= 0";
			}else if(timeType.equals("1"))//七天内过期
			{
				sql += " where datediff(exp_date,NOW()) > 0 and datediff(exp_date,NOW()) <= 7 ";
			}else if(timeType.equals("2")){
				sql += " where datediff(exp_date,NOW()) > 7 and datediff(exp_date,NOW()) <= 30 ";
			}else if (timeType.equals("3")){
				sql += " where datediff(exp_date,NOW()) <= 0 ";
			}
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
