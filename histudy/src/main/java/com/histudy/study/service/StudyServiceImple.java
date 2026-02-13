package com.histudy.study.service;

import java.util.List;
import java.util.Map;

import com.histudy.study.model.*;
import com.histudy.user.model.UserDTO;

public class StudyServiceImple implements StudyService {

   private StudyDAO studyDao;
   
   public StudyServiceImple(StudyDAO studyDao) {
      super();
      this.studyDao = studyDao;
   }

   @Override
   public int createStudy(StudyDTO dto) {
      int result = studyDao.createStudy(dto);
      return result;
   }
   
   @Override
   public List<StudyDTO> getStudyList(Map<String, Integer> map) {
      List<StudyDTO> lists = studyDao.getStudyList(map);
      return lists;
   }
   
   @Override
	public int studyTotalCnt(Integer sc_idx) {
	    int result = studyDao.studyTotalCnt(sc_idx);
	    return result;
	}
   
   @Override
   public UserDTO getStudyCreateUser(int user_idx) {
      UserDTO dto = studyDao.getStudyCreateUser(user_idx);
      return dto;
   }
   
   @Override
   public int studyMaxCreate(int user_idx) {
      int result = studyDao.studyMaxCreate(user_idx);
      return result;
   }
   
   @Override
	public StudyDTO getStudyContent(int study_idx) {
	   StudyDTO dto = studyDao.getStudyContent(study_idx);
	   return dto;
	}
   
   @Override
	public List<StudyDTO> findStudyTitle() {
	   List<StudyDTO> titleList = studyDao.findStudyTitle();

		return titleList;
	}
   
   @Override
	public int studyTitleSearchTotalCnt(String searchTitle) {
		int result = studyDao.studyTitleSearchTotalCnt(searchTitle);
		return result;
	}
   // 개설자인지 체크
   @Override
	public List<StudyDTO> studyCreatorCheck(int user_idx) {
	   List<StudyDTO> lists = studyDao.studyCreatorCheck(user_idx);
	   return lists;
	}
   // 참여자인지 체크
   @Override
	public List<StudyApplyDTO> studyApplyCheck(int user_idx) {
	   List<StudyApplyDTO> lists = studyDao.studyApplyCheck(user_idx);
		return lists;
	}
   // 참여자라면 어떤 스터디에 참여중인지
   @Override
	public List<StudyDTO> studyApproved(int study_idx) {
		List<StudyDTO> approvedList = studyDao.studyApproved(study_idx);
		return approvedList;
	}

}
