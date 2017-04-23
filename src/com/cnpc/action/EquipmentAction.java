package com.cnpc.action;

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
	private EquipInfoDao equipDao;
//	public EquipInfoDao getEquipDao() {
//			return equipDao;
//		}
//
//	public void setEquipDao(EquipInfoDao equipDao) {
//		this.equipDao = equipDao;
//	}

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
			equipDao = new EquipInfoDao();
			equipDao.readExcel2DB();
			
		}else{
			equipDao = new EquipInfoDao();
			this.setEquipLs(equipDao.getEquipInfo(equipType,1));
			System.out.println(equipType);
		}
		
		return SUCCESS;
	}
}
