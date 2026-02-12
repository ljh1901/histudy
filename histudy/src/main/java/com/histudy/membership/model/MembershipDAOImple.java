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
	@Override
	public String membershipGrade(int user_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.histudy.membership.model.MembershipDAO.membershipGrade",user_idx);
	}
}
