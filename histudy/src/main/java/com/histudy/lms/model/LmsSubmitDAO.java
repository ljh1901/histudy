package com.histudy.lms.model;

public interface LmsSubmitDAO {
	
	/** 과제 제출  */
	public int insertTaskSubmit(LmsSubmitDTO dto);
	
	/** 해당 과제의 과제 제출 조회 */
	public LmsSubmitDTO selectAssignmentSubmit(int a_idx);
	
	/** 제출한 과제 수정 */
	public int taskSubmitUpdate(LmsSubmitDTO dto);

	
}
