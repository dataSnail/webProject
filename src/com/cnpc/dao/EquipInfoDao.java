package com.cnpc.dao;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.cnpc.bean.Equipmentinfo;
import com.cnpc.utils.ExcelReader;
import com.cnpc.utils.Utils;

public class EquipInfoDao extends JdbcDaoSupport {
	/**
	 * 获得设备信息
	 * @param areaid
	 * @param type
	 * @param page
	 * @return
	 */
	public List<Equipmentinfo> getEquipInfo(String areaid,String type,int page)
	{
		List<Equipmentinfo> equipLs = new ArrayList<Equipmentinfo>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		try {
			String sql = "select id,area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,out_date_flag,notes from equipments where type = "+type ;//+"  limit "+10*(page-1)+","+10*page
			if(!Utils.checkNull(areaid)){
				sql += " and area = '"+areaid+"'";
			}
			sql += " order by type,area,department asc";
			List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(sql);
			for(Map<String,Object> res:resLs){
				Equipmentinfo ei = new Equipmentinfo();
				ei.setId(res.get("id")+"");
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
				ei.setOutDateFlag(res.get("out_date_flag")+"");
				ei.setStatus(Double.toString(Math.ceil((ei.getExp_date().getTime()-now.getTime())/(24*60*60*1000.0))));
				equipLs.add(ei);
			}
		} catch (ParseException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return equipLs;

	}
	
	/**
	 * 增加一条设备信息
	 * @param equipinfo
	 * @return
	 */
	public int addEquipmentInfo(final Equipmentinfo equipinfo){
		int result = -1;
		final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "insert into equipments(type,area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,out_date_flag,notes) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		result = this.getJdbcTemplate().update(sql, new PreparedStatementSetter(){
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, equipinfo.getTypeName());
				ps.setString(2, Utils.areaIdMapName.get(equipinfo.getArea()));
				ps.setString(3, equipinfo.getDepartment());
				ps.setString(4, "");
				ps.setString(5, equipinfo.getSpecification());
				ps.setString(6, equipinfo.getLabel());
				ps.setString(7, equipinfo.getLocation());
				ps.setString(8, df.format(equipinfo.getExp_date()));
				ps.setString(9, equipinfo.getResponsible_dep());
				ps.setString(10, equipinfo.getResponsible_person());
				ps.setString(11, equipinfo.getPerson_pic());
				ps.setString(12, "0");//equipinfo.getOutDateFlag()
				ps.setString(13, equipinfo.getNote());
			}
		});
		
		return result;
	}
	
	/**
	 * 根据@param equipinfo中id 更新设备信息
	 * @param equipinfo
	 * @return
	 */
	public int updateEquipmentById(Equipmentinfo equipinfo)
	{
		int result = -1;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		if(equipinfo==null) return result;
		
		String sql = "update equipments set specification = '"+equipinfo.getSpecification()+"',label = '"+equipinfo.getLabel()+"',location = '"+equipinfo.getLocation()+"',exp_date = '"+df.format(equipinfo.getExp_date())+"',responsible_dep = '"+equipinfo.getResponsible_dep()+"',responsible_person = '"+equipinfo.getResponsible_person()+"',person_pic = '"+equipinfo.getPerson_pic()+"',notes = '"+equipinfo.getNote()+"' where id = "+equipinfo.getId();
		
		result = this.getJdbcTemplate().update(sql);
		
		System.out.println(result);
		
		return result;
	}
	
	public int updateOutdateFlag(String id,String flag,String area){
		int result = -1;
		String sql = "update equipments set out_date_flag = '"+flag+"' where id = "+id;
		if(!Utils.checkNull(area)){
			if(!"-1".equals(area)){
				sql += " and area = '"+Utils.areaIdMapName.get(area)+"'";
			}
			result = this.getJdbcTemplate().update(sql);
		}
		return result;
	}
	
	/**
	 * 按照id获得设备信息
	 * @param equipId
	 * @return
	 */
	public Map<String,Object> getEquipInfoById(String equipId)
	{
		Equipmentinfo ei = new Equipmentinfo();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Map<String,Object> resMap = null;
		Date now = new Date();
		if(Utils.checkNull(equipId)){
			return null;
		}
		String sql = "select id,area,department,room,specification,label,location,DATE_FORMAT(exp_date,'%Y-%m-%d') as exp_date,responsible_dep,responsible_person,person_pic,notes from equipments where id = "+equipId;
		
		sql += " order by type,area,department asc";
		resMap = this.getJdbcTemplate().queryForMap(sql);
//			if(resMap!=null){
//				ei.setId(resMap.get("id")+"");
//				ei.setArea(resMap.get("area")+"");
//				ei.setDepartment(resMap.get("department")+"");
//				ei.setRoomId(resMap.get("room")+"");
//				ei.setSpecification(resMap.get("specification")+"");
//				ei.setLabel(resMap.get("label")+"");
//				ei.setLocation(resMap.get("location")+"");
//				ei.setExp_date(df.parse(resMap.get("exp_date")+""));
//				ei.setResponsible_dep(resMap.get("responsible_dep")+"");
//				ei.setResponsible_person(resMap.get("responsible_person")+"");
//				ei.setPerson_pic(resMap.get("person_pic")+"");
//				ei.setNote(resMap.get("notes")+"");
//				ei.setStatus(Double.toString(Math.ceil((ei.getExp_date().getTime()-now.getTime())/(24*60*60*1000.0))));
//			} 
		return resMap;

	}
	/**
	 * 根据id删除设备信息
	 * @param equipId
	 * @return
	 */
	public int deleteEquipInfoById(String equipId){
		int result = -1;
		String sql = "delete from equipments where id = "+equipId;
		result = this.getJdbcTemplate().update(sql);
		
		return result;
	}
	
