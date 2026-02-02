package com.histudy.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.histudy.lecture.model.LectureDAO;
import com.histudy.lecture.model.LectureDTO;
public class LectureServiceImple implements LectureService {
	private LectureDAO lectureDao;
	public LectureServiceImple(LectureDAO lectureDao) {
		this.lectureDao=lectureDao;
	}
	@Override
	public List<LectureDTO> lectureSel() {
		List<LectureDTO> lists=null;
		lists=lectureDao.lectureSel();
		return lists;
	}

}
