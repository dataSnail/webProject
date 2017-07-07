package com.cnpc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.cnpc.bean.Certificationinfo;
import com.cnpc.dao.CertificationDao;
import com.cnpc.dao.OperationLogDao;
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
	private String id = "";
	private String type = "";
	private List<Certificationinfo> certifLs = null;
	private CertificationDao certiDao = (CertificationDao) SpringInit.getApplicationContext().getBean("certifDao");
	private OperationLogDao LogDao = (OperationLogDao) SpringInit.getApplicationContext().getBean("logDao");
	private JSONObject jsonResult;
	private Certificationinfo certifyinfo;
	
	public JSONObject getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(JSONObject jsonResult) {
		this.jsonResult = jsonResult;
	}

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

	
	public Certificationinfo getCertifyinfo() {
		return certifyinfo;
	}

	public void setCertifyinfo(Certificationinfo certifyinfo) {
		this.certifyinfo = certifyinfo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	/**
	 * 按照类型查询证书内容
	 * @return
	 */
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
			}else{//是管理员，但是areaid不为空					
				if(!Utils.checkNull(areaid))
					areaName = Utils.areaIdMapName.get(areaid);
			}
			this.setCertifLs(certiDao.getCertificationInfo(certifType,areaName,1));
			this.setCertifName(Utils.equipCertiIdMapName.get(certifType));
			System.out.println(certifType);
		}else{
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 根据id，更新证书信息
	 * @return
	 */
	public String updateAPI()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		String userName = request.getSession().getAttribute("username")+"";
		if(!Utils.checkNull(userName)){
			certifyinfo = this.getCertifyinfo();
			System.out.println("id::::"+certifyinfo.getId());
			int result = certiDao.updateCertifyById(certifyinfo);
			Object[] obj = {userName,"更新证书："+(result>0?"成功":"失败"),certifyinfo.getId()};
			LogDao.insertLog(obj);
			jsonObj.put("status", result);//更新状态标记
			jsonResult = jsonObj;
		}
		return SUCCESS;
	}
	
	
	public String getCertifyInfoByIdAPI()
	{
		JSONObject jsonObj = new JSONObject();
		id = this.getId();
//		System.out.println("ID:"+id);
		jsonObj = JSONObject.fromObject(certiDao.getCertifyInfoById(id));
		jsonObj.put("type", 1);//类型是证书
		jsonResult = jsonObj;
		this.setCertifName(certifName);
		
		return SUCCESS;
	}
	/**
	 * 根据页面信息删除相关证书
	 * @return
	 */
	public String deleteAPI(){
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		String userName = request.getSession().getAttribute("username")+"";
		if(!Utils.checkNull(userName)){
			id = this.getId();
//			System.out.println("删除证书id::::"+id);
			int result = certiDao.deleteCertifyInfoById(id);
			Object[] obj = {userName,"删除证书："+(result>0?"成功":"失败"),id};
			LogDao.insertLog(obj);
			jsonObj.put("status", result);//更新状态标记
			jsonResult = jsonObj;
		}
		return SUCCESS;
	}
	
}
