package com.histudy.admin.model;

public class FaqDTO {

	private int faq_idx;
	private int menu_category_idx;
	private String menu_category_name;
	private String faq_title;
	private String faq_content;
	
	public FaqDTO() {
	}
	
	public FaqDTO(int faq_idx, int menu_category_idx, String menu_category_name, String faq_title, String faq_content) {
		super();
		this.faq_idx = faq_idx;
		this.menu_category_idx = menu_category_idx;
		this.menu_category_name = menu_category_name;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
	}

	public int getFaq_idx() {
		return faq_idx;
	}

	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
	}

	public int getMenu_category_idx() {
		return menu_category_idx;
	}

	public void setMenu_category_idx(int menu_category_idx) {
		this.menu_category_idx = menu_category_idx;
	}

	public String getMenu_category_name() {
		return menu_category_name;
	}

	public void setMenu_category_name(String menu_category_name) {
		this.menu_category_name = menu_category_name;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
}
