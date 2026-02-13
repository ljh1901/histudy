package com.histudy.studycafe.model;

public class StudycafeReservationDTO {
	private int user_idx;
	private int seat_idx;
	private String reservation_starttime;
	private String reservation_endtime;
	private String reservation_status;
	private int ticket_idx;
	private String paymentId;
	public StudycafeReservationDTO() {
		super();
	}
	public StudycafeReservationDTO(int user_idx, int seat_idx, String reservation_starttime, String reservation_endtime,
			String reservation_status, int ticket_idx, String paymentId) {
		super();
		this.user_idx = user_idx;
		this.seat_idx = seat_idx;
		this.reservation_starttime = reservation_starttime;
		this.reservation_endtime = reservation_endtime;
		this.reservation_status = reservation_status;
		this.ticket_idx = ticket_idx;
		this.paymentId = paymentId;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getSeat_idx() {
		return seat_idx;
	}
	public void setSeat_idx(int seat_idx) {
		this.seat_idx = seat_idx;
	}
	public String getReservation_starttime() {
		return reservation_starttime;
	}
	public void setReservation_starttime(String reservation_starttime) {
		this.reservation_starttime = reservation_starttime;
	}
	public String getReservation_endtime() {
		return reservation_endtime;
	}
	public void setReservation_endtime(String reservation_endtime) {
		this.reservation_endtime = reservation_endtime;
	}
	public String getReservation_status() {
		return reservation_status;
	}
	public void setReservation_status(String reservation_status) {
		this.reservation_status = reservation_status;
	}
	public int getTicket_idx() {
		return ticket_idx;
	}
	public void setTicket_idx(int ticket_idx) {
		this.ticket_idx = ticket_idx;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	
}
