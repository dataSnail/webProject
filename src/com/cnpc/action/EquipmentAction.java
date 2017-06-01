package com.cnpc.action;

import java.util.List;

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


	public String queryEquipInfo()
	{
		String equipType = this.getEquipType();
		
		if (Utils.checkNull(equipType))
		{
			return ERROR;
		}else if(Utils.isNumeric(equipType)){//判断是否为数字
			this.setEquipLs(equipDao.getEquipInfo(equipType,1));
			System.out.println(equipType);
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
