package com.histudy.study.model;

import java.util.*;

public interface StudyDAO {
	
	public int createStudy(StudyDTO dto);
	public List<StudyDTO> getStudyList();

}
