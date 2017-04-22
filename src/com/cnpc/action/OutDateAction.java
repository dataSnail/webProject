package com.cnpc.action;

import java.util.List;

import com.cnpc.bean.Equipmentinfo;
import com.cnpc.dao.OutDateDao;
import com.opensymphony.xwork2.ActionSupport;

public class OutDateAction  extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String timeType = "";
	private List<Equipmentinfo> equipLs = null;
	public String getTimeType() {
		return timeType;
	}

	public void setTimeType(String timeType) {
		this.timeType = timeType;
	}
	
	public List<Equipmentinfo> getEquipLs() {
		return equipLs;
	}

	public void setEquipLs(List<Equipmentinfo> equipLs) {
		this.equipLs = equipLs;
	}
	
	
	
	public String queryOutDate()
	{
		String timeType = this.getTimeType();
		
		if ("".equals(timeType)||timeType==null)
		{
			return ERROR;
		}else{
			OutDateDao odd = new OutDateDao();
			String outdateTime = "";
			if(timeType.equals("0"))
			{
				outdateTime = "0";
			}else if(timeType.equals("1"))
			{
				outdateTime = "7";
			}else if(timeType.equals("2"))
			{
				outdateTime = "30";
			}else if(timeType.equals("3")){
				return SUCCESS;
			}else{
				return ERROR;
			}
			this.setEquipLs(odd.getOutDateInfo(outdateTime));
			System.out.println(timeType);
		}
		
		return SUCCESS;
	}
}
