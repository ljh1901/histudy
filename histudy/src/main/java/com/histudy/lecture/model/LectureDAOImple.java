package com.histudy.lecture.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class LectureDAOImple implements LectureDAO {
	private SqlSessionTemplate sqlSession;
	public LectureDAOImple(SqlSessionTemplate sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public List<LectureDTO> lectureList() {
		return sqlSession.selectList("com.histudy.lecture.lectureList");
	}
	@Override
	public LectureDTO lectureContent(int idx) {
		return sqlSession.selectOne("com.histudy.lecture.lectureContent",idx);
	}
	@Override
	public int lectureNoteInsert(LectureNoteDTO dto) {
		return sqlSession.insert("com.histudy.lecture.lectureNoteInsert",dto);
	}
}
