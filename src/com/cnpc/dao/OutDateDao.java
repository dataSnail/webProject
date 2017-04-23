package com.cnpc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.cnpc.bean.Equipmentinfo;

public class OutDateDao {
	private static ApplicationContext ac;
	private static ProxoolDataSource template ;
	private Connection conn = null;
	private Statement stmt = null;
	
	static{
		ac = new FileSystemXmlApplicationContext("classpath:applicationContext.xml"); 
		template = (ProxoolDataSource) ac.getBean("dataSource");
	}
	
	public List<Equipmentinfo> getOutDateInfo(String outdateTime)
	{
		List<Equipmentinfo> equipLs = new ArrayList<Equipmentinfo>();
		try {
			conn = template.getConnection();
			stmt = conn.createStatement();
			String sql = "select area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes from equipments where datediff(exp_date,NOW())<"+outdateTime;
			ResultSet res = stmt.executeQuery(sql);
			while(res.next()){
				Equipmentinfo ei = new Equipmentinfo();
				ei.setArea(res.getString("area"));
				ei.setDepartment(res.getString("department"));
				ei.setRoomId(res.getString("room"));
				ei.setSpecification(res.getString("specification"));
				ei.setLabel(res.getString("label"));
				ei.setLocation(res.getString("location"));
				ei.setExp_date(res.getDate("exp_date"));
				ei.setResponsible_dep(res.getString("responsible_dep"));
				ei.setResponsible_person(res.getString("responsible_person"));
				ei.setPerson_pic(res.getString("person_pic"));
				ei.setNote(res.getString("notes"));
				equipLs.add(ei);
			}
		} catch (SQLException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			if(stmt!=null)
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(conn!=null)
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return equipLs;

	}
	
	
	public static void main(String [] args)
	{
		System.out.println();
	}
}
