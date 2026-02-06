package com.histudy.lecture.model;

import java.util.List;
import java.util.Map;

public interface LectureDAO {
   public List<LectureDTO> lectureList();
   public List<LectureDTO> lectureList(Map<String, Integer> map);
   public LectureDTO lectureContent(int idx);
   public int lectureNoteInsert(LectureNoteDTO dto);
   public int getTotalCnt();
   public List<LectureReviewDTO> reviewList(int lectureContent); 
}
