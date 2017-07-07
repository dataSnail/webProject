package com.cnpc.bean;

import java.util.Date;

public class Certificationinfo {
	private String id;
	private int type;
	private String typeName;
	private String area;
	private String department;
	private String name;//批复文件名称、健康证姓名
	private String specification;//规格
	private String label;//证号、批文号
	private String location;
	private Date exp_date;
	private String responsible_dep;//负责人
	private String responsible_person;//负责部门
	private String person_pic;//负责办理人
	private String note;
	private String outDateFlag;//不过期标志，优先于过期日期
	private String status;//与当前时间比，间隔的天数
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
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
		this.location = location;
	}
	public Date getExp_date() {
		return exp_date;
	}
	public void setExp_date(Date exp_date) {
		this.exp_date = exp_date;
	}
	public String getResponsible_dep() {
		return responsible_dep;
	}
	public void setResponsible_dep(String responsible_dep) {
		this.responsible_dep = responsible_dep;
	}
	public String getResponsible_person() {
		return responsible_person;
	}
	public void setResponsible_person(String responsible_person) {
		this.responsible_person = responsible_person;
	}
	public String getPerson_pic() {
		return person_pic;
	}
	public void setPerson_pic(String person_pic) {
		this.person_pic = person_pic;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
