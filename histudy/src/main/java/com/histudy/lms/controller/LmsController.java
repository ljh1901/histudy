package com.histudy.lms.controller;

import java.io.File;
import java.util.*;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.lms.model.LmsDTO;
import com.histudy.lms.model.LmsSubmitDTO;
import com.histudy.lms.service.LmsService;
import com.histudy.lms.service.LmsSubmitService;
import com.histudy.study.model.StudyApplyDTO;
import com.histudy.study.model.StudyDTO;
import com.histudy.study.service.StudyService;

@Controller
public class LmsController {
	
	@Autowired
	private StudyService ss;
	
	@Autowired
	private LmsService ls;
	
	@Autowired
	private LmsSubmitService lss;
	
	/** LMS 페이지 접속 관련 메서드 */
	@GetMapping("/lms.do")
	public ModelAndView lmsPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		/** 세션으로 현재 로그인 된 사용자의 user_idx 취득 */
		Integer user_idx = (Integer)session.getAttribute("user_idx");
		
		// 로그인 시 LMS 서비스를 이용할 수 있게 첫번째 검증
		if(user_idx == null || user_idx == 0) {
			mav.addObject("msg", "로그인 후 접속 가능합니다.");
			mav.addObject("goPage", "index.do");
			mav.setViewName("lms/lmsMsg");
			return mav;
		}else {
			/** 로그인된 사용자가 개설자인지 참여자인지 알아야함 */
			/** 1. 개설자 체크 */
			List<StudyDTO> s_list = ss.studyCreatorCheck(user_idx);
			
			// 개설자라면 본인이 개설한 스터디의 과제 갯수 가져오는 로직
			StudyDTO dto = new StudyDTO();
			for(int i=0; i<s_list.size(); i++) {
				int study_idx = s_list.get(i).getStudy_idx();
				dto.setTaskCount(ls.myStudyInTaskCount(study_idx));
				s_list.get(i).setTaskCount(dto.getTaskCount());
			}
			
			if(!s_list.isEmpty()) { // 만약 s_list가 비어있지 않다면? [개설자]
				
				List<LmsDTO> C_task_list = ls.selectStudyCreatorTask(user_idx); // 개설자라면 자신이 등록한 과제 받아오기
				
				if(!C_task_list.isEmpty()) {
					mav.addObject("C_task_list", C_task_list); // 과제 넘겨주는거
				}
				
				mav.addObject("s_list", s_list); // 스터디 넘겨주는거
				mav.setViewName("lms/lms");
			}
			
			/** 2. 참여자 체크 */
			List<StudyApplyDTO> sa_list = ss.studyApplyCheck(user_idx);
	
			// 만약 sa_list가 비어있지 않다면? [참여자]
			if(!sa_list.isEmpty()) {
				
				List<StudyDTO> approved_list = new ArrayList<>(); // 참여자라면 어떤 스터디에 참여중인지를 리스트로 받는용의 리스트임 
				
				for(int i=0; i<sa_list.size(); i++) { 
					
					int study_idx = sa_list.get(i).getStudy_idx(); // 반복문을 통해 참여중인 스터디의 study_idx를 추출 
					List<StudyDTO> temp = ss.studyApproved(study_idx); // 참여자라면 어떤 스터디에 참여중인지에 대한 리스트를 임시로 받고 
					approved_list.addAll(temp); // approved_list에 add
					
				}
				
				/** 참여자라면 본인이 참여한 스터디의 과제 갯수를 가져오는 로직 */
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put("user_idx", user_idx);
				StudyDTO dto2 = new StudyDTO();
				for(int i=0; i<approved_list.size(); i++) {
					map.put("study_idx", approved_list.get(i).getStudy_idx());
					dto2.setTaskCount2(ls.memberStudyInTaskCount(map));
					approved_list.get(i).setTaskCount2(dto2.getTaskCount2());
				}
				
				mav.addObject("approved_List", approved_list); // 내가 참여중인 스터디를 보내주는 것
				
				mav.addObject("studyCount", s_list.size()+sa_list.size()); // 로그인한 사용자가 참여중인 총 스터디 갯수

				
				List<LmsDTO> A_task_list = ls.selectStudyApprovedTask(user_idx);
				if(!A_task_list.isEmpty()) {
					mav.addObject("A_task_list", A_task_list);
				}
				mav.setViewName("lms/lms");
			}
			
			/** 만약 스터디 개설자도 아니고 참여자도 아닌 경우 */
			if(s_list.isEmpty() && sa_list.isEmpty()){
				mav.addObject("msg", "스터디에 참여해보세요!");
				mav.setViewName("study/studyMsg");
			}
			
			/** 대기 중인 과제 수 */
			int waitTaskCount = ls.waitTaskCount(user_idx);
			mav.addObject("waitTaskCount", waitTaskCount);
			
			/** 제출 완료된 과제 수 */
			int taskSubmitOkCount = ls.taskSubmitOkCount(user_idx);
			mav.addObject("taskSubmitOkCount", taskSubmitOkCount);
		}
		
