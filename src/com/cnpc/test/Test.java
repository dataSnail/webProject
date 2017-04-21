package com.cnpc.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Test {
//	public void tt() throws ClassNotFoundException, SQLException{
//		Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
//		Connection con = DriverManager.getConnection("proxool.aaa:com.mysql.jdbc.Driver:jdbc:mysql://223.3.75.216:3306/tim","root","root@123");
//		Statement stmt = con.createStatement();
//		ResultSet l = stmt.executeQuery("select * from comment");
//		System.out.println(l);
//	}
	
	public static void main(String [] args) throws ClassNotFoundException, SQLException{
		ApplicationContext ac = new FileSystemXmlApplicationContext("src/applicationContext.xml"); 
		ProxoolDataSource template = (ProxoolDataSource) ac.getBean("dataSource");
		Connection conn = template.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet res = stmt.executeQuery("select * from equipments");
		while(res.next()){
			String  a = res.getString("id");
			System.out.println(a);
		}
		stmt.close();
		conn.close();
		
		
	}
}
