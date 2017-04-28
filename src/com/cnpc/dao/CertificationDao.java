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

public class CertificationDao  extends JdbcDaoSupport {
	
	//按照证书类型查询内容
	public List<Certificationinfo> getCertificationInfo(String certifType,int page)
	{
		List<Certificationinfo> certifyLs = new ArrayList<Certificationinfo>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		try {
			String sql = "select area,department,name,specification,label,location,exp_date,responsible_dep,responsible_person,person_pic,notes from certifications where type = "+certifType+" order by exp_date asc";
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
}
