package com.histudy.lecture.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class LectureDAOImple implements LectureDAO {
	private SqlSessionTemplate sqlSession;
	public LectureDAOImple(SqlSessionTemplate sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public List<LectureDTO> lectureSel() {
		List<LectureDTO> lists=sqlSession.selectList("lectureSel");
		return lists;
	}

}
