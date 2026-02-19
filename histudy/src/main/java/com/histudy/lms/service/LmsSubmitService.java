package com.histudy.lms.service;


import org.springframework.web.multipart.MultipartFile;

import com.histudy.lms.model.LmsSubmitDTO;

public interface LmsSubmitService {
	
	
	/** 해당 과제의 과제 제출 조회 */
	public LmsSubmitDTO selectAssignmentSubmit(int a_idx);

	/** 제출한 과제 수정 처리 (파일 업로드 + DB 수정) */
	public String updateTaskSubmitProcess(LmsSubmitDTO dto, MultipartFile prve_as_fname);

	/** 과제 제출 처리  */
	public String submitTaskProcess(LmsSubmitDTO dto, MultipartFile file);
}
