package com.cnpc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.cnpc.bean.Cataloginfo;
import com.cnpc.bean.Equipmentinfo;
import com.cnpc.dao.EquipInfoDao;
import com.cnpc.filters.SpringInit;
import com.cnpc.utils.Utils;
import com.opensymphony.xwork2.ActionSupport;

public class EquipmentAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String equipType = "";
	private String equipName = "";
	private String areaid = "";//查询的地区id，要跟用户的地区id对比
	private String id="";//设备或者证书的id
	private String type = "";
	private List<Equipmentinfo> equipLs = null;
	private EquipInfoDao equipDao = (EquipInfoDao) SpringInit.getApplicationContext().getBean("equipDao");
	private JSONObject jsonResult;
	private Equipmentinfo equipinfo;
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

	
	public String getEquipName() {
		return equipName;
	}

	public void setEquipName(String equipName) {
		this.equipName = equipName;
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

	public JSONObject getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(JSONObject jsonResult) {
		this.jsonResult = jsonResult;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Equipmentinfo getEquipinfo() {
		return equipinfo;
	}

	public void setEquipinfo(Equipmentinfo equipinfo) {
		this.equipinfo = equipinfo;
	}

	public String queryEquipInfo()
	{
		equipType = this.getEquipType();
		areaid = this.getAreaid();
		type = this.getType();
		if (Utils.checkNull(equipType)&&Utils.checkNull(areaid))
		{
			return ERROR;
		}else if(Utils.isNumeric(equipType)&&Utils.isNumeric(areaid)){//判断是否为数字
			//首先与session中用户地区对比
			HttpServletRequest request = ServletActionContext.getRequest();
			String user_area_id = (String) request.getSession().getAttribute("area_id");
			String areaName="";
			if((!Utils.checkNull(user_area_id))&&(!Utils.checkNull(areaid)))
			{
				if((!"-1".equals(user_area_id))&&(!user_area_id.equals(areaid)))//-1：管理员权限,不是管理员，查询的地区必须跟权限相等
				{
					return ERROR;
				}
			}else{
				return ERROR;
			}
			if(Utils.areaIdMapName!=null)
			{
				if(!"-1".equals(user_area_id)){//不是管理员，按照所在区域查询
					areaName = Utils.areaIdMapName.get(areaid);
				}else{//是管理员，但是areaid不为空				
					if(!Utils.checkNull(areaid))
						areaName = Utils.areaIdMapName.get(areaid);
				}
			}
			this.setEquipLs(equipDao.getEquipInfo(areaName,equipType,1));
			System.out.println("areaid: "+areaid+" equipType: "+equipType);
		}else{
			return ERROR;
		}
//		else if("9".equals(equipType)){//TODO 暂时导入接口
//			equipDao.readExcel2DB("E:\\project1\\info.xls");
//			
//		}
		return SUCCESS;
	}
	/**
	 * 根据id获得设备信息
	 * @return
	 */
	public String getEquipInfoByIdAPI()
	{
		JSONObject jsonObj = new JSONObject();
		id = this.getId();
		System.out.println("ID:"+id);
		
		jsonObj = JSONObject.fromObject(equipDao.getEquipInfoById(id));
		jsonObj.put("type", 0);//类型是设备
		jsonResult = jsonObj;
		this.setEquipName(equipName);
		
		return SUCCESS;
	}
	/**
	 * 按照id更新设备信息
	 * @return
	 */
	public String updateAPI()
	{
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		equipinfo = this.getEquipinfo();
		System.out.println("id::::"+equipinfo.getId());
		int result = equipDao.updateEquipmentById(equipinfo);
		jsonObj.put("status", result);//更新状态标记
		jsonResult = jsonObj;
		return SUCCESS;
	}
	
	public String deleteAPI(){
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		id = this.getId();
		System.out.println("删除id::::"+id);
		int result = equipDao.deleteEquipInfoById(id);
		jsonObj.put("status", result);//更新状态标记
		jsonResult = jsonObj;
		return SUCCESS;
	}
	
}
