package com.histudy.study.service;

import java.util.List;
import java.util.Map;

import com.histudy.study.model.StudyApplyDTO;

public interface StudyApplyService {

	public int applyStudy(StudyApplyDTO dto);
	public int StudyApplyCheck(Map<String, Integer> map);
	public int StudyApplyCheck2(int study_idx);
}
