package com.histudy.user.model;

import org.mybatis.spring.SqlSessionTemplate;

public class UserDAOImple implements UserDAO {

	private SqlSessionTemplate sqlSession;

	public UserDAOImple(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	private static final String NAMESPACE = "com.histudy.user";

	public void userSignUp(UserDTO dto) {
		sqlSession.insert(NAMESPACE + ".userSignupId", dto);
	}   
}
