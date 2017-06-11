package com.cnpc.action;

import java.util.List;

import com.cnpc.bean.Equipmentinfo;
import com.opensymphony.xwork2.ActionSupport;

public class QueryinfoAction  extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String type="";
	private String etype="";
	private String outdate;
	private List<Equipmentinfo> equipLs = null;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String queryInfo(){
		System.out.print("queryinfo::");
		return SUCCESS;
	}
}
