package com.histudy.study.service;

import java.util.List;
import java.util.Map;

import com.histudy.study.model.*;
import com.histudy.user.model.UserDTO;

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
	public List<StudyDTO> getStudyList(Map<String, Integer> map) {
		List<StudyDTO> lists = studyDao.getStudyList(map);
		return lists;
	}
	
	@Override
	public int studyTotalCnt() {
		int result = studyDao.studyTotalCnt();
		return result;
	}
	
	@Override
	public UserDTO getStudyCreateUser(int user_idx) {
		UserDTO dto = studyDao.getStudyCreateUser(user_idx);
		return dto;
	}

}
