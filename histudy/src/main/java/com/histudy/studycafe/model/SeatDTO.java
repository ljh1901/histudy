package com.histudy.studycafe.model;

public class SeatDTO {
	private int seat_idx;
	private String seat_num;
	private double seat_x;
	private double seat_y;
	private double seat_w;
	private double seat_h;
	private String seat_type;
	private String seat_status;
	private int studycafe_idx;
	public SeatDTO() {
		super();
	}
	public SeatDTO(int seat_idx, String seat_num, double seat_x, double seat_y, double seat_w, double seat_h,
			String seat_type, String seat_status, int studycafe_idx) {
		super();
		this.seat_idx = seat_idx;
		this.seat_num = seat_num;
		this.seat_x = seat_x;
		this.seat_y = seat_y;
		this.seat_w = seat_w;
		this.seat_h = seat_h;
		this.seat_type = seat_type;
		this.seat_status = seat_status;
		this.studycafe_idx = studycafe_idx;
	}
	public int getSeat_idx() {
		return seat_idx;
	}
	public void setSeat_idx(int seat_idx) {
		this.seat_idx = seat_idx;
	}
	public String getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}
	public double getSeat_x() {
		return seat_x;
	}
	public void setSeat_x(double seat_x) {
		this.seat_x = seat_x;
	}
	public double getSeat_y() {
		return seat_y;
	}
	public void setSeat_y(double seat_y) {
		this.seat_y = seat_y;
	}
	public double getSeat_w() {
		return seat_w;
	}
	public void setSeat_w(double seat_w) {
		this.seat_w = seat_w;
	}
	public double getSeat_h() {
		return seat_h;
	}
	public void setSeat_h(double seat_h) {
		this.seat_h = seat_h;
	}
	public String getSeat_type() {
		return seat_type;
	}
	public void setSeat_type(String seat_type) {
		this.seat_type = seat_type;
	}
	public String getSeat_status() {
		return seat_status;
	}
	public void setSeat_status(String seat_status) {
		this.seat_status = seat_status;
	}
	public int getStudycafe_idx() {
		return studycafe_idx;
	}
	public void setStudycafe_idx(int studycafe_idx) {
		this.studycafe_idx = studycafe_idx;
	}
	
}
