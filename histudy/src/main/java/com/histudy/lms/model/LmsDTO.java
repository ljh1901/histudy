package com.histudy.lms.model;

public class LmsDTO {
	
	private int a_idx;
	private String a_title;
	private String a_content;
	private String a_fname;
	private String a_start_date;
	private String a_end_date;
	private String a_end_time; // DB에 없음 시간값을 사용자에게 선택 받기 위해 추가함
	private String a_end_time_m; // DB에 없음 분값을 사용자에게 선택 받기 위해 추가함
	private String study_title; // DB에 없음 스터디 타이들을 가져오기 위함
	private int a_weeks;
	private int user_idx;
	private int study_idx;
	
	private String memberStatus; // 진행중 클릭하면 상태 판단해주려고 만든거
	
	
	public LmsDTO() {
		// TODO Auto-generated constructor stub
	}



	public LmsDTO(int a_idx, String a_title, String a_content, String a_fname, String a_start_date, String a_end_date,
			String a_end_time, String a_end_time_m, String study_title, int a_weeks, int user_idx, int study_idx,
			String memberStatus) {
		super();
		this.a_idx = a_idx;
		this.a_title = a_title;
		this.a_content = a_content;
		this.a_fname = a_fname;
		this.a_start_date = a_start_date;
		this.a_end_date = a_end_date;
		this.a_end_time = a_end_time;
		this.a_end_time_m = a_end_time_m;
		this.study_title = study_title;
		this.a_weeks = a_weeks;
		this.user_idx = user_idx;
		this.study_idx = study_idx;
		this.memberStatus = memberStatus;
	}



	public int getA_idx() {
		return a_idx;
	}


	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}


	public String getA_title() {
		return a_title;
	}


	public void setA_title(String a_title) {
		this.a_title = a_title;
	}


	public String getA_content() {
		return a_content;
	}


	public void setA_content(String a_content) {
		this.a_content = a_content;
	}


	public String getA_fname() {
		return a_fname;
	}


	public void setA_fname(String a_fname) {
		this.a_fname = a_fname;
	}


	public String getA_start_date() {
		return a_start_date;
	}


	public void setA_start_date(String a_start_date) {
		this.a_start_date = a_start_date;
	}


	public String getA_end_date() {
		return a_end_date;
	}


	public void setA_end_date(String a_end_date) {
		this.a_end_date = a_end_date;
	}


	public String getA_end_time() {
		return a_end_time;
	}


	public void setA_end_time(String a_end_time) {
		this.a_end_time = a_end_time;
	}


	public String getA_end_time_m() {
		return a_end_time_m;
	}


	public void setA_end_time_m(String a_end_time_m) {
		this.a_end_time_m = a_end_time_m;
	}


	public String getStudy_title() {
		return study_title;
	}


	public void setStudy_title(String study_title) {
		this.study_title = study_title;
	}


	public int getA_weeks() {
		return a_weeks;
	}


	public void setA_weeks(int a_weeks) {
		this.a_weeks = a_weeks;
	}


	public int getUser_idx() {
		return user_idx;
	}


	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}


	public int getStudy_idx() {
		return study_idx;
	}


	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}



	public String getMemberStatus() {
		return memberStatus;
	}



	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	

}
