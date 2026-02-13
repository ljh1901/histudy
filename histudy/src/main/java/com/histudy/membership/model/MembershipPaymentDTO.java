package com.histudy.membership.model;
import java.sql.*;
public class MembershipPaymentDTO {
	private int payment_idx;
	private String payNum;
	private String payment_method;
	private String payment_status;
	private int payment_amount;
	Date payment_date;
	private int tax_free;
	private Date end_date;
	private int user_idx;
	private int membership_idx;
	public MembershipPaymentDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getTax_free() {
		return tax_free;
	}

	public void setTax_free(int tax_free) {
		this.tax_free = tax_free;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public int getPayment_idx() {
		return payment_idx;
	}
	public void setPayment_idx(int payment_idx) {
		this.payment_idx = payment_idx;
	}
	public String getPayNum() {
		return payNum;
	}
	public void setPayNum(String payNum) {
		this.payNum = payNum;
	}
	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
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
	public MembershipPaymentDTO(int payment_idx, String payNum, String payment_method, String payment_status,
			int payment_amount, Date payment_date, int tax_free, Date end_date, int user_idx, int membership_idx) {
		super();
		this.payment_idx = payment_idx;
		this.payNum = payNum;
		this.payment_method = payment_method;
		this.payment_status = payment_status;
		this.payment_amount = payment_amount;
		this.payment_date = payment_date;
		this.tax_free = tax_free;
		this.end_date = end_date;
		this.user_idx = user_idx;
		this.membership_idx = membership_idx;
	}
	
}
