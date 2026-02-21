package com.histudy.inquiry.model;

import java.sql.Date;

public class InquiryDTO {

	private int inquiry_idx;
	private int user_idx;
	private int inquiry_category_idx;
	private String inquiry_title;
	private String inquiry_content;
	private Date inquiry_date;
	private String inquiry_status;

	private String inquiry_reply;
	private Date inquiry_reply_date;
	private String inquiry_category_name;
	private String user_name;
	private String user_id;

	public InquiryDTO() {
		
	}

	public InquiryDTO(int inquiry_idx, int user_idx, int inquiry_category_idx, String inquiry_title,
			String inquiry_content, Date inquiry_date, String inquiry_status, String inquiry_reply,
			Date inquiry_reply_date, String inquiry_category_name, String user_name,String user_id) {
		super();
		this.inquiry_idx = inquiry_idx;
		this.user_idx = user_idx;
		this.inquiry_category_idx = inquiry_category_idx;
		this.inquiry_title = inquiry_title;
		this.inquiry_content = inquiry_content;
		this.inquiry_date = inquiry_date;
		this.inquiry_status = inquiry_status;
		this.inquiry_reply = inquiry_reply;
		this.inquiry_reply_date = inquiry_reply_date;
		this.inquiry_category_name = inquiry_category_name;
		this.user_name = user_name;
		this.user_id = user_id;
	}

	public int getInquiry_idx() {
		return inquiry_idx;
	}

	public void setInquiry_idx(int inquiry_idx) {
		this.inquiry_idx = inquiry_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getInquiry_category_idx() {
		return inquiry_category_idx;
	}

	public void setInquiry_category_idx(int inquiry_category_idx) {
		this.inquiry_category_idx = inquiry_category_idx;
	}

	public String getInquiry_title() {
		return inquiry_title;
	}

	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}

	public Date getInquiry_date() {
		return inquiry_date;
	}

	public void setInquiry_date(Date inquiry_date) {
		this.inquiry_date = inquiry_date;
	}

	public String getInquiry_status() {
		return inquiry_status;
	}

	public void setInquiry_status(String inquiry_status) {
		this.inquiry_status = inquiry_status;
	}

	public String getInquiry_reply() {
		return inquiry_reply;
	}

	public void setInquiry_reply(String inquiry_reply) {
		this.inquiry_reply = inquiry_reply;
	}

	public Date getInquiry_reply_date() {
		return inquiry_reply_date;
	}

	public void setInquiry_reply_date(Date inquiry_reply_date) {
		this.inquiry_reply_date = inquiry_reply_date;
	}

	public String getInquiry_category_name() {
		return inquiry_category_name;
	}

	public void setInquiry_category_name(String inquiry_category_name) {
		this.inquiry_category_name = inquiry_category_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	

	
}
