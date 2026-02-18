package com.histudy.membership.model;

import java.util.List;

public interface MembershipDAO {
	int insertPrimium(MembershipPaymentDTO paymentDTO);
	int insertBasic(int user_idx);
	String membershipGrade(int user_idx);
	public List<MembershipPaymentDTO> getPayment(int user_idx);
}
