package com.histudy.study.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.study.model.StudyDTO;
import com.histudy.study.service.StudyService;
import java.util.*;

@Controller
public class StudyController {

	@Autowired
	private StudyService ss;
	
	@GetMapping("/studyList.do")
	public ModelAndView studyList() {
		
		List<StudyDTO> lists = ss.getStudyList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("studyList", lists);
		mav.addObject("studyListCount", lists.size());
		mav.setViewName("study/studyList");
		return mav;
	}
	
	@GetMapping("/studyCreateForm.do")
	public String studyCreateForm() {
		return "study/studyCreate";
	}
	
	@PostMapping("/studyCreate.do")
	public ModelAndView studyCreate(StudyDTO dto, MultipartFile rstudy_upload_img) {
		
		dto.setStudy_upload_img(rstudy_upload_img.getOriginalFilename());
		fileCopy(rstudy_upload_img);
		int result = ss.createStudy(dto);
		String msg = result>0?"스터디 개설 완료":"스터디 개설 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("study/studyMsg");
		return mav;
	}
	
	public void fileCopy(MultipartFile upload) {
		try {
			byte bytes[] = upload.getBytes();
			
			File f = new File("C:/histudy/histudy/src/main/webapp/study-img/"+upload.getOriginalFilename());
			
			FileOutputStream fos = new FileOutputStream(f);
			
			fos.write(bytes);
			
			fos.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
}
