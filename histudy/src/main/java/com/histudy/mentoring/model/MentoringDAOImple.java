package com.histudy.mentoring.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MentoringDAOImple implements MentoringDAO {

    private SqlSessionTemplate sqlSession;

    @Autowired
    public MentoringDAOImple(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<MentorListDTO> mentorList() {
        return sqlSession.selectList("com.histudy.mentoring.mentorList");
    }

    @Override
    public List<MentorListDTO> mentorListCategory(int sc_idx) {
        return sqlSession.selectList("com.histudy.mentoring.mentorListCategory", sc_idx);
    }
    
    @Override
    public int mentorProfileCreate(MentoProfileDTO dto) {
        return sqlSession.insert("com.histudy.mentoring.mentorProfileCreate", dto);
    }
    
    public int mentorProfileCount(int user_idx) {
    	return sqlSession.selectOne("com.histudy.mentoring.mentorProfileCount", user_idx);
    }

}