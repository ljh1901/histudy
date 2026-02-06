package com.histudy.lecture.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class LectureDAOImple implements LectureDAO {
   private SqlSessionTemplate sqlSession;
   public LectureDAOImple(SqlSessionTemplate sqlSession) {
      this.sqlSession=sqlSession;
   }
   @Override
   public List<LectureDTO> lectureList() {
      return sqlSession.selectList("lectureList");
   }
   @Override
	public List<LectureDTO> lectureList(Map<String, Integer> map) {
	      return sqlSession.selectList("lectureList",map);
	}
   @Override
   public LectureDTO lectureContent(int idx) {
      return sqlSession.selectOne("com.histudy.lecture.lectureContent",idx);
   }
   @Override
   public int lectureNoteInsert(LectureNoteDTO dto) {
      return sqlSession.insert("com.histudy.lecture.lectureNoteInsert",dto);
   }
   @Override
	public int getTotalCnt() {
		return sqlSession.selectOne("getTotalCnt");
	}
   @Override
	public List<LectureReviewDTO> reviewList(int lecture_idx) {
		return sqlSession.selectList("lectureContent");
	}
   @Override
	public int reviewInsert(LectureReviewDTO dto) {
		return sqlSession.insert("lectureContent",dto);
	}
   @Override
	public int lectureLike(LectureLikeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("lectureContent",dto);
	}
}
