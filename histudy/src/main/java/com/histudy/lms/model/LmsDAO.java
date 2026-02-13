package com.histudy.lms.model;

import java.util.*;

public interface LmsDAO {

	public int insertTask(LmsDTO dto);
	public List<LmsDTO> selectStudyCreatorTask(int user_idx); // 개설자일 경우 과제 가져오기
	public List<LmsDTO> selectStudyApprovedTask(int user_idx); // 참여자일 경우 과제 가져오기
	public LmsDTO selectTask(int a_idx);
	public int waitTaskCount(int user_idx);
	public int taskSubmitOkCount(int user_idx);
	public int myStudyInTaskCount(int study_idx);
	public int memberStudyInTaskCount(Map<String, Integer> map);
}
