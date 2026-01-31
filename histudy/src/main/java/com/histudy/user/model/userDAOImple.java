package com.histudy.user.model;

import org.mybatis.spring.SqlSessionTemplate;

public class UserDAOImple implements UserDAO {

	private SqlSessionTemplate sqlSession;

	public UserDAOImple(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	private static final String NAMESPACE = "com.histudy.user";

	// 1. 이 메서드 하나만 남기고 나머지는 지우세요!
	@Override
	public void userSignUp(UserDTO dto) {
		sqlSession.insert(NAMESPACE + ".userSignupId", dto);
	}   
}
