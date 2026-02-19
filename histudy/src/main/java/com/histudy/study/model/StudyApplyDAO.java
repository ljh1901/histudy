package com.histudy.study.model;

import java.util.*;

public interface StudyApplyDAO {
	
	 /** 스터디 신청 */
	 public int applyStudy(StudyApplyDTO dto);
	 
	 /** 스터디 신청 버튼 눌렀을 때 중복 방지용 */
	 public int StudyApplyCheck(Map<String, Integer> map);
	 
	 /** 자신이 개설한 스터디에 신청을 막기 위함 */
	 public int StudyApplyCheck2(int study_idx);
	 
	 
	 // 밑에 두개 수정해야돼
	 /** 활동중 로직을 위해 사용자가 로그인 했을때 업데이트 */
	 public int userLoginTimeUpdate(int user_idx);
	 
	 /** 활동중 로직을 위해 사용자가 로그아웃 했을때 업데이트 */
	 public int userLogoutTimeUpdate(int user_idx);

}
