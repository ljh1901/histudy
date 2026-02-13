package com.histudy.studycafe.model;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class PayDTO {
	private String paymentId;
	private String storeId;
	private String channelKey;
	private String orderName;
	private int paid;
	private int user_idx;
	private String pay_method;
	private String pay_status;
	private Timestamp statusChangedAt;
	private Timestamp paidAt;
	private int totalAmount;
	private int supply;
	private int vat;
	private String pgProvider;
	public PayDTO() {
		super();
	}
	
	public PayDTO(String paymentId, String storeId, String channelKey, String orderName, int paid, int user_idx,
			String pay_method, String pay_status, Timestamp statusChangedAt, Timestamp paidAt, int totalAmount,
			int supply, int vat, String pgProvider) {
		super();
		this.paymentId = paymentId;
		this.storeId = storeId;
		this.channelKey = channelKey;
		this.orderName = orderName;
		this.paid = paid;
		this.user_idx = user_idx;
		this.pay_method = pay_method;
		this.pay_status = pay_status;
		this.statusChangedAt = statusChangedAt;
		this.paidAt = paidAt;
		this.totalAmount = totalAmount;
		this.supply = supply;
		this.vat = vat;
		this.pgProvider = pgProvider;
	}

	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	public String getChannelKey() {
		return channelKey;
	}
	public void setChannelKey(String channelKey) {
		this.channelKey = channelKey;
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
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public Timestamp getStatusChangedAt() {
		return statusChangedAt;
	}
	public void setStatusChangedAt(Timestamp statusChangedAt) {
		this.statusChangedAt = statusChangedAt;
	}
	public Timestamp getPaidAt() {
		return paidAt;
	}
	public void setPaidAt(Timestamp paidAt) {
		this.paidAt = paidAt;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getSupply() {
		return supply;
	}
	public void setSupply(int supply) {
		this.supply = supply;
	}
	public int getVat() {
		return vat;
	}
	public void setVat(int vat) {
		this.vat = vat;
	}
	public String getPgProvider() {
		return pgProvider;
	}
	public void setPgProvider(String pgProvider) {
		this.pgProvider = pgProvider;
	}
	


	
	
}
