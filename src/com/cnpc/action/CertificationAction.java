package com.cnpc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

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
	private String certifName = "";
	private String areaid = "";
	private String type = "";
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

	
	
	public String getAreaid() {
		return areaid;
	}

	public void setAreaid(String areaid) {
		this.areaid = areaid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCertifName() {
		return certifName;
	}

	public void setCertifName(String certifName) {
		this.certifName = certifName;
	}

	//按照类型查询证书内容
	public String queryCertifInfo()
	{
		certifType = this.getCertifType();
		
		if (Utils.checkNull(certifType))
		{
			return ERROR;
		}else if(Utils.isNumeric(certifType)){
			//首先与session中用户地区对比
			HttpServletRequest request = ServletActionContext.getRequest();
			String user_area_id = (String) request.getSession().getAttribute("area_id");
			if((!Utils.checkNull(user_area_id))&&(!Utils.checkNull(areaid)))
			{
				if((!"-1".equals(user_area_id))&&(!user_area_id.equals(areaid)))//-1：管理员权限,不是管理员，查询的地区必须跟权限相等
				{
					return ERROR;
				}
			}else{
				return ERROR;
			}
			
			String areaName = "";
			if(!"-1".equals(user_area_id)){//不是管理员，按照所在区域查询
				areaName = Utils.areaIdMapName.get(user_area_id);
			}
			this.setCertifLs(certiDao.getCertificationInfo(certifType,areaName,1));
			this.setCertifName(Utils.equipCertiIdMapName.get(certifType));
			System.out.println(certifType);
		}else{
			return ERROR;
		}
		
		return SUCCESS;
	}
}
