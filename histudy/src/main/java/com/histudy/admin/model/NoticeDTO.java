package com.histudy.admin.model;

import java.sql.*;

public class NoticeDTO {

	private int notice_idx;
	private int user_idx;
	private String notice_title;
	private String notice_content;
	private String notice_file;
	private Date notice_writedate;
	private int notice_category_idx;
	
	private String notice_category_name;
	
	public NoticeDTO() {
		
	}

	public NoticeDTO(int notice_idx, int user_idx, String notice_title, String notice_content, String notice_file,
			Date notice_writedate, int notice_category_idx, String notice_category_name) {
		super();
		this.notice_idx = notice_idx;
		this.user_idx = user_idx;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_file = notice_file;
		this.notice_writedate = notice_writedate;
		this.notice_category_idx = notice_category_idx;
		this.notice_category_name = notice_category_name;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_file() {
		return notice_file;
	}

	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}

	public Date getNotice_writedate() {
		return notice_writedate;
	}

	public void setNotice_writedate(Date notice_writedate) {
		this.notice_writedate = notice_writedate;
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
