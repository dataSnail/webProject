package com.cnpc.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.cnpc.bean.Certificationinfo;
import com.cnpc.bean.Equipmentinfo;
import com.cnpc.dao.OutDateDao;
import com.cnpc.filters.SpringInit;
import com.cnpc.utils.Utils;
import com.opensymphony.xwork2.ActionSupport;

public class OutDateAction  extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String timeType = "";
	private String type = "";
	private String etype="";
	private String departmentName = "";
	private String areaId = "";
	private String outdate;
	private List<Equipmentinfo> equipLs = null;
	private List<Certificationinfo> certifLs = null;
	private JSONObject jsonResult;
	public String getTimeType() {
		return timeType;
	}

	public void setTimeType(String timeType) {
		this.timeType = timeType;
	}
	
	public String getEtype() {
		return etype;
	}

	public void setEtype(String etype) {
		this.etype = etype;
	}

	public String getOutdate() {
		return outdate;
	}

	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}

	public List<Equipmentinfo> getEquipLs() {
		return equipLs;
	}

	public void setEquipLs(List<Equipmentinfo> equipLs) {
		this.equipLs = equipLs;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	

	public JSONObject getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(JSONObject jsonResult) {
		this.jsonResult = jsonResult;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public List<Certificationinfo> getCertifLs() {
		return certifLs;
	}

	public void setCertifLs(List<Certificationinfo> certifLs) {
		this.certifLs = certifLs;
	}

	public String queryOutDate()
	{
		String timeType = this.getTimeType();
		HttpServletRequest request = ServletActionContext.getRequest();
		String user_area_id = (String) request.getSession().getAttribute("area_id");
		if(Utils.checkNull(user_area_id)) return ERROR;
		if ("".equals(timeType)||timeType==null)
		{
			return ERROR;
		}else{
			OutDateDao odd = (OutDateDao) SpringInit.getApplicationContext().getBean("outdateDao");
			if(Utils.checkNull(timeType))
			{
				return ERROR;
			}else if(Utils.isNumeric(timeType))
			{
				if("0".equals(etype)){//设备
					this.setEquipLs(odd.getEquipInfo(timeType,outdate,user_area_id,""));
				}else if("1".equals(etype)){//证书
					this.setCertifLs(odd.getCertification(timeType,outdate,user_area_id,""));
				}
				System.out.println(timeType+""+etype+""+outdate);
				return SUCCESS;
			}else{
				return ERROR;
			}
//			odd.getTest();
		}
	}
	
	public String queryOutDateAPI()
	{
		String timeType = this.getTimeType();
		String etype  = this.getEtype();
		String department=this.getDepartmentName();
		try {
			department = URLDecoder.decode(department,"utf-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println("部门转码错误..."+e.getMessage());
		}
		String area = this.getAreaId();
		String outdateTime = this.getOutdate();
		
		//首先与session中用户地区对比
		HttpServletRequest request = ServletActionContext.getRequest();
		String user_area_id = (String) request.getSession().getAttribute("area_id");
		System.out.println("所属地区："+user_area_id+",查询地区："+area);
		if((!Utils.checkNull(user_area_id))&&(!Utils.checkNull(area)))
		{
			if((!"-1".equals(user_area_id))&&(!user_area_id.equals(area)))//-1：管理员权限,不是管理员，查询的地区必须跟权限相等
			{
				return ERROR;
			}
		}else{
			return ERROR;
		}
		if ("".equals(timeType)||timeType==null)
		{
			return ERROR;
		}else{
			OutDateDao odd = (OutDateDao) SpringInit.getApplicationContext().getBean("outdateDao");
			if(Utils.checkNull(timeType))
			{
				return ERROR;
			}else if(Utils.isNumeric(timeType))
			{
//				JSONArray json = JSONArray.fromObject(odd.getOutDateInfo(timeType,type,outdate));
				JSONObject jsonObj = new JSONObject();
				Map<String, List<?>> map = new HashMap<String, List<?>>();
				if("0".equals(etype)){//设备
					map.put("data", odd.getEquipInfo(timeType,outdateTime,area,department));
				}else{//证书
					map.put("data", odd.getCertification(timeType,outdateTime,area,department));
				}
				jsonObj = JSONObject.fromObject(map);
				System.out.println("查询类型："+timeType+",设备证件类型："+etype+"过期日期："+outdateTime);
				jsonResult = jsonObj;
//				System.out.println(jsonResult);
				return SUCCESS;
			}else{
				return ERROR;
			}
//			odd.getTest();
		}
	}
	
	
}
