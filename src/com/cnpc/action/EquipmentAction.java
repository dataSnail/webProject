package com.cnpc.action;

import java.util.Date;
import java.util.List;

import com.cnpc.bean.Equipmentinfo;
import com.cnpc.dao.EquipInfoDao;
import com.opensymphony.xwork2.ActionSupport;

public class EquipmentAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String equipType = "";
	private List<Equipmentinfo> equipLs = null;
//	private Date nowDate = Date();
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

	
	

	public String queryEquipInfo()
	{
		String equipType = this.getEquipType();
		
		if ("".equals(equipType)||equipType==null)
		{
			return ERROR;
		}else if(equipType.equals("9")){
			EquipInfoDao ed = new EquipInfoDao();
			ed.readExcel2DB();
			
		}else{
			EquipInfoDao ed = new EquipInfoDao();
			this.setEquipLs(ed.getEquipInfo(equipType,1));
			System.out.println(equipType);
		}
		
		return SUCCESS;
	}
}
