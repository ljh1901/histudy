package com.histudy.admin.model;

public class NoticeCategoryDTO {

	private int notice_category_idx;
	private String notice_category_name;
	
	public NoticeCategoryDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public NoticeCategoryDTO(int notice_category_idx, String notice_category_name) {
		super();
		this.notice_category_idx = notice_category_idx;
		this.notice_category_name = notice_category_name;
	}
	public int getNotice_category_idx() {
		return notice_category_idx;
	}
	public void setNotice_category_idx(int notice_category_idx) {
		this.notice_category_idx = notice_category_idx;
	}
	public String getNotice_category_name() {
		return notice_category_name;
	}
	public void setNotice_category_name(String notice_category_name) {
		this.notice_category_name = notice_category_name;
	}
	
	
}
