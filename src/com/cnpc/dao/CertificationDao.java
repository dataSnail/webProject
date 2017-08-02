package com.cnpc.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.cnpc.bean.Certificationinfo;
import com.cnpc.bean.Equipmentinfo;
import com.cnpc.utils.Utils;

public class CertificationDao  extends JdbcDaoSupport {
	
	//按照证书类型查询内容
	public List<Certificationinfo> getCertificationInfo(String certifType,String areaName,int page)
	{
		List<Certificationinfo> certifyLs = new ArrayList<Certificationinfo>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		try {
			String sql = "select id,area,department,name,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes from certifications where type = "+certifType ;
			if(!Utils.checkNull(areaName)){
				sql += " and area = '"+areaName+"'";
			}
			sql += " order by type,area,department asc";
			List<Map<String,Object>> resLs = this.getJdbcTemplate().queryForList(sql);
			for(Map<String,Object> res:resLs){
				Certificationinfo ci = new Certificationinfo();
				ci.setId(res.get("id")+"");
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
	
	public Map<String,Object> getCertifyInfoById(String certifyId){
		Equipmentinfo ei = new Equipmentinfo();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Map<String,Object> resMap = null;
		Date now = new Date();
		if(Utils.checkNull(certifyId)){
			return null;
		}
		String sql = "select id,area,department,name,specification,label,location,DATE_FORMAT(exp_date,'%Y-%m-%d') as exp_date,responsible_dep,responsible_person,person_pic,notes from certifications where id = "+certifyId;
		resMap = this.getJdbcTemplate().queryForMap(sql);
		return resMap;	
	}
	
	public int updateCertifyById(Certificationinfo certifyinfo){
		int result = -1;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		if(certifyinfo==null) return result;
		
		String sql;
		sql = "update certifications set specification = '"+certifyinfo.getSpecification()+"',label = '"+certifyinfo.getLabel()+"',location = '"+certifyinfo.getLocation()+"',exp_date = '"+df.format(certifyinfo.getExp_date())+"',responsible_dep = '"+certifyinfo.getResponsible_dep()+"',responsible_person = '"+certifyinfo.getResponsible_person()+"',person_pic = '"+certifyinfo.getPerson_pic()+"',notes = '"+certifyinfo.getNote()+"' where id = "+certifyinfo.getId();
//		System.out.println(sql);
		result = this.getJdbcTemplate().update(sql);
		
//		System.out.println(result);
		
		return result;
	}
	
	public int deleteCertifyInfoById(String certifyId){
		int result = -1;
		String sql = "delete from certifications where id = "+certifyId;
		result = this.getJdbcTemplate().update(sql);
		return result;
	}
	
	public int updateOutdateFlag(String id,String flag,String area){
		int result = -1;
		String sql = "update certifications set out_date_flag = '"+flag+"' where id = "+id;
		if(!Utils.checkNull(area)){
			if(!"-1".equals(area)){
				sql += " and area = '"+Utils.areaIdMapName.get(area)+"'";
			}
			result = this.getJdbcTemplate().update(sql);
		}
		return result;
	}
	
	
	public int addCertificationInfo(final Certificationinfo certifyinfo){
		int result = -1;
		final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "insert into certifications(type,area,department,name,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,out_date_flag,notes) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		result = this.getJdbcTemplate().update(sql, new PreparedStatementSetter(){
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, certifyinfo.getTypeName());
				ps.setString(2, Utils.areaIdMapName.get(certifyinfo.getArea()));
				ps.setString(3, certifyinfo.getDepartment());
				ps.setString(4, certifyinfo.getName());
				ps.setString(5, certifyinfo.getSpecification());
				ps.setString(6, certifyinfo.getLabel());
				ps.setString(7, certifyinfo.getLocation());
				ps.setString(8, df.format(certifyinfo.getExp_date()));
				ps.setString(9, certifyinfo.getResponsible_dep());
				ps.setString(10, certifyinfo.getResponsible_person());
				ps.setString(11, certifyinfo.getPerson_pic());
				ps.setString(12, "0");//certifyinfo.getOutDateFlag()
				ps.setString(13, certifyinfo.getNote());
			}
		});
		return result;
	}
	
}
