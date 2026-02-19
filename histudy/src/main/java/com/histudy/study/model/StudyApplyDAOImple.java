package com.histudy.study.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class StudyApplyDAOImple implements StudyApplyDAO {
	
	private SqlSessionTemplate sqlSession;
	
	public StudyApplyDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
		
	}
	
	/** 스터디 신청 */
	@Override
	public int applyStudy(StudyApplyDTO dto) {
		int count = sqlSession.insert("StudyApply", dto);
		return count;
	}
	
	/** 스터디 신청 버튼 눌렀을 때 중복 방지용 */
	@Override
	public int StudyApplyCheck(Map<String, Integer> map) {
		int count = sqlSession.selectOne("StudyApplyCheck", map);
		return count;
	}
	
	/** 자신이 개설한 스터디에 신청을 막기 위함 */
	@Override
	public int StudyApplyCheck2(int study_idx) {
		int user_idx = sqlSession.selectOne("StudyApplyCheck2", study_idx);
		return user_idx;
	}
	
	 // 밑에 두개 수정해야돼
	 /** 활동중 로직을 위해 사용자가 로그인 했을때 업데이트 */
	@Override
	public int userLoginTimeUpdate(int user_idx) {
		int count = sqlSession.update("userLoginTimeUpdate", user_idx);
		return count;
	}
	
	@Override
	public int userLogoutTimeUpdate(int user_idx) {
		int count = sqlSession.update("userLogoutTimeUpdate", user_idx);
		return count;
	}

}
