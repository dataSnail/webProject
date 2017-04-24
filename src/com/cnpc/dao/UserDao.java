package com.cnpc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class UserDao {

	private static ApplicationContext ac;
	private static ProxoolDataSource template ;
	private Connection conn = null;
	private Statement stmt = null;
	
	static{
		ac = new FileSystemXmlApplicationContext("classpath:applicationContext.xml"); 
		template = (ProxoolDataSource) ac.getBean("dataSource");
	}
	
	public Map<String,Integer> getOutDateStatistic()
	{
		Map<String,Integer> statisticResult = null;
		try {
			conn = template.getConnection();
			stmt = conn.createStatement();
			String sql = "";
			ResultSet res = stmt.executeQuery(sql);
			while(res.next()){
				//TODO
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
		return statisticResult;
	}
	
}
