package com.histudy.lms.service;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.histudy.lms.model.LmsSubmitDAO;
import com.histudy.lms.model.LmsSubmitDTO;

public class LmsSubmitServiceImple implements LmsSubmitService {
	
	private LmsSubmitDAO ls_dao;

	public LmsSubmitServiceImple(LmsSubmitDAO ls_dao) {
		super();
		this.ls_dao = ls_dao;
	}
	
	@Override
	public LmsSubmitDTO selectAssignmentSubmit(int a_idx) {
		LmsSubmitDTO dto = ls_dao.selectAssignmentSubmit(a_idx);
		return dto;
	}
	
	
	/** 제출한 과제 수정 처리  */
	@Override
	public String updateTaskSubmitProcess(LmsSubmitDTO dto, MultipartFile prve_as_fname) {

	    // 1. 파일 처리
	    if (prve_as_fname != null && !prve_as_fname.isEmpty() && !prve_as_fname.getOriginalFilename().isEmpty()) {
	        fileCopy(prve_as_fname, "C:/histudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/histudy/taskSubmitfile/");
	        dto.setAs_fname(prve_as_fname.getOriginalFilename());
	    } else {
	        dto.setAs_fname("");
	    }

	    // 2. DB 수정
	    int result = ls_dao.taskSubmitUpdate(dto); // lss는 제출 관련 DAO/서비스 호출

	    return result > 0 ? "과제 수정 완료" : "과제 수정 실패";
	}
	
	/** 과제 제출 처리 */
	@Override
	public String submitTaskProcess(LmsSubmitDTO dto, MultipartFile file) {

	    // 1. 제출 상태 & 날짜 초기화
	    dto.setAs_status("submit");
	    dto.setAs_update_date("");

	    // 2. 파일 처리
	    if (file != null && !file.isEmpty() && !file.getOriginalFilename().isEmpty()) {
	        fileCopy(file, "C:/histudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/histudy/taskSubmitfile/");
	        dto.setAs_fname(file.getOriginalFilename());
	    } else {
	        dto.setAs_fname("");
	    }

	    // 3. DB 등록
	    int result = ls_dao.insertTaskSubmit(dto);

	    return result > 0 ? "과제 제출 완료" : "과제 제출 실패";
	}

	/** 파일 업로드 관련 메서드 */
	public void fileCopy(MultipartFile upload, String path) {
		 try {
		      byte bytes[] = upload.getBytes();
		         
		      File f = new File(path+upload.getOriginalFilename());
		         
		      FileOutputStream fos = new FileOutputStream(f);
		         
		      fos.write(bytes);
		         
		      fos.close();
		 }catch(IOException e) {
		      e.printStackTrace();
		 }
	}
	
	

}
