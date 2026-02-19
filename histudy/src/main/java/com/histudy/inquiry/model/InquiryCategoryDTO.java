package com.histudy.inquiry.model;

public class InquiryCategoryDTO {

	private int inquiry_category_idx;
	private String inquiry_category_name;
	
	public InquiryCategoryDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public InquiryCategoryDTO(int inquiry_category_idx, String inquiry_category_name) {
		super();
		this.inquiry_category_idx = inquiry_category_idx;
		this.inquiry_category_name = inquiry_category_name;
	}

	public int getInquiry_category_idx() {
		return inquiry_category_idx;
	}

	public void setInquiry_category_idx(int inquiry_category_idx) {
		this.inquiry_category_idx = inquiry_category_idx;
	}	

	public String getInquiry_category_name() {
		return inquiry_category_name;
	}

	public void setInquiry_category_name(String inquiry_category_name) {
		this.inquiry_category_name = inquiry_category_name;
	}
	
	
}