//	public void readExcel2DB(String fileName){
//		boolean flag = true;
//		int [] result;
//		ExcelReader er = new ExcelReader();
//		File f = new File(fileName);
//		final List<ArrayList<Object>> params = Utils.convertParams(er.readExcel2DB(f));
//		String sql = "insert into equipments (type,area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes) values (?,?,?,?,?,?,?,?,?,?,?,?)";
//		result = this.getJdbcTemplate().batchUpdate(sql, new BatchPreparedStatementSetter(){
//	
//			@Override
//			public int getBatchSize() {
//				// TODO Auto-generated method stub
//				return params.size();
//			}
//	
//			@Override
//			public void setValues(PreparedStatement ps, int i)
//					throws SQLException {
//				ps.setString(1, params.get(i).get(0)+"");
//				ps.setString(2, params.get(i).get(1)+"");
//				ps.setString(3, params.get(i).get(2)+"");
//				ps.setString(4, params.get(i).get(3)+"");
//				ps.setString(5, params.get(i).get(4)+"");
//				ps.setString(6, params.get(i).get(5)+"");
//				ps.setString(7, params.get(i).get(6)+"");
//				ps.setString(8, params.get(i).get(7)+"");
//				ps.setString(9, params.get(i).get(8)+"");
//				ps.setString(10, params.get(i).get(9)+"");
//				ps.setString(11, params.get(i).get(10)+"");
//				ps.setString(12, params.get(i).get(11)+"");
//			}
//			
//		});
//		
//		//check the result
//		for(int i = 0;i<result.length;i++)
//		{
//			if(result[i]<0)
//			{
//				System.out.println(i);
//				flag = false;
//			}
//		}
//	
//		System.out.print(flag);
//	}
	
	public void testDao()
	{
		String sql = "select 1";
		List<Map<String, Object>> a = this.getJdbcTemplate().queryForList(sql);
		System.out.print(a);
		
	}
	public List<Map<String, Object>> getEquipInfoMap(String areaid,String type,int page)
	{
		List<Map<String,Object>> resLs = null;
		Date now = new Date();
		String sql = "select id,area,department,room,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,out_date_flag,notes from equipments where type = "+type ;//+"  limit "+10*(page-1)+","+10*page
		if(!Utils.checkNull(areaid)){
			sql += " and area = '"+Utils.areaIdMapName.get(areaid)+"'";
		}
		sql += " order by type,area,department asc";
		resLs = this.getJdbcTemplate().queryForList(sql); 
		return resLs;

	}
	
	public static void main(String [] args)
	{
		System.out.println();
	}
}
