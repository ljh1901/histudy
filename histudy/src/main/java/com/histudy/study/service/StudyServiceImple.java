package com.histudy.study.service;

import java.util.List;

import com.histudy.study.model.*;

public class StudyServiceImple implements StudyService {

	private StudyDAO studyDao;
	
	public StudyServiceImple(StudyDAO studyDao) {
		super();
		this.studyDao = studyDao;
	}

	@Override
	public int createStudy(StudyDTO dto) {
		int result = studyDao.createStudy(dto);
		return result;
	}
	
	@Override
	public List<StudyDTO> getStudyList() {
		List<StudyDTO> lists = studyDao.getStudyList();
		return lists;
	}

}
