package com.histudy.lecture.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.histudy.lecture.model.LectureDAO;
import com.histudy.lecture.model.LectureDTO;
import com.histudy.lecture.model.LectureLikeDTO;
import com.histudy.lecture.model.LectureNoteDTO;
import com.histudy.lecture.model.LectureReviewDTO;
public class LectureServiceImple implements LectureService {
   private LectureDAO lectureDao;
   public LectureServiceImple(LectureDAO lectureDao) {
      this.lectureDao=lectureDao;
   }
   @Override
   public List<LectureDTO> lectureList(int cp, int ls) throws Exception{
	  int start=(cp-1)*ls+1;
	  int end=cp*ls;
	  java.util.Map<String, Integer> map=new HashMap<>();
	  map.put("start", start);
	  map.put("end", end);
	  map.put("ls", ls);
	  map.put("cp", cp);
	  
	  List<LectureDTO> lists=lectureDao.lectureList(map);
      return lists;
   }
   @Override
   public LectureDTO lectureContent(int idx) {
      return lectureDao.lectureContent(idx);
   }
   @Override
   public int lectureNoteInsert(LectureNoteDTO dto) {
      return lectureDao.lectureNoteInsert(dto);
   }
   @Override
	public int getTotalCnt() {
	   return lectureDao.getTotalCnt();
	}
   @Override
	public List<LectureReviewDTO> reviewList(int lecture_idx) {
		return lectureDao.reviewList(lecture_idx);
	}
   @Override
	public int reviewInsert(LectureReviewDTO dto) {
		return lectureDao.reviewInsert(dto);
	}
   @Override
	public int lectureLike(LectureLikeDTO dto) {
		return lectureDao.lectureLike(dto);
	}
}
