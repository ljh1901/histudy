package com.histudy.study.model;

public class StudyApplyDTO {
	
	private int sa_idx;
	private String sa_intro;
	private String sa_status;
	private String sa_reason;
	private int user_idx;
	private int study_idx;
	
	public StudyApplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public StudyApplyDTO(int sa_idx, String sa_intro, String sa_status, String sa_reason, int user_idx, int study_idx) {
		super();
		this.sa_idx = sa_idx;
		this.sa_intro = sa_intro;
		this.sa_status = sa_status;
		this.sa_reason = sa_reason;
		this.user_idx = user_idx;
		this.study_idx = study_idx;
	}

	public int getSa_idx() {
		return sa_idx;
	}

	public void setSa_idx(int sa_idx) {
		this.sa_idx = sa_idx;
	}

	public String getSa_intro() {
		return sa_intro;
	}

	public void setSa_intro(String sa_intro) {
		this.sa_intro = sa_intro;
	}

	public String getSa_status() {
		return sa_status;
	}

	public void setSa_status(String sa_status) {
		this.sa_status = sa_status;
	}

	public String getSa_reason() {
		return sa_reason;
	}

	public void setSa_reason(String sa_reason) {
		this.sa_reason = sa_reason;
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
	
	

}
