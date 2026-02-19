package com.histudy.study.service;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.histudy.study.model.*;


public class StudyApplyServiceImple implements StudyApplyService {

	private StudyApplyDAO sa_dao;
	
	public StudyApplyServiceImple(StudyApplyDAO sa_dao) {
		super();
		this.sa_dao = sa_dao;
	}



	@Override
	public int applyStudy(StudyApplyDTO dto) {
		int result = sa_dao.applyStudy(dto);
		return result;
	}
	
	@Override
	public int StudyApplyCheck(Map<String, Integer> map) {
		int result = sa_dao.StudyApplyCheck(map);
		return result;
	}
	
	@Override
	public int StudyApplyCheck2(int study_idx) {
		int user_idx = sa_dao.StudyApplyCheck2(study_idx);
		return user_idx;
	}
	
	@Override
	public int userLoginTimeUpdate(int user_idx) {
		int result = sa_dao.userLoginTimeUpdate(user_idx);
		return result;
	}
	
	@Override
	public int userLogoutTimeUpdate(int user_idx) {
		int result = sa_dao.userLogoutTimeUpdate(user_idx);
		return result;
	}
	/** 스터디 신청 처리 */
	@Override
	public String applyStudyProcess(int study_idx, String sa_intro, int user_idx) {

	    if(user_idx == 0) {
	        return "Hi, Study에 로그인 된 사용자만 신청 가능합니다.";
	    }

	    Map<String, Integer> map = new HashMap<>();
	    map.put("user_idx", user_idx);
	    map.put("study_idx", study_idx);

	    int studyApplyCount = sa_dao.StudyApplyCheck(map);
	    int resultUserIdx = sa_dao.StudyApplyCheck2(study_idx);

	    if(studyApplyCount >= 1) {
	        return "중복 신청은 불가능합니다.";
	    }

	    if(resultUserIdx == user_idx) {
	        return "자신이 개설한 스터디 입니다. 신청이 불가능합니다.";
	    }

	    StudyApplyDTO dto = new StudyApplyDTO();
	    dto.setSa_intro(sa_intro);
	    dto.setSa_status("Pending");
	    dto.setSa_reason("");
	    dto.setStudy_idx(study_idx);
	    dto.setUser_idx(user_idx);

	    int result = sa_dao.applyStudy(dto);

	    return result > 0 ? "스터디 신청 완료" : "스터디 신청 실패";
	}
	

	

}
