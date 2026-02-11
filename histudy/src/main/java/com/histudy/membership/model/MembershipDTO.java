package com.histudy.membership.model;

public class MembershipDTO {
	private int membership_idx;
	private String membership_name;
	public int getMembership_idx() {
		return membership_idx;
	}
	public void setMembership_idx(int membership_idx) {
		this.membership_idx = membership_idx;
	}
	public String getMembership_name() {
		return membership_name;
	}
	public void setMembership_name(String membership_name) {
		this.membership_name = membership_name;
	}
	public MembershipDTO() {
		// TODO Auto-generated constructor stub
	}
	public MembershipDTO(int membership_idx, String membership_name) {
		super();
		this.membership_idx = membership_idx;
		this.membership_name = membership_name;
	}
	
}
