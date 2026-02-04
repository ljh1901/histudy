package com.histudy.study.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.histudy.user.model.UserDTO;

public class StudyDAOImple implements StudyDAO {
	
	private SqlSessionTemplate sqlSession;
	
	public StudyDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public int createStudy(StudyDTO dto) {
		int count = sqlSession.insert("insertStudy", dto);
		return count;
	}
	
	@Override
	public List<StudyDTO> getStudyList(Map<String, Integer> map) {
		List<StudyDTO> lists = sqlSession.selectList("selectStudyList", map);
		return lists;
	}
	
	@Override
	public int studyTotalCnt() {
		int count = sqlSession.selectOne("studyTotalCnt");
		return count;
	}
	
	@Override
	public UserDTO getStudyCreateUser(int user_idx) {
		UserDTO dto = sqlSession.selectOne("studyCreateUser", user_idx);
		return dto;
	}
}
