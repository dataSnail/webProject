package com.cnpc.action;

import java.util.List;

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
	private String outdate;
	private List<Equipmentinfo> equipLs = null;
	public String getTimeType() {
		return timeType;
	}

	public void setTimeType(String timeType) {
		this.timeType = timeType;
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
	
	public String queryOutDate()
	{
		String timeType = this.getTimeType();
		
		if ("".equals(timeType)||timeType==null)
		{
			return ERROR;
		}else{
//			OutDateDao odd = new OutDateDao();
			OutDateDao odd = (OutDateDao) SpringInit.getApplicationContext().getBean("outdateDao");
			if(Utils.checkNull(timeType))
			{
				return ERROR;
			}else if(Utils.isNumeric(timeType))
			{
				this.setEquipLs(odd.getOutDateInfo(timeType,type,outdate));
				System.out.println(timeType+""+type+""+outdate);
				return SUCCESS;
			}else{
				return ERROR;
			}
//			odd.getTest();
		}
	}
}
