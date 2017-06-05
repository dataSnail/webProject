package com.cnpc.bean;

import com.cnpc.utils.Utils;

public class Userinfo {
	private String username;
	private String realname;
	private String password;
	private String[] priority;
	private String notes;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String[] getPriority() {
		return priority;
	}
	public void setPriority(String[] priority) {
		this.priority = priority;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		if(Utils.checkNull(notes) || "null".equals(notes))
			this.notes = "无";
		else
			this.notes = notes;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
