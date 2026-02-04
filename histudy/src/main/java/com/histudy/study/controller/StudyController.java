package com.histudy.study.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.histudy.study.model.StudyDTO;
import com.histudy.study.service.StudyService;
import com.histudy.user.model.UserDTO;

import java.util.*;

@Controller
public class StudyController {

	@Autowired
	private StudyService ss;
	
	@GetMapping("/studyList.do")
	public ModelAndView studyList(@RequestParam(value="cp", defaultValue="1")int cp) {
		
		int listSize = 9;
		int pageSize = 5;
		int totalCnt = ss.studyTotalCnt();
		String pagename = "studyList.do";
		String pageStr = com.histudy.page.PagingModule.makePage(cp, listSize, pageSize, totalCnt, pagename);
		
		int start_num = (cp-1)*listSize+1;
		int end_num = cp*listSize;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start_num", start_num);
		map.put("end_num", end_num);
		
		
		List<StudyDTO> lists = ss.getStudyList(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("studyList", lists);
		mav.addObject("studyListCount", lists.size());
		mav.addObject("pageStr", pageStr);
		mav.setViewName("study/studyList");
		return mav;
	}
	
	@GetMapping("/studyCreateForm.do")
	public ModelAndView studyCreateForm(int user_idx) {
		UserDTO dto = ss.getStudyCreateUser(user_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("user_name", dto.getUser_name());
		mav.addObject("user_tel", dto.getUser_tel());
		mav.addObject("user_email", dto.getUser_email());
		mav.setViewName("study/studyCreate");
		return mav;
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
