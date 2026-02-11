package com.histudy.membership.service;

import com.histudy.membership.model.MembershipDAO;
import com.histudy.membership.model.MembershipPaymentDTO;

public class MembershipServiceImple implements MembershipService {
	private MembershipDAO membershipDao;

	public MembershipServiceImple(MembershipDAO membershipDao) {
		this.membershipDao=membershipDao;
	}
	@Override
	public int insertPayment(MembershipPaymentDTO paymentDTO) {
		return membershipDao.insertPayment(paymentDTO);
	}

}
