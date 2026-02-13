package com.histudy.study.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class StudyApplyDAOImple implements StudyApplyDAO {
	
	private SqlSessionTemplate sqlSession;
	
	public StudyApplyDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
		
	}
	
	@Override
	public int applyStudy(StudyApplyDTO dto) {
		int count = sqlSession.insert("StudyApply", dto);
		return count;
	}
	
	@Override
	public int StudyApplyCheck(Map<String, Integer> map) {
		int count = sqlSession.selectOne("StudyApplyCheck", map);
		return count;
	}
	
	@Override
	public int StudyApplyCheck2(int study_idx) {
		int user_idx = sqlSession.selectOne("StudyApplyCheck2", study_idx);
		return user_idx;
	}

}
