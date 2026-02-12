package com.histudy.admin.model;

import java.util.List;

import com.histudy.study.model.StudyDTO;

public interface AdminStudyDAO {

	public List<StudyDTO> selectAllStudyList(int sc_idx);
	public StudyDTO getStudyDetail(int study_idx);
	public int deleteStudy(int study_idx);
}
