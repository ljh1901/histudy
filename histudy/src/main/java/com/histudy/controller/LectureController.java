package com.histudy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.lecture.model.LectureDTO;
import com.histudy.lecture.service.LectureService;


@Controller
public class LectureController {
	
	@GetMapping("lecture.do")
	public ModelAndView lectureList() {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("lecture/lectureList");
		return mav;
	}
	@GetMapping("lectureContent.do")
	public ModelAndView lectrueContent() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("lecture/lectureContent");
		return mav;
	}
}
