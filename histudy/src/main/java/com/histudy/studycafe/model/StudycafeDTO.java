package com.histudy.studycafe.model;

public class StudycafeDTO {
	private int studycafe_idx; 
	private String studycafe_name; 
	private double studycafe_lat; 
	private double studycafe_lng;
	public StudycafeDTO() {
		super();
	}
	public StudycafeDTO(int studycafe_idx, String studycafe_name, double studycafe_lat, double studycafe_lng) {
		super();
		this.studycafe_idx = studycafe_idx;
		this.studycafe_name = studycafe_name;
		this.studycafe_lat = studycafe_lat;
		this.studycafe_lng = studycafe_lng;
	}
	public int getStudycafe_idx() {
		return studycafe_idx;
	}
	public void setStudycafe_idx(int studycafe_idx) {
		this.studycafe_idx = studycafe_idx;
	}
	public String getStudycafe_name() {
		return studycafe_name;
	}
	public void setStudycafe_name(String studycafe_name) {
		this.studycafe_name = studycafe_name;
	}
	public double getStudycafe_lat() {
		return studycafe_lat;
	}
	public void setStudycafe_lat(double studycafe_lat) {
		this.studycafe_lat = studycafe_lat;
	}
	public double getStudycafe_lng() {
		return studycafe_lng;
	}
	public void setStudycafe_lng(double studycafe_lng) {
		this.studycafe_lng = studycafe_lng;
	}
	
	
}
