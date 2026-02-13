package com.histudy.study.model;

import java.util.*;

public interface StudyApplyDAO {
	
	 public int applyStudy(StudyApplyDTO dto);
	 public int StudyApplyCheck(Map<String, Integer> map);
	 public int StudyApplyCheck2(int study_idx);

}
