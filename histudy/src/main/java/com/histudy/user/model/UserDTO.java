package com.histudy.user.model;

import java.sql.Date;

public class UserDTO {

	private int user_idx;
	private String user_id;
	private String user_pw;
	private String user_name;
	private Date user_birthdate;
	private String user_tel;
	private String user_email;
	private int role_idx;

	private String user_intro; // 자기소개
	private String profile_img; // 프로필 사진 경로
	private int user_age; // 나이 (계산용)

	public UserDTO() {

	}

	public String getUser_intro() {
		return user_intro;
	}

	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public int getUser_age() {
		return user_age;
	}

	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
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
			String user_email, int role_idx, String user_intro, String profile_img, int user_age) {
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_birthdate = user_birthdate;
		this.user_tel = user_tel;
		this.user_email = user_email;
		this.role_idx = role_idx;
		this.user_intro = user_intro;
		this.profile_img = profile_img;
		this.user_age = user_age;
	}

}
