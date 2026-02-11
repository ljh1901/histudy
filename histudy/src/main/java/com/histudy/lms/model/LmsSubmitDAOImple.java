package com.histudy.lms.model;


import org.mybatis.spring.SqlSessionTemplate;

public class LmsSubmitDAOImple implements LmsSubmitDAO {

	private SqlSessionTemplate sqlSession;

	public LmsSubmitDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int insertTaskSubmit(LmsSubmitDTO dto) {
		int count = sqlSession.insert("insertTaskSubmit", dto);
		return count;
	}
	
}
