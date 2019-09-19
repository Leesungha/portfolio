package com.myebook.homepage.member.db;

import java.sql.Date;

public class MemberDTO {
	
	private int id;
	private String user_id;
	private String nickname;
	private String pw;
	private String email;
	private String phone;
	private Date reg_date;
	private Date log_date;
	private String approval_status;
	private String approval_key;
	private boolean admin_status;		
	
	public boolean getAdmin_status() {
		return admin_status;
	}
	public void setAdmin_status(boolean admin_status) {
		this.admin_status = admin_status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getLog_date() {
		return log_date;
	}
	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	public String getApproval_key() {
		return approval_key;
	}
	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}
	
}