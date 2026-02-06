package com.histudy.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.admin.service.AdminStudyService;
import com.histudy.study.model.*;
import java.util.*;

import javax.servlet.http.HttpSession;

@Controller
public class AdminStudyController {

	@Autowired
	private AdminStudyService adminStudyService;

	
	@GetMapping("/adminStudyList.do")
	public ModelAndView adminStudyList() {
	    ModelAndView mav = new ModelAndView("admin/adminStudyList");
	    
	    List<StudyDTO> list = adminStudyService.getStudyList();
	    mav.addObject("studyList", list);
	    
	    return mav;
	}
	
}
