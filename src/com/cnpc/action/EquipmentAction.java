package com.cnpc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.cnpc.bean.Cataloginfo;
import com.cnpc.bean.Equipmentinfo;
import com.cnpc.dao.EquipInfoDao;
import com.cnpc.filters.SpringInit;
import com.cnpc.utils.Utils;
import com.opensymphony.xwork2.ActionSupport;

public class EquipmentAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String equipType = "";
	private String equipName = "";
	private String areaid = "";//查询的地区id，要跟用户的地区id对比
	private String type = "";
	private List<Equipmentinfo> equipLs = null;
	private EquipInfoDao equipDao = (EquipInfoDao) SpringInit.getApplicationContext().getBean("equipDao");

	public List<Equipmentinfo> getEquipLs() {
		return equipLs;
	}

	public void setEquipLs(List<Equipmentinfo> equipLs) {
		this.equipLs = equipLs;
	}

	public String getEquipType() {
		return equipType;
	}

	public void setEquipType(String equipType) {
		this.equipType = equipType;
	}

	
	public String getEquipName() {
		return equipName;
	}

	public void setEquipName(String equipName) {
		this.equipName = equipName;
	}

	public String getAreaid() {
		return areaid;
	}

	public void setAreaid(String areaid) {
		this.areaid = areaid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String queryEquipInfo()
	{
		equipType = this.getEquipType();
		areaid = this.getAreaid();
		type = this.getType();
		if (Utils.checkNull(equipType)&&Utils.checkNull(areaid))
		{
			return ERROR;
		}else if(Utils.isNumeric(equipType)&&Utils.isNumeric(areaid)){//判断是否为数字
			//首先与session中用户地区对比
			HttpServletRequest request = ServletActionContext.getRequest();
			String user_area_id = (String) request.getSession().getAttribute("area_id");
			String areaName="";
			if((!Utils.checkNull(user_area_id))&&(!Utils.checkNull(areaid)))
			{
				if((!"-1".equals(user_area_id))&&(!user_area_id.equals(areaid)))//-1：管理员权限,不是管理员，查询的地区必须跟权限相等
				{
					return ERROR;
				}
			}else{
				return ERROR;
			}
			if(Utils.areaIdMapName!=null)
			{
				if(!"-1".equals(user_area_id)){//不是管理员，按照所在区域查询
					areaName = Utils.areaIdMapName.get(areaid);
				}
			}
			this.setEquipLs(equipDao.getEquipInfo(areaName,equipType,1));
			System.out.println("areaid: "+areaid+" equipType: "+equipType);
		}else{
			return ERROR;
		}
//		else if("9".equals(equipType)){//TODO 暂时导入接口
//			equipDao.readExcel2DB("E:\\project1\\info.xls");
//			
//		}
		return SUCCESS;
	}
	
	
	
}
