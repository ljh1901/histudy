package com.histudy.user.model;

public class MypageDTO {
	private int profile_idx;
	private int user_idx;
	private String user_intro;
	private String profile_img;
	public MypageDTO() {
		// TODO Auto-generated constructor stub
	}
	public int getProfile_idx() {
		return profile_idx;
	}
	public void setProfile_idx(int profile_idx) {
		this.profile_idx = profile_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
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
	public MypageDTO(int profile_idx, int user_idx, String user_intro, String profile_img) {
		super();
		this.profile_idx = profile_idx;
		this.user_idx = user_idx;
		this.user_intro = user_intro;
		this.profile_img = profile_img;
	}
	
}
