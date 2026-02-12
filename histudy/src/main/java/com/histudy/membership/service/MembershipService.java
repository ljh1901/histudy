package com.histudy.membership.service;

import com.histudy.membership.model.MembershipPaymentDTO;

public interface MembershipService {
	int insertPayment(MembershipPaymentDTO paymentDTO);
	String membershipGrade(int user_idx);
}
