package com.cnpc.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.cnpc.bean.Equipmentinfo;
import com.cnpc.dao.UserDao;
import com.cnpc.filters.SpringInit;
import com.cnpc.utils.Utils;
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
	private JSONObject jsonResult;
	private UserDao userDao = (UserDao) SpringInit.getApplicationContext().getBean("userDao");
	
	public JSONObject getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(JSONObject jsonResult) {
		this.jsonResult = jsonResult;
	}

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
	
	public String statistic(){
		return SUCCESS;
	}
	
	
	
	public String StatisticAPI(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String userName = request.getSession().getAttribute("username")+"";
		List<Map<String,Object>> result;
		List<Map<String,Object>> result2;
		String user_area_id = (String) request.getSession().getAttribute("area_id");
		if(!Utils.checkNull(userName)){
//			System.out.println("删除证书id::::"+id);
			jsonResult = userDao.getECDistribution(user_area_id);
			result = userDao.getEquipStatistic(user_area_id);
			result2 = userDao.getCertifyStatistic(user_area_id);
			JSONArray jsArr = new JSONArray();
			for(Map<String,Object> item : result){
				JSONObject jsObj = new JSONObject();
				for(String s :item.keySet()){
					jsObj.put(s, item.get(s));
				}
				jsArr.add(jsObj);
			}
			JSONArray jsArr2 = new JSONArray();
			for(Map<String,Object> item : result2){
				JSONObject jsObj = new JSONObject();
				for(String s :item.keySet()){
					jsObj.put(s, item.get(s));
				}
				jsArr2.add(jsObj);
			}
			jsonResult.put("data",jsArr);
			jsonResult.put("data2",jsArr2);
		}
		return SUCCESS;
	}
	
//	public String statisticAPI2(){
//		HttpServletRequest request = ServletActionContext.getRequest();
//		String userName = request.getSession().getAttribute("username")+"";
//		List<Map<String,Object>> result;
//		String user_area_id = (String) request.getSession().getAttribute("area_id");
//		if(!Utils.checkNull(userName)){
//			result = userDao.getEquipStatistic("-1");
//			
//			JSONArray jsArr = new JSONArray();
//			for(Map<String,Object> item : result){
//				JSONObject jsObj = new JSONObject();
//				for(String s :item.keySet()){
//					jsObj.put(s, item.get(s));
//				}
//				jsArr.add(jsObj);
//			}
//			jsonResult.put("areas",jsArr);
//		}
//		return SUCCESS;	
//	}
	
	public String specialItem(){
		return SUCCESS;
	}
	
	public String SpeicalAPI(){
		//根据用户地区id查询
		HttpServletRequest request = ServletActionContext.getRequest();
		String user_area_id = (String) request.getSession().getAttribute("area_id");
		JSONObject jsonObj = new JSONObject();
		Map<String, List<?>> map = new HashMap<String, List<?>>();
		map.put("data", userDao.getSpeEquipInfo(user_area_id));
		map.put("data2", userDao.getSpeCertification(user_area_id));
		jsonObj = JSONObject.fromObject(map);
		jsonResult = jsonObj;
		return SUCCESS;
	}
	
}
