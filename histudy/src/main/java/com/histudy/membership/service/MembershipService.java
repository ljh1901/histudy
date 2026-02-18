package com.histudy.membership.service;

import java.util.List;

import com.histudy.membership.model.MembershipPaymentDTO;

public interface MembershipService {
	int insertPrimium(MembershipPaymentDTO paymentDTO);
	int insertBasic(int user_idx);
	String membershipGrade(int user_idx);
	public List<MembershipPaymentDTO> getPayment(int user_idx);

}
