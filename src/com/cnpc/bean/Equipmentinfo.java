package com.cnpc.bean;

import java.util.Date;

import com.cnpc.utils.Utils;

public class Equipmentinfo {
	private String id;
	private String typeName;
	private String area;
	private String department;
	private String roomId;
	private String specification;
	private String label;
	private String location;
	private Date exp_date;
	private String responsible_dep;
	private String responsible_person;
	private String person_pic;
	private String note;
	private String outDateFlag;//不过期标志，优先于过期日期
	private String status;//与当前时间比，间隔的天数
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		if(Utils.checkNull(area))
			this.area = "无";
		else
			this.area = area;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		if(Utils.checkNull(department))
			this.department = "无";
		else
			this.department = department;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		if (Utils.checkNull(roomId))
			this.roomId = "无";
		else
			this.roomId = roomId;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		if(Utils.checkNull(specification))
			this.specification = "无";
		else
			this.specification = specification;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		if(Utils.checkNull(location))
			this.location = "无";
		else
			this.location = location;
	}
	public Date getExp_date() {
		return exp_date;
	}
	public void setExp_date(Date exp_date) {
		if(exp_date==null){
			exp_date= new Date();
		}else
			this.exp_date = exp_date;
	}
	public String getResponsible_dep() {
		return responsible_dep;
	}
	public void setResponsible_dep(String responsible_dep) {
		if(Utils.checkNull(responsible_dep))
			this.responsible_dep = "无";
		else
			this.responsible_dep = responsible_dep;
	}
	public String getResponsible_person() {
		return responsible_person;
	}
	public void setResponsible_person(String responsible_person) {
		if(Utils.checkNull(responsible_person))
			this.responsible_person = "无";
		else
			this.responsible_person = responsible_person;
	}
	public String getPerson_pic() {
		return person_pic;
	}
	public void setPerson_pic(String person_pic) {
		if(Utils.checkNull(person_pic))
			this.person_pic = "无";
		else
			this.person_pic = person_pic;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		if(Utils.checkNull(note))
			this.note = "无";
		else
			this.note = note;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getOutDateFlag() {
		return outDateFlag;
	}
	public void setOutDateFlag(String outDateFlag) {
		this.outDateFlag = outDateFlag;
	}
	
}
