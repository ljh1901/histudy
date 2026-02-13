package com.histudy.lms.service;


import com.histudy.lms.model.LmsSubmitDAO;
import com.histudy.lms.model.LmsSubmitDTO;

public class LmsSubmitServiceImple implements LmsSubmitService {
	
	private LmsSubmitDAO ls_dao;

	public LmsSubmitServiceImple(LmsSubmitDAO ls_dao) {
		super();
		this.ls_dao = ls_dao;
	}
	
	@Override
	public int insertTaskSubmit(LmsSubmitDTO dto) {
		int count = ls_dao.insertTaskSubmit(dto);
		return count;
	}
	
	
	

}
