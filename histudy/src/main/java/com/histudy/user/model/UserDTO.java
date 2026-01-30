package com.histudy.user.model;

import java.sql.Date;

public class UserDTO {
	private int user_idx;
	private String user_id;
	private String user_pw;
	private String user_name;
	private Date user_birthdate;
	private String user_tel;
	private int role_idx;

	public UserDTO() {
		
	}

	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_pwd() {
		return user_pw;
	}

	public void setUser_pwd(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getUser_birthdate() {
		return user_birthdate;
	}

	public void setUser_birthdate(Date user_birthdate) {
		this.user_birthdate = user_birthdate;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public int getRole_idx() {
		return role_idx;
	}

	public void setRole_idx(int role_idx) {
		this.role_idx = role_idx;
	}

	public UserDTO(int user_idx, String user_id, String user_pw, String user_name, Date user_birthdate, String user_tel,
			int role_idx) {
		super();
		this.user_id = user_id;
		this.user_idx = user_idx;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_birthdate = user_birthdate;
		this.user_tel = user_tel;
		this.role_idx = role_idx;
	}

	
}
