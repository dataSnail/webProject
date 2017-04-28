package com.cnpc.action;

import java.util.List;

import com.cnpc.bean.Equipmentinfo;
import com.cnpc.dao.UploadFileDao;
import com.cnpc.filters.SpringInit;
import com.cnpc.utils.Utils;
import com.opensymphony.xwork2.ActionSupport;

public class UploadFileAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String equipType = "";
	private List<Equipmentinfo> equipLs = null;
	private UploadFileDao uploadDao = (UploadFileDao) SpringInit.getApplicationContext().getBean("uploadDao");

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


	public String uploadFile()
	{
		String equipType = this.getEquipType();
		
		if (Utils.checkNull(equipType))
		{
			return SUCCESS;
		}else if("9".equals(equipType)){
			uploadDao.readExcel2DB("E:\\project1\\info.xls");
			
		}else{
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	
	
}
