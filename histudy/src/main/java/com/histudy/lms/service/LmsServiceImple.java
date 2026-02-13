package com.histudy.lms.service;

import java.util.List;
import java.util.Map;

import com.histudy.lms.model.LmsDAO;
import com.histudy.lms.model.LmsDTO;


public class LmsServiceImple implements LmsService {

	private LmsDAO l_dao;
	
	
	public LmsServiceImple(LmsDAO l_dao) {
		super();
		this.l_dao = l_dao;
	}


	@Override
	public int insertTask(LmsDTO dto) {
		int count = l_dao.insertTask(dto);
		return count;
	}
	
	@Override
	public List<LmsDTO> selectStudyCreatorTask(int user_idx) {
		List<LmsDTO> lists = l_dao.selectStudyCreatorTask(user_idx);
		return lists;
	}
	
	@Override
	public List<LmsDTO> selectStudyApprovedTask(int user_idx) {
		List<LmsDTO> lists = l_dao.selectStudyApprovedTask(user_idx);
		return lists;
	}
	
	@Override
	public LmsDTO selectTask(int a_idx) {
		LmsDTO dto = l_dao.selectTask(a_idx);
		return dto;
	}
	
	@Override
	public int waitTaskCount(int user_idx) {
		int result = l_dao.waitTaskCount(user_idx);
		return result;
	}
	
	@Override
	public int taskSubmitOkCount(int user_idx) {
		int result = l_dao.taskSubmitOkCount(user_idx);
		return result;
	}
	
	@Override
	public int myStudyInTaskCount(int study_idx) {
		int result = l_dao.myStudyInTaskCount(study_idx);
		return result;
	}
	
	@Override
	public int memberStudyInTaskCount(Map<String, Integer> map) {
		int result = l_dao.memberStudyInTaskCount(map);
		return result;
	}
}
