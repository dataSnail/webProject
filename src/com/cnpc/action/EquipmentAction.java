package com.cnpc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.cnpc.bean.Equipmentinfo;
import com.cnpc.dao.EquipInfoDao;
import com.cnpc.dao.OperationLogDao;
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
	private String id="";//设备的id
	private String flag = "";//设备过期标志
	private String type = "";
	private List<Equipmentinfo> equipLs = null;
	private EquipInfoDao equipDao = (EquipInfoDao) SpringInit.getApplicationContext().getBean("equipDao");
	private OperationLogDao LogDao = (OperationLogDao) SpringInit.getApplicationContext().getBean("logDao");
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

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	/**
	 * 查询设备，要根据用户所属的地区
	 * @return
	 */
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
			this.setEquipName(Utils.equipCertiIdMapName.get(equipType));
			System.out.println("areaid: "+areaid+" equipType: "+equipType);
		}else{
			return ERROR;
		}
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
//		System.out.println("ID:"+id);
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
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		String userName = request.getSession().getAttribute("username")+"";
		if(!Utils.checkNull(userName)){
			equipinfo = this.getEquipinfo();
			System.out.println("id::::"+equipinfo.getId());
			int result = equipDao.updateEquipmentById(equipinfo);
			Object[] obj = {userName,"更新设备："+(result>0?"成功":"失败"),equipinfo.getId()};
			LogDao.insertLog(obj);
			jsonObj.put("status", result);//更新状态标记
			jsonResult = jsonObj;
		}
		return SUCCESS;
	}
	/**
	 * 根据信息删除相关设备
	 * @return
	 */
	public String deleteAPI(){
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		String userName = request.getSession().getAttribute("username")+"";
		if(!Utils.checkNull(userName)){
			id = this.getId();
//			System.out.println("删除id::::"+id);
			int result = equipDao.deleteEquipInfoById(id);
			Object[] obj = {userName,"删除设备："+(result>0?"成功":"失败"),id};
			LogDao.insertLog(obj);
			jsonObj.put("status", result);//更新状态标记
			jsonResult = jsonObj;
		}
		return SUCCESS;
	}
	/**
	 * 添加一条设备信息
	 * @return
	 */
	public String addEquipInfoAPI(){
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		String userName = request.getSession().getAttribute("username")+"";
		equipinfo = this.getEquipinfo();
		equipinfo.setTypeName(type);
		int result = equipDao.addEquipmentInfo(equipinfo);
		Object[] obj = {userName,"增加设备："+(result>0?"成功":"失败"),"000"};
		LogDao.insertLog(obj);
		jsonObj.put("status", result);//更新状态标记
		jsonResult = jsonObj;
		return SUCCESS;
	}
	
	public String outDateFlagAPI(){
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", -1);//更新状态标记
		String userName = request.getSession().getAttribute("username")+"";
		String modify_id = this.getId();
		String modify_flag = this.getFlag();
		String user_area = request.getSession().getAttribute("area_id")+"";//用户权限区域
		if(Utils.checkNull(userName)||Utils.checkNull(modify_id)||Utils.checkNull(modify_flag)||Utils.checkNull(user_area)){//有一个为空即返回失败
			Object[] obj = {userName,"修改设备过期标志：失败[x]",modify_id};
			LogDao.insertLog(obj);
		}else{
			int result = equipDao.updateOutdateFlag(modify_id,modify_flag,user_area);
			Object[] obj = {userName,"修改设备过期标志："+(result>0?"成功":"失败"),modify_id};
			LogDao.insertLog(obj);
			jsonObj.put("status", result);//更新状态标记
			jsonResult = jsonObj;
		}
		return SUCCESS;
	}
}
