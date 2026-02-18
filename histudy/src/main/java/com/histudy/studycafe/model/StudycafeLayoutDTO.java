package com.histudy.studycafe.model;

public class StudycafeLayoutDTO {
	private int layout_idx;
	private int studycafe_idx;
	private double layout_x;
	private double layout_y;
	private double layout_w;
	private double layout_h;
	private String layout_type;
	
	public StudycafeLayoutDTO() {
		super();
	}
	
	public StudycafeLayoutDTO(int layout_idx, int studycafe_idx, 
			double layout_x, double layout_y, double layout_w,
			double layout_h, String layout_type) {
		super();
		this.layout_idx = layout_idx;
		this.studycafe_idx = studycafe_idx;
		this.layout_x = layout_x;
		this.layout_y = layout_y;
		this.layout_w = layout_w;
		this.layout_h = layout_h;
		this.layout_type = layout_type;
	}
	
	public int getLayout_idx() {
		return layout_idx;
	}
	public void setLayout_idx(int layout_idx) {
		this.layout_idx = layout_idx;
	}
	public int getStudycafe_idx() {
		return studycafe_idx;
	}
	public void setStudycafe_idx(int studycafe_idx) {
		this.studycafe_idx = studycafe_idx;
	}
	public double getLayout_x() {
		return layout_x;
	}
	public void setLayout_x(double layout_x) {
		this.layout_x = layout_x;
	}
	public double getLayout_y() {
		return layout_y;
	}
	public void setLayout_y(double layout_y) {
		this.layout_y = layout_y;
	}
	public double getLayout_w() {
		return layout_w;
	}
	public void setLayout_w(double layout_w) {
		this.layout_w = layout_w;
	}
	public double getLayout_h() {
		return layout_h;
	}
	public void setLayout_h(double layout_h) {
		this.layout_h = layout_h;
	}
	public String getLayout_type() {
		return layout_type;
	}
	public void setLayout_type(String layout_type) {
		this.layout_type = layout_type;
	}
	
}
