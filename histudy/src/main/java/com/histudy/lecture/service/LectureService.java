package com.histudy.lecture.service;

import java.util.List;
import java.util.Map;

import com.histudy.lecture.model.LectureDTO;
import com.histudy.lecture.model.LectureLikeDTO;
import com.histudy.lecture.model.LectureNoteDTO;
import com.histudy.lecture.model.LectureReviewDTO;

public interface LectureService {
   public List<LectureDTO> lectureList(int cp, int ls) throws Exception;
   public LectureDTO lectureContent(int idx);
   public int lectureNoteInsert(LectureNoteDTO dto);
   public int getTotalCnt();
   public List<LectureReviewDTO> reviewList(int idx); 
   public int reviewInsert(LectureReviewDTO dto);
   public int lectureLike(LectureLikeDTO dto); 
}
