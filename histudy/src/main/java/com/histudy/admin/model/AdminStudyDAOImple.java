package com.histudy.admin.model;

import org.apache.ibatis.session.SqlSession;
import java.util.*;
import com.histudy.study.model.*;

public class AdminStudyDAOImple implements AdminStudyDAO {

	private SqlSession session;

	public AdminStudyDAOImple(SqlSession session) {
		super();
		this.session = session;
	}

	@Override
	public List<StudyDTO> selectAllStudyList(int sc_idx) {       
		return session.selectList("selectAllStudyList",sc_idx);
	}
	
	@Override
	public StudyDTO getStudyDetail(int study_idx) {
	    return session.selectOne("getStudyDetail", study_idx);
	}
	@Override
	public int deleteStudy(int study_idx) {
		return session.delete("deleteStudy",study_idx);
	}

}
