package com.histudy.admin.model;

import java.util.List;

import com.histudy.study.model.StudyDTO;

public interface AdminStudyDAO {

	public List<StudyDTO> selectAllStudyList();
}
