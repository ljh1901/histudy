package com.histudy.membership.model;

public interface MembershipDAO {
	int insertPrimium(MembershipPaymentDTO paymentDTO);
	int insertBasic(int user_idx);
	String membershipGrade(int user_idx);
}
