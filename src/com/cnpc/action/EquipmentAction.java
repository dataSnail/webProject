package com.cnpc.action;

import com.opensymphony.xwork2.ActionSupport;

public class EquipmentAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String equipType = "";
	
	
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
		}else{
			System.out.println(equipType);
		}
		
		return SUCCESS;
	}
}
