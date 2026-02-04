package com.histudy.study.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class StudyDAOImple implements StudyDAO {
	
	private SqlSessionTemplate sqlSession;
	
	public StudyDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public int createStudy(StudyDTO dto) {
		int count = sqlSession.insert("insertStudy", dto);
		return count;
	}
	
	@Override
	public List<StudyDTO> getStudyList() {
		List<StudyDTO> lists = sqlSession.selectList("selectStudyList");
		return lists;
	}
}
