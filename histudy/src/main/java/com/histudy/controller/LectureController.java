package com.histudy.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.lecture.model.LectureDTO;
import com.histudy.lecture.service.LectureService;


@Controller
public class LectureController {

	@Autowired
    private LectureService lectureService;
	
	@GetMapping("lecture.do")
	public ModelAndView lectureList() {
		ModelAndView mav= new ModelAndView();
		List<LectureDTO> lists=lectureService.lectureList();
		mav.addObject("lectureLists",lists);
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
}
