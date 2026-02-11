package com.histudy.membership.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MembershipDAOImple implements MembershipDAO {
	private SqlSessionTemplate sqlSession;
	public MembershipDAOImple(SqlSessionTemplate sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public int insertPayment(MembershipPaymentDTO paymentDTO) {
		return sqlSession.insert("insertPayment",paymentDTO);
	}
}
