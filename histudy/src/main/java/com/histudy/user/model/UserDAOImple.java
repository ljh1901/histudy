package com.histudy.user.model;

import org.mybatis.spring.SqlSessionTemplate;

public class UserDAOImple implements UserDAO {

	private SqlSessionTemplate sqlSession;

	public UserDAOImple(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int userSignUp(UserDTO dto) {
		int result = sqlSession.insert("userSignUpSQL", dto);
		return result;
	}

	public String userSignIn(String user_id) {
		return sqlSession.selectOne("userSignInSQL", user_id);

	}

	public int userCheckId(String user_id) {
		return sqlSession.selectOne("userCheckIdSQL", user_id);
	}
	@Override
	public UserDTO userInfo(String user_id) {
		return sqlSession.selectOne("userInfoSQL",user_id);
	}

	@Override
	public int userCheckEmail(String user_email) {
	    return sqlSession.selectOne("userCheckEmailSQL", user_email);
	}
}
