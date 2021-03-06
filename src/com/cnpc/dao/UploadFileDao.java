package com.cnpc.dao;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.cnpc.utils.ExcelReader;
import com.cnpc.utils.Utils;

public class UploadFileDao extends JdbcDaoSupport {
	
//	public List<Equipmentinfo> getEquipInfo(String type,int page)
//	{
//		List<Equipmentinfo> equipLs = new ArrayList<Equipmentinfo>();
//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		Date now = new Date();
//		try {
//			String sql = "select area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes from equipments where type = "+type+" order by exp_date asc";//+"  limit "+10*(page-1)+","+10*page
//			List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(sql);
//			for(Map<String,Object> res:resLs){
//				Equipmentinfo ei = new Equipmentinfo();
//				ei.setArea(res.get("area")+"");
//				ei.setDepartment(res.get("department")+"");
//				ei.setRoomId(res.get("room")+"");
//				ei.setSpecification(res.get("specification")+"");
//				ei.setLabel(res.get("label")+"");
//				ei.setLocation(res.get("location")+"");
//				ei.setExp_date(df.parse(res.get("exp_date")+""));
//				ei.setResponsible_dep(res.get("responsible_dep")+"");
//				ei.setResponsible_person(res.get("responsible_person")+"");
//				ei.setPerson_pic(res.get("person_pic")+"");
//				ei.setNote(res.get("notes")+"");
//				ei.setStatus(Double.toString(Math.ceil((ei.getExp_date().getTime()-now.getTime())/(24*60*60*1000.0))));
//				equipLs.add(ei);
//			}
//		} catch (ParseException  e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} 
//		return equipLs;
//
//	}
	
	public boolean readExcel2DB(String fileName,int type,String area_id){
		boolean flag = true;
		int [] result= null;
		ExcelReader er = new ExcelReader();
		File f = new File(fileName);
		final List<ArrayList<Object>> params = Utils.convertCParams(er.readExcel2DB(f),area_id);
		
		String sql = "insert into certifications (type,area,department,name,label,specification,location,exp_date,responsible_dep,responsible_person,person_pic,notes) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
//			this.getJdbcTemplate().getDataSource().getConnection().setAutoCommit(false);
			result = this.getJdbcTemplate().batchUpdate(sql, new BatchPreparedStatementSetter(){
		
				@Override
				public int getBatchSize() {
					// TODO Auto-generated method stub
					return params.size();
				}
		
				@Override
				public void setValues(PreparedStatement ps, int i)
						throws SQLException {
					
					ps.setString(1, params.get(i).get(0)+"");
					ps.setString(2, params.get(i).get(1)+"");
					ps.setString(3, params.get(i).get(2)+"");
					ps.setString(4, params.get(i).get(3)+"");
					ps.setString(5, params.get(i).get(4)+"");
					ps.setString(6, params.get(i).get(5)+"");
					ps.setString(7, params.get(i).get(6)+"");
					ps.setString(8, params.get(i).get(7)+"");
					ps.setString(9, params.get(i).get(8)+"");
					ps.setString(10, params.get(i).get(9)+"");
					ps.setString(11, params.get(i).get(10)+"");
					ps.setString(12, params.get(i).get(11)+"");
				}
				
			});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("readExcel2DB");
			e.printStackTrace();
		}
		//check the result
		if (result!=null){
			for(int i = 0;i<result.length;i++)
			{
				if(result[i]<0)
				{
					System.out.println(i);
					flag = false;
				}
			}			
		}else{
			flag = false;
		}

//		if(flag){
//			try {
//				this.getJdbcTemplate().getDataSource().getConnection().commit();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
		System.out.print(flag);
		return flag;
	}
	
	public boolean readExcel2DBC(String fileName,int type,String area_id){
		boolean flag = true;
		int [] result= null;
		ExcelReader er = new ExcelReader();
		File f = new File(fileName);
		final List<ArrayList<Object>> params = Utils.convertParams(er.readExcel2DB(f),area_id);
		String sql = "insert into equipments (type,area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
//			System.out.print(this.getJdbcTemplate());
//			this.getJdbcTemplate().getDataSource().getConnection().setAutoCommit(false);
			BatchPreparedStatementSetter bpss = new BatchPreparedStatementSetter(){
		
				@Override
				public int getBatchSize() {
					// TODO Auto-generated method stub
					System.out.println("params.size:"+params.size());
					return params.size();
				}
		
				@Override
				public void setValues(PreparedStatement ps, int i)
						throws SQLException {
					
					ps.setString(1, params.get(i).get(0)+"");
					ps.setString(2, params.get(i).get(1)+"");
					ps.setString(3, params.get(i).get(2)+"");
					ps.setString(4, params.get(i).get(3)+"");
					ps.setString(5, params.get(i).get(4)+"");
					ps.setString(6, params.get(i).get(5)+"");
					ps.setString(7, params.get(i).get(6)+"");
					ps.setString(8, params.get(i).get(7)+"");
					ps.setString(9, params.get(i).get(8)+"");
					ps.setString(10, params.get(i).get(9)+"");
					ps.setString(11, params.get(i).get(10)+"");
					ps.setString(12, params.get(i).get(11)+"");
				}
				
			};
			result = this.getJdbcTemplate().batchUpdate(sql,bpss);
		}catch (Exception e) {
			System.out.println("数据导入错误，着重查看日期格式readExcel2DBC："+e.getMessage());
		}
		//check the result
		if (result!=null){
			for(int i = 0;i<result.length;i++)
			{
				if(result[i]<0)
				{
					System.out.println(i);
					flag = false;
				}
			}			
		}else{
			flag = false;
		}

//		if(flag){
//			try {
//				this.getJdbcTemplate().getDataSource().getConnection().commit();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
		System.out.print(this.getJdbcTemplate());
		System.out.print(flag);
		return flag;
	}
//	public static boolean checkParams(ArrayList arr)
//	{
//		boolean flag = false;
//		int countNull = 0;
//		for(arr.)
//	}
	
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
