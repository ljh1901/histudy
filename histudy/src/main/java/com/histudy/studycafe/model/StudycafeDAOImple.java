package com.histudy.studycafe.model;

import org.mybatis.spring.SqlSessionTemplate;

public class StudycafeDAOImple implements StudycafeDAO{
	private SqlSessionTemplate sqlSession;

	public StudycafeDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	@Override
	public StudycafeDTO studycafeList() {
		StudycafeDTO dto =sqlSession.selectOne("studycafeListSQL");
		return dto;
	}
	
	
}
