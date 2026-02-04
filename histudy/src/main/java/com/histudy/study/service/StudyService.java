package com.histudy.study.service;

import java.util.List;

import com.histudy.study.model.StudyDTO;

public interface StudyService {
	
	public int createStudy(StudyDTO dto);
	public List<StudyDTO> getStudyList();

}
