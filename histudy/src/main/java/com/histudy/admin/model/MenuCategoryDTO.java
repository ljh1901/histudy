package com.histudy.admin.model;

public class MenuCategoryDTO {

	private int menu_category_idx;
	private String menu_category_name;
	
	public MenuCategoryDTO(int menu_category_idx, String menu_category_name) {
		super();
		this.menu_category_idx = menu_category_idx;
		this.menu_category_name = menu_category_name;
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
	
	
}
