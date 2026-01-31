package com.histudy.user.model;

import org.mybatis.spring.SqlSessionTemplate;

public class userDAOImple implements userDAO {

	private SqlSessionTemplate sqlSession;

	public userDAOImple(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	private static final String NAMESPACE = "com.histudy.user";

	// 1. 이 메서드 하나만 남기고 나머지는 지우세요!
	@Override
	public void userSignUp(UserDTO dto) {
		sqlSession.insert(NAMESPACE + ".userSignupId", dto);
	}

	@Override
	public UserDTO userSignin(UserDTO dto) {
		return sqlSession.selectOne(NAMESPACE + ".userSigninId", dto);
	}

	@Override
	public String userIdFind(UserDTO dto) {
		return sqlSession.selectOne(NAMESPACE + ".userFindIdId", dto);
	}

	@Override
	public String userPwdFind(UserDTO dto) {
		return sqlSession.selectOne(NAMESPACE + ".userPwdFindId", dto);
	}
    
    
}
