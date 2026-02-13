package com.histudy.admin.service;

import java.util.List;
import com.histudy.study.model.StudyDTO;

public interface AdminStudyService {

	public List<StudyDTO> getStudyList(int sc_idx);
	public StudyDTO getStudyDetail(int study_idx);
	public int deleteStudy(int study_idx);
}
