package com.histudy.user.model;

import org.mybatis.spring.SqlSessionTemplate;

public class UserDAOImple implements UserDAO {

	private static final String NAMESPACE = "com.histudy.user";

	private SqlSessionTemplate sqlSession;

	public UserDAOImple(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void userSignUp(UserDTO dto) {
		sqlSession.insert(NAMESPACE + ".userSignUpId", dto);

	}

	public UserDTO userSignIn(UserDTO dto) {
		return sqlSession.selectOne(NAMESPACE + ".userSignInId", dto);

	}

	public int userCheckId(String user_id) {
		return sqlSession.selectOne(NAMESPACE + ".userCheckIdId", user_id);
	}
}
