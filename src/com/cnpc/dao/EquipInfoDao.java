package com.cnpc.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.cnpc.bean.Equipmentinfo;
import com.cnpc.utils.ExcelReader;

public class EquipInfoDao extends JdbcDaoSupport {
	private static ApplicationContext ac;
	private static ProxoolDataSource template ;
	private Connection conn = null;
	private Statement stmt = null;
	
	static{
		ac = new FileSystemXmlApplicationContext("classpath:applicationContext.xml"); 
		template = (ProxoolDataSource) ac.getBean("dataSource");
	}
	
	public List<Equipmentinfo> getEquipInfo(String type,int page)
	{
		List<Equipmentinfo> equipLs = new ArrayList<Equipmentinfo>();
//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		try {
			conn = template.getConnection();
			stmt = conn.createStatement();
			String sql = "select area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes from equipments where type = "+type+" order by exp_date asc";//+"  limit "+10*(page-1)+","+10*page
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
	
	
	public void readExcel2DB(){
		boolean flag = false;
		int [] result;
		ExcelReader er = new ExcelReader();
		File f = new File("E:\\project1\\info.xls");
		List<List<Object>> params = er.readExcel2DB(f);
		String area = "";
		int type = 0;
		String lastDepartment = "";
		
		try {
			conn = template.getConnection();
			String sql = "insert into equipments (type,area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes) values (?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			if(params!=null&&!params.isEmpty())
			{
				for (int i =0;i<params.size();i++)
				{
					if(params.get(i).get(0).equals("类型"))
					{
						type = 1;//(String)params.get(i).get(1)
						area = (String)params.get(i).get(3);
						continue;
					}
					if(i==1) continue;
					
					pstmt.setObject(1, type);
					pstmt.setObject(2, area);
					if(params.get(i).get(0).equals("")&&!lastDepartment.equals(""))
					{
						//TODO return false;
					}else{
						lastDepartment = (String)params.get(i).get(0);
//						pstmt.setObject(2, lastDepartment);
					}
					pstmt.setObject(3, lastDepartment);
					for(int index = 4;index<=params.get(i).size()+2;index++)
					{
						pstmt.setObject(index, params.get(i).get(index-3));
						System.out.println(index+""+params.get(i).get(index-3));
					}
					pstmt.addBatch();
				}
			}
			result = pstmt.executeBatch();
			//check the result
			for(int i = 0;i<result.length;i++)
			{
				if(result[i]<0)
				{
					flag = false;
				}
			}
			if(flag)
				conn.commit();
			System.out.print(flag);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void testDao()
	{
		String sql = "select 1";
		List<Map<String, Object>> a = this.getJdbcTemplate().queryForList(sql);
		System.out.print(a);
		
	}
	
	
	public static void main(String [] args)
	{
		System.out.println();
	}
}
