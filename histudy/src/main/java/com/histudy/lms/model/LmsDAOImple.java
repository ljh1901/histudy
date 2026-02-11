package com.histudy.lms.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class LmsDAOImple implements LmsDAO {
	
	private SqlSessionTemplate sqlSession;
	
	public LmsDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public int insertTask(LmsDTO dto) {
		int count = sqlSession.insert("insertTask", dto);
		return count;
	}
	
	@Override
	public List<LmsDTO> selectStudyCreatorTask(int user_idx) {
		List<LmsDTO> lists = sqlSession.selectList("selectStudyCreatorTask", user_idx);
		return lists;
	}
	
	@Override
	public List<LmsDTO> selectStudyApprovedTask(int user_idx) {
		List<LmsDTO> lists = sqlSession.selectList("selectStudyApprovedTask", user_idx);
		return lists;
	}
	
	@Override
	public LmsDTO selectTask(int a_idx) {
		LmsDTO dto = sqlSession.selectOne("selectTask", a_idx);
		return dto;
	}
	
	@Override
	public int waitTaskCount(int user_idx) {
		int waitTaskCount = sqlSession.selectOne("waitTaskCount", user_idx);
		return waitTaskCount;
	}
	
	@Override
	public int taskSubmitOkCount(int user_idx) {
		int taskSubmitOkCount =sqlSession.selectOne("taskSubmitOkCount", user_idx);
		return taskSubmitOkCount;
	}
	
	@Override
	public int myStudyInTaskCount(int study_idx) {
		int myStudyInTaskCount = sqlSession.selectOne("myStudyInTaskCount", study_idx);
		return myStudyInTaskCount;
	}
	
	@Override
	public int memberStudyInTaskCount(Map<String, Integer> map) {
		int memberStudyInTaskCount = sqlSession.selectOne("memberStudyInTaskCount", map);
		return memberStudyInTaskCount;
	}


}