		return mav;
	}
	
	/** 과제 등록 페이지 접속 관련 메서드 */
	@GetMapping("/taskInsertForm.do")
	public ModelAndView taskInsertForm(HttpSession session) {
		
		Integer user_idx = (Integer)session.getAttribute("user_idx");
		
		// 과제 등록 페이지에서 내가 개설한 스터디의 목록을 보내서 스터디를 선택하고 과제 등록을 할 수 있게 하기 위함.
		List<StudyDTO> lists = ss.studyCreatorCheck(user_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("studyList", lists);
		mav.setViewName("lms/taskInsert");
		return mav;
	}
	
	/** 과제 등록 관련 메서드 */
	@PostMapping("/taskInsert.do")
	public ModelAndView taskInsertSubmit(LmsDTO dto, MultipartFile prve_a_fname, HttpSession session) {
		
		String a_end_date = dto.getA_end_date();
		String end_time = dto.getA_end_time();
		String end_time_m = dto.getA_end_time_m();
				
		String temp = a_end_date+" "+end_time+":"+end_time_m;

		dto.setA_end_date(temp);
		
		if(prve_a_fname.isEmpty() || prve_a_fname == null || prve_a_fname.getOriginalFilename()=="") {
			dto.setA_fname("");
		}else {
			fileCopy(prve_a_fname, "C:/histudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/histudy/taskfile/");
			dto.setA_fname(prve_a_fname.getOriginalFilename());
		}
		
		dto.setUser_idx((Integer)session.getAttribute("user_idx"));
		
		int result = ls.insertTask(dto);
		String msg = result>0?"과제 등록 완료":"과제 등록 실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goPage", "lms.do");
		mav.setViewName("lms/lmsMsg");
		return mav;
	}
	
	/** 과제 제출 페이지 접속 관련 메서드 */
	@GetMapping("/taskSubmit.do")
	public ModelAndView goTaskSubmitPage(
			@RequestParam(value="a_idx", defaultValue = "0")int a_idx,
			@RequestParam(value="study_title", defaultValue = "0")String study_title,
			HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		LmsDTO dto = ls.selectTask(a_idx);

		mav.addObject("taskData",dto);
		mav.addObject("study_title",study_title);
		mav.setViewName("lms/taskSubmit");
		return mav;
	}
	
	/** 과제 제출 관련 메서드 */
	@PostMapping("/taskSubmitOk.do")
	public ModelAndView taskSubmitOk(LmsSubmitDTO dto, MultipartFile prve_as_fname, HttpSession session) {
		
		dto.setAs_status("submit");
		dto.setAs_update_date("");
		dto.setUser_idx((Integer)session.getAttribute("user_idx"));
		
		if(prve_as_fname.isEmpty() || prve_as_fname == null || prve_as_fname.getOriginalFilename()=="") {
			dto.setAs_fname("");
		}else {
			fileCopy(prve_as_fname, "C:/histudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/histudy/taskSubmitfile/");
			dto.setAs_fname(prve_as_fname.getOriginalFilename());
		}
		
		int result = lss.insertTaskSubmit(dto);
		String msg = result>0?"과제 제출 완료":"과제 제출 실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goPage", "lms.do");
		mav.setViewName("lms/lmsMsg");
		return mav;
	}
	
	/** 파일 업로드 관련 메서드 */
	public void fileCopy(MultipartFile upload, String path) {
		 try {
		      byte bytes[] = upload.getBytes();
		         
		      File f = new File(path+upload.getOriginalFilename());
		         
		      FileOutputStream fos = new FileOutputStream(f);
		         
		      fos.write(bytes);
		         
		      fos.close();
		 }catch(IOException e) {
		      e.printStackTrace();
		 }
	}
}
