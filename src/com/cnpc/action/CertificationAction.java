package com.cnpc.action;

import com.opensymphony.xwork2.ActionSupport;

public class CertificationAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String certifType = "";
	
	
	public String getCertifType() {
		return certifType;
	}


	public void setCertifType(String certifType) {
		this.certifType = certifType;
	}


	public String queryCertifInfo()
	{
		certifType = this.getCertifType();
		
		if ("".equals(certifType)||certifType==null)
		{
			return ERROR;
		}else{
			System.out.println(certifType);
		}
		
		return SUCCESS;
	}
}
