package com.cnpc.action;

import java.util.List;

import com.cnpc.bean.Certificationinfo;
import com.cnpc.dao.CertificationDao;
import com.cnpc.filters.SpringInit;
import com.cnpc.utils.Utils;
import com.opensymphony.xwork2.ActionSupport;

public class CertificationAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String certifType = "";
	private List<Certificationinfo> certifLs = null;
	private CertificationDao certiDao = (CertificationDao) SpringInit.getApplicationContext().getBean("certifDao");
	
	public List<Certificationinfo> getCertifLs() {
		return certifLs;
	}

	public void setCertifLs(List<Certificationinfo> certifLs) {
		this.certifLs = certifLs;
	}
	
	public String getCertifType() {
		return certifType;
	}

	public void setCertifType(String certifType) {
		this.certifType = certifType;
	}

	
	
	//按照类型查询证书内容
	public String queryCertifInfo()
	{
		certifType = this.getCertifType();
		
		if (Utils.checkNull(certifType))
		{
			return ERROR;
		}else if(Utils.isNumeric(certifType)){
			this.setCertifLs(certiDao.getCertificationInfo(certifType,1));
			System.out.println(certifType);
		}else{
			return ERROR;
		}
		
		return SUCCESS;
	}
}
