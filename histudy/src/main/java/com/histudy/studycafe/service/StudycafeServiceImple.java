package com.histudy.studycafe.service;

import com.histudy.studycafe.model.StudycafeDAO;
import com.histudy.studycafe.model.StudycafeDTO;

public class StudycafeServiceImple implements StudycafeSerivce{
	
	private StudycafeDAO studycafeDAO;
	
	
	public StudycafeServiceImple(StudycafeDAO studycafeDAO) {
		super();
		this.studycafeDAO = studycafeDAO;
	}


	@Override
	public StudycafeDTO studycafeList() {
		StudycafeDTO dto = studycafeDAO.studycafeList();
		return dto;
	}
}
