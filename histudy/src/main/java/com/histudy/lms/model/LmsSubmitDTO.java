package com.histudy.lms.model;

public class LmsSubmitDTO {

	private int as_idx;
	private String as_content;
	private String as_fname;
	private String as_status;
	private String as_start_date;
	private String as_update_date;
	private int user_idx;
	private int a_idx;
	
	public LmsSubmitDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public LmsSubmitDTO(int as_idx, String as_content, String as_fname, String as_status, String as_start_date,
			String as_update_date, int user_idx, int a_idx) {
		super();
		this.as_idx = as_idx;
		this.as_content = as_content;
		this.as_fname = as_fname;
		this.as_status = as_status;
		this.as_start_date = as_start_date;
		this.as_update_date = as_update_date;
		this.user_idx = user_idx;
		this.a_idx = a_idx;
	}
	
	public int getAs_idx() {
		return as_idx;
	}
	public void setAs_idx(int as_idx) {
		this.as_idx = as_idx;
	}
	public String getAs_content() {
		return as_content;
	}
	public void setAs_content(String as_content) {
		this.as_content = as_content;
	}
	public String getAs_fname() {
		return as_fname;
	}
	public void setAs_fname(String as_fname) {
		this.as_fname = as_fname;
	}
	public String getAs_status() {
		return as_status;
	}
	public void setAs_status(String as_status) {
		this.as_status = as_status;
	}
	public String getAs_start_date() {
		return as_start_date;
	}
	public void setAs_start_date(String as_start_date) {
		this.as_start_date = as_start_date;
	}
	public String getAs_update_date() {
		return as_update_date;
	}
	public void setAs_update_date(String as_update_date) {
		this.as_update_date = as_update_date;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getA_idx() {
		return a_idx;
	}
	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}
	
	
}
