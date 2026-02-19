package com.histudy.lms.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.histudy.lms.model.*;
import com.histudy.lms.service.LmsService;
import com.histudy.study.model.StudyApplyDTO;

@Controller
@RequestMapping("/lmsRest")
public class LmsRestController {

	@Autowired
	private LmsService ls;

	/** 왼쪽 내 스터디 클릭 시 해당 스터디의 과제만 추출하는 메서드 */
	@GetMapping("/memberCheck.do")
	@ResponseBody
	public ResponseEntity<List<LmsDTO>> memberCheck(
			@RequestParam(value="data", defaultValue = "0")String data,
			@RequestParam(value="study_idx", defaultValue = "0")int study_idx,
			HttpSession session) {
		
		int user_idx = (Integer)session.getAttribute("user_idx");
		
		Map<String, Integer> map = new HashMap<>();
		map.put("user_idx", user_idx);
		map.put("study_idx", study_idx);
		
		ResponseEntity<List<LmsDTO>> re = null;
		if(data.equals("leader")) {
			
			List<LmsDTO> leaderSelectTaskList = ls.lmsRestLeaderSelectTask(map);
		    re = new ResponseEntity<List<LmsDTO>>(leaderSelectTaskList, HttpStatus.OK);
			
			
		}else if(data.equals("member")) {
			
			List<LmsDTO> memberSelectTaskList = ls.lmsRestMemberSelectTask(map);
			re = new ResponseEntity<List<LmsDTO>>(memberSelectTaskList, HttpStatus.OK);
			
		}
		return re;
	}
	
	/** 진행중|완료 토글 클릭 시 발동 메서드 */
	@GetMapping("/taskCheck.do")
	@ResponseBody
	public ResponseEntity<List<LmsDTO>> taskCheck(
			@RequestParam(value="toggle", defaultValue = "0")String toggle,
			HttpSession session){
		
		int user_idx = (Integer)session.getAttribute("user_idx");
		
		ResponseEntity<List<LmsDTO>> re = null;
		if(toggle.equals("진행중")) {

			List<LmsDTO> C_task_list = ls.selectStudyCreatorTask(user_idx);
			if(!C_task_list.isEmpty()) {
				for(int i=0; i<C_task_list.size(); i++) {
					C_task_list.get(i).setMemberStatus("개설자");
				}
			}
			List<LmsDTO> A_task_list = ls.selectStudyApprovedTask(user_idx);
			if(!A_task_list.isEmpty()) {
				for(int i=0; i<A_task_list.size(); i++) {
					A_task_list.get(i).setMemberStatus("참여자");
				}
			}
			List<LmsDTO> total_list = new ArrayList<LmsDTO>();
			total_list.addAll(C_task_list);
			total_list.addAll(A_task_list);
			re = new ResponseEntity<List<LmsDTO>>(total_list, HttpStatus.OK);
		}else if(toggle.equals("제출 완료")){
			List<LmsDTO> assignmentSubmitOkList = ls.assignmentSubmitOk(user_idx);
			re = new ResponseEntity<List<LmsDTO>>(assignmentSubmitOkList, HttpStatus.OK);
		}
		
		return re;
	
	}
	
	@GetMapping("/memberManagement.do")
	@ResponseBody
	public ResponseEntity<List<StudyApplyDTO>> memberManagement(
			@RequestParam(value = "study_idx", defaultValue = "0")int study_idx){
		
		List<StudyApplyDTO> lists = ls.studyApplicationUser(study_idx);
		
		ResponseEntity<List<StudyApplyDTO>> re = new ResponseEntity<List<StudyApplyDTO>>(lists, HttpStatus.OK);
		return re;
		
	}
}
