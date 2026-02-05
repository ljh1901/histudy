package com.histudy.user.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


public class UserDAOImple implements UserDAO {

	private SqlSessionTemplate sqlSession;

	// 생성자 주입
	public UserDAOImple(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int userSignUp(UserDTO dto) {
		return sqlSession.insert("userSignUpSQL", dto);
	}

	@Override
	public String userSignIn(String user_id) {
		return sqlSession.selectOne("userSignInSQL", user_id);
	}

	@Override
	public int userCheckId(String user_id) {
		return sqlSession.selectOne("userCheckIdSQL", user_id);
	}

	@Override
	public int userCheckEmail(String user_email) {
		return sqlSession.selectOne("userCheckEmailSQL", user_email);
	}
//마이페이지 관련
	@Override
	public UserDTO userInfo(String user_id) {
	
		return sqlSession.selectOne("mypage.userInfoSQL", user_id);
	}
	
	@Override
	public int updateProfile(UserDTO dto) {
		return sqlSession.update("mypage.updateProfileSQL", dto);
	}
}