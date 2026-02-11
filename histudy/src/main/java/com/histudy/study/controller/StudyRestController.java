package com.histudy.study.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.histudy.study.model.StudyDTO;
import com.histudy.study.service.StudyService;

@Controller
public class StudyRestController {

	@Autowired
	private StudyService ss;
	
	@GetMapping("/studyFind.do")
	@ResponseBody
	public String studyFind(@RequestParam(value = "keyword", defaultValue = "0") String keyword) {

		List<StudyDTO> titleList = ss.findStudyTitle();
		
		String result = studySuggest(keyword, titleList);
		
		
		return result;
	}

	public String studySuggest(String keyword, List<StudyDTO> titleList) {

		String resultFind = "";
		
		if(!(keyword==null || keyword.equals(""))) {
			for(int i=0; i<titleList.size(); i++) {
				if(titleList.get(i).getStudy_title().startsWith(keyword)) {
					resultFind += titleList.get(i).getStudy_title()+",";

				}
			}
	        // 마지막 쉼표 제거
	        if(resultFind.endsWith(",")) {
	            resultFind = resultFind.substring(0, resultFind.length()-1);
	        }
		}
		return resultFind;
	}

}
