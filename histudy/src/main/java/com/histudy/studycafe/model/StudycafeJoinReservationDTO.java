package com.histudy.studycafe.model;

public class StudycafeJoinReservationDTO {
	private int user_idx;
	private int seat_idx;
	private String reservation_starttime;
	private String reservation_endtime;
	private String reservation_status;
	private int ticket_idx;
	private String payment_id;
	private String store_id; // »óÁ¡ ¹øÈ£
	private String orderName; // ÁÖ¹®Á¤º¸
	private int paid; // ÁöºÒ±Ý¾×
	private String paid_at;
	private String pay_status;
	
	public StudycafeJoinReservationDTO() {
		super();
	}
	
	public StudycafeJoinReservationDTO(int user_idx, int seat_idx, String reservation_starttime,
			String reservation_endtime, String reservation_status, int ticket_idx, String payment_id, String store_id,
			String orderName, int paid, String paid_at, String pay_status) {
		super();
		this.user_idx = user_idx;
		this.seat_idx = seat_idx;
		this.reservation_starttime = reservation_starttime;
		this.reservation_endtime = reservation_endtime;
		this.reservation_status = reservation_status;
		this.ticket_idx = ticket_idx;
		this.payment_id = payment_id;
		this.store_id = store_id;
		this.orderName = orderName;
		this.paid = paid;
		this.paid_at = paid_at;
		this.pay_status = pay_status;
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
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public int getPaid() {
		return paid;
	}
	public void setPaid(int paid) {
		this.paid = paid;
	}
	public String getPaid_at() {
		return paid_at;
	}
	public void setPaid_at(String paid_at) {
		this.paid_at = paid_at;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	
}
