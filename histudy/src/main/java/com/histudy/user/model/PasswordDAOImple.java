package com.histudy.user.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PasswordDAOImple implements PasswordDAO {
	@Autowired
	private SqlSessionTemplate sqlSession; // MyBatis 실행 객체

	public PasswordDAOImple(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@Override
	public UserDTO getUserInfo(int userIdx) {
		// 기존 UserDTO를 사용하여 사용자 정보 한 행을 가져옵니다.
		return sqlSession.selectOne("getUserInfoForPw", userIdx);
	}

	@Override
	public int updatePassword(int userIdx, String newPw) {
		// 여러 개의 파라미터를 보낼 때는 Map을 사용합니다.
		Map<String, Object> map = new HashMap<>();
		map.put("user_idx", userIdx);
		map.put("new_pw", newPw);
		return sqlSession.update("updateUserPw", map);
	}
}
