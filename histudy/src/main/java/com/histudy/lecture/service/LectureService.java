package com.histudy.lecture.service;

import java.util.List;

import com.histudy.lecture.model.LectureDTO;

public interface LectureService {
	public List<LectureDTO> lectureList();
	public LectureDTO lectureContent(int idx);

}
