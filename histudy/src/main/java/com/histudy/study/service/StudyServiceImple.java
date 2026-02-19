package com.histudy.study.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.histudy.study.model.*;
import com.histudy.user.model.UserDTO;

public class StudyServiceImple implements StudyService {

   private StudyDAO studyDao;
   
   public StudyServiceImple(StudyDAO studyDao) {
      super();
      this.studyDao = studyDao;
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
   
   @Override
   public String createStudyProcess(StudyDTO dto, MultipartFile uploadFile, int user_idx) {
       
 	  // 이중으로 유효성 검사하기 스터디 마감일 <= 스터디 시작일
 	  String begin = dto.getStudy_begin_date();
 	  String end = dto.getStudy_end_date();
       try {
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

           Date beginDate = sdf.parse(begin);
           Date endDate = sdf.parse(end);

           if(endDate.getTime() > beginDate.getTime()) {
               return "스터디 시작일은 모집 마감일 이후여야 합니다.";
           }

       } catch (Exception e) {
           e.printStackTrace();
           return "날짜 처리 중 오류 발생";
       }

       int studyMaxCreateCount = studyDao.studyMaxCreate(user_idx);

       if(studyMaxCreateCount >= 3) {
           return "스터디 개설은 최대 3개까지 가능합니다!";
       }

       if(uploadFile != null && !uploadFile.isEmpty()) {
           dto.setStudy_upload_img(uploadFile.getOriginalFilename());
           fileCopy(uploadFile);
       }else {
    	   dto.setStudy_upload_img("");
       }

       dto.setUser_idx(user_idx);

       int result = studyDao.createStudy(dto);

       return result > 0 ? "스터디 개설 완료" : "스터디 개설 실패";
   }
   
   /** 파일 복사기 */
   public void fileCopy(MultipartFile upload) {
      try {
         byte bytes[] = upload.getBytes();
         
         File f = new File("C:/histudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/histudy/study-img/"+upload.getOriginalFilename());
         
         FileOutputStream fos = new FileOutputStream(f);
         
         fos.write(bytes);
         
         fos.close();
      }catch(IOException e) {
         e.printStackTrace();
      }
   }


}
