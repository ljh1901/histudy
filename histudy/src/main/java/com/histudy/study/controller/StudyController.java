package com.histudy.study.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.study.model.StudyApplyDTO;
import com.histudy.study.model.StudyDTO;
import com.histudy.study.service.StudyApplyService;
import com.histudy.study.service.StudyService;
import com.histudy.user.model.UserDTO;

import java.util.*;

import javax.servlet.http.HttpSession;

@Controller
public class StudyController {

   @Autowired
   private StudyService ss;
   
   @Autowired
   private StudyApplyService sas;
   
   /** 스터디 리스트 페이지 접속 관련 메서드 */
   @GetMapping("/studyList.do")
   public ModelAndView studyList(
		   @RequestParam(value="cp", defaultValue="1")int cp,
		   @RequestParam(value="sc_idx", defaultValue="0")Integer sc_idx,
		   @RequestParam(value="studyFind", defaultValue="emptyTitle")String studyFind) {
      
	   // int로 받을 경우에 없다면? 0이 들어옴
	   // Integer로 받는다면 ? 래퍼클래스이기 때문에 null 비교 가능
	   
      int listSize = 9;
      int pageSize = 5;
      int totalCnt = 0;
      String pagename = "studyList.do";
    
      
      int start_num = (cp-1)*listSize+1;
      int end_num = cp*listSize;
      
      Map map = new HashMap<>();
      map.put("start_num", start_num);
      map.put("end_num", end_num);
      // 카테고리 검사
      if(sc_idx == 0) {
    	  sc_idx = null;
    	  totalCnt = ss.studyTotalCnt(sc_idx);
      }else {
    	  totalCnt = ss.studyTotalCnt(sc_idx);
      }
      map.put("sc_idx", sc_idx);
      
      // 검색 검사
      if(!(studyFind.equals("emptyTitle"))) {
    	  totalCnt = ss.studyTitleSearchTotalCnt(studyFind);
    	  map.put("studyFind", studyFind);
      }else {
    	  studyFind = "";
      }
      
      String pageStr = com.histudy.page.PagingModule.makePage(cp, listSize, pageSize, totalCnt, pagename, sc_idx, studyFind);

      
      
      List<StudyDTO> lists = ss.getStudyList(map);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("studyList", lists);
      mav.addObject("studyListCount", lists.size());
      mav.addObject("pageStr", pageStr);
      mav.setViewName("study/studyList");
      return mav;
   }
   
   /** 스터디 개설 페이지 이동 관련 메서드 */
   @GetMapping("/studyCreateForm.do")
   public ModelAndView studyCreateForm(HttpSession session) {
	   
	   ModelAndView mav = new ModelAndView();
	   
	   String msg = null;
	   
	   Integer user_idx = (Integer)session.getAttribute("user_idx");

	   if(user_idx == null || user_idx == 0) {
		   msg = "Hi, Study에 로그인 완료된 사용자만 접근 가능합니다!";
		   mav.addObject("msg", msg);
		   mav.setViewName("study/studyMsg");
	   }else {
		   
		   UserDTO dto = ss.getStudyCreateUser(user_idx);
		      
		   mav.addObject("user_name", dto.getUser_name());
		   mav.addObject("user_tel", dto.getUser_tel());
		   mav.addObject("user_email", dto.getUser_email());
		   
		   mav.setViewName("study/studyCreate");
	   }
	   
      return mav;
   }
   
   /** 스터디 개설 관련 메서드(StudyServiceImple에서 로직 수행) */
   @PostMapping("/studyCreate.do")
   public ModelAndView studyCreate(StudyDTO dto, MultipartFile rstudy_upload_img, HttpSession session) {
	   

	    ModelAndView mav = new ModelAndView();

	    Integer user_idx = (Integer) session.getAttribute("user_idx");

	    // 로그인 안 했을 때
	    if(user_idx == null) {
	        mav.addObject("msg", "로그인 후 스터디 개설이 가능합니다.");
	        mav.setViewName("study/studyMsg");
	        return mav;
	    }

	    String msg = ss.createStudyProcess(dto, rstudy_upload_img, user_idx);

	    mav.addObject("msg", msg);
	    mav.setViewName("study/studyMsg");

	    return mav;
	}
   
   /** 스터디 내용 페이지 이동 관련 메서드 */
   @GetMapping("/studyContent.do")
   public ModelAndView studyContent(
		   @RequestParam(value="study_idx", defaultValue="0")int study_idx, HttpSession session) {
	   ModelAndView mav = new ModelAndView();
	   
	   
	   StudyDTO dto = ss.getStudyContent(study_idx);
	   
	   session.setAttribute("dto", dto);
	   
	   mav.addObject("dto", dto);
	   mav.setViewName("study/studyContent");
	   return mav;
   }
   
   /** 스터디 신청 관련 메서드 (StudyApplyServiceImple에서 로직 수행)*/
   @GetMapping("/studyApply.do")
   public ModelAndView applyStudy(
		   @RequestParam(value="study_idx", defaultValue = "0")int study_idx,
		   @RequestParam(value="sa_intro", defaultValue = "0")String sa_intro,
		   HttpSession session) {
	   
	    Integer user_idx = (Integer)session.getAttribute("user_idx");

	    String msg = sas.applyStudyProcess(study_idx, sa_intro, user_idx == null ? 0 : user_idx);

	    ModelAndView mav = new ModelAndView();
	    mav.addObject("msg", msg);
	    mav.setViewName("study/studyMsg");

	    return mav;
   }
   
}
