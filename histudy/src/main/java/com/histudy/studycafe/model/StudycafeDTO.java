package com.histudy.studycafe.model;

public class StudycafeDTO {
	private int studycafe_idx; 
	private String studycafe_name; 
	private double studycafe_lat; 
	private double studycafe_lng;
	private String studycafe_addr;
	private int all;
	private int avaliable;
	public StudycafeDTO() {
		super();
	}
	
	public StudycafeDTO(int studycafe_idx, String studycafe_name, double studycafe_lat, double studycafe_lng,
			String studycafe_addr, int all, int avaliable) {
		super();
		this.studycafe_idx = studycafe_idx;
		this.studycafe_name = studycafe_name;
		this.studycafe_lat = studycafe_lat;
		this.studycafe_lng = studycafe_lng;
		this.studycafe_addr = studycafe_addr;
		this.all = all;
		this.avaliable = avaliable;
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
	public String getStudycafe_addr() {
		return studycafe_addr;
	}
	public void setStudycafe_addr(String studycafe_addr) {
		this.studycafe_addr = studycafe_addr;
	}
	public int getAll() {
		return all;
	}
	public void setAll(int all) {
		this.all = all;
	}
	public int getAvaliable() {
		return avaliable;
	}
	public void setAvaliable(int avaliable) {
		this.avaliable = avaliable;
	}

	
	
}
