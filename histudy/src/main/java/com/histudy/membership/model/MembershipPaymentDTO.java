package com.histudy.membership.model;
import java.sql.*;
public class MembershipPaymentDTO {
	private int payment_idx;
	private String payment_status;
	private int payment_amount;
	Date payment_date;
	private int user_idx;
	private int membership_idx;
	public MembershipPaymentDTO() {
		// TODO Auto-generated constructor stub
	}
	public MembershipPaymentDTO(int payment_idx, String payment_status, int payment_amount, Date payment_date,
			int user_idx, int membership_idx) {
		super();
		this.payment_idx = payment_idx;
		this.payment_status = payment_status;
		this.payment_amount = payment_amount;
		this.payment_date = payment_date;
		this.user_idx = user_idx;
		this.membership_idx = membership_idx;
	}
	public int getPayment_idx() {
		return payment_idx;
	}
	public void setPayment_idx(int payment_idx) {
		this.payment_idx = payment_idx;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public int getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(int payment_amount) {
		this.payment_amount = payment_amount;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getMembership_idx() {
		return membership_idx;
	}
	public void setMembership_idx(int membership_idx) {
		this.membership_idx = membership_idx;
	}
	
		 	
}
