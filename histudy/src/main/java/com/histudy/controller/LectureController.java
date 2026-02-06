package com.histudy.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.lecture.model.LectureDTO;
import com.histudy.lecture.model.LectureNoteDTO;
import com.histudy.lecture.model.LectureReviewDTO;
import com.histudy.lecture.service.LectureService;


@Controller
public class LectureController {

   @Autowired
    private LectureService lectureService;
   
   @GetMapping("lecture.do")
   public ModelAndView lectureList(
		   @RequestParam(value="cp", defaultValue="1") int cp,
		   @RequestParam(value="ls", defaultValue="6") int ls) {
	  int totalCnt=lectureService.getTotalCnt();
	  int listSize=6;
	  int pageSize=5;
	  String pageStr=com.histudy.page.PagingModule.makePage(cp, listSize, pageSize, totalCnt, "lecture.do", ls);
	   
      ModelAndView mav= new ModelAndView();
      List<LectureDTO> lists;
	try {
		lists = lectureService.lectureList(cp,ls);
		mav.addObject("lectureLists",lists);
	} catch (Exception e) {
		e.printStackTrace();
	}
      mav.addObject("pageStr",pageStr);
      mav.setViewName("lecture/lectureList");
      
      return mav;
   }
   @GetMapping("lectureContent.do")
   public ModelAndView lectrueContent(int idx) {
      LectureDTO list=lectureService.lectureContent(idx);
      ModelAndView mav=new ModelAndView();
      mav.addObject("lectureContent",list);
      mav.setViewName("lecture/lectureContent");
      return mav;
   }
   @GetMapping("lectureMemo.do")
   public ModelAndView lectrueMemo(LectureNoteDTO dto) {
      ModelAndView mav=new ModelAndView();
      int result=lectureService.lectureNoteInsert(dto);
      String msg=result>0?"메모 저장 성공.":"메모 저장 실패.";
      mav.addObject("msg",msg);
      mav.setViewName("lecture/lectureMemoOk");
      return mav;
   }
   public ModelAndView lectureReivewList(int idx) {
   		ModelAndView mav= new ModelAndView();
   		List<LectureReviewDTO> lists=lectureService.reviewList(idx);
   		mav.addObject("reviewList",lists);
   		mav.setViewName("lecture/lecutreContent");
   		return mav;
 	}
}
