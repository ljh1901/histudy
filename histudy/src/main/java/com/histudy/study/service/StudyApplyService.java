package com.histudy.study.service;


import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.histudy.study.model.*;
import com.histudy.study.model.StudyApplyDTO;

public interface StudyApplyService {

	public int applyStudy(StudyApplyDTO dto);
	public int StudyApplyCheck(Map<String, Integer> map);
	public int StudyApplyCheck2(int study_idx);
	public int userLoginTimeUpdate(int user_idx);
	public int userLogoutTimeUpdate(int user_idx);
	
	/** 스터디 신청 처리 */
	public String applyStudyProcess(int study_idx, String sa_intro, int user_idx);
}
