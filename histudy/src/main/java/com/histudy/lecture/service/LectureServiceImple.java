package com.histudy.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.histudy.lecture.model.LectureDAO;
import com.histudy.lecture.model.LectureDTO;
import com.histudy.lecture.model.LectureNoteDTO;
public class LectureServiceImple implements LectureService {
   private LectureDAO lectureDao;
   public LectureServiceImple(LectureDAO lectureDao) {
      this.lectureDao=lectureDao;
   }
   @Override
   public List<LectureDTO> lectureList() {
      return lectureDao.lectureList();
   }
   @Override
   public LectureDTO lectureContent(int idx) {
      return lectureDao.lectureContent(idx);
   }
   @Override
   public int lectureNoteInsert(LectureNoteDTO dto) {
      return lectureDao.lectureNoteInsert(dto);
   }
}
