package com.histudy.study.service;

import java.util.List;
import java.util.Map;

import com.histudy.study.model.*;


public class StudyApplyServiceImple implements StudyApplyService {

	private StudyApplyDAO sa_dao;
	
	public StudyApplyServiceImple(StudyApplyDAO sa_dao) {
		super();
		this.sa_dao = sa_dao;
	}



	@Override
	public int applyStudy(StudyApplyDTO dto) {
		int result = sa_dao.applyStudy(dto);
		return result;
	}
	
	@Override
	public int StudyApplyCheck(Map<String, Integer> map) {
		int result = sa_dao.StudyApplyCheck(map);
		return result;
	}
	
	@Override
	public int StudyApplyCheck2(int study_idx) {
		int user_idx = sa_dao.StudyApplyCheck2(study_idx);
		return user_idx;
	}

}
