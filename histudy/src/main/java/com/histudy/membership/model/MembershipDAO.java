package com.histudy.membership.model;

public interface MembershipDAO {
	int insertPayment(MembershipPaymentDTO paymentDTO);
	String membershipGrade(int user_idx);
}
