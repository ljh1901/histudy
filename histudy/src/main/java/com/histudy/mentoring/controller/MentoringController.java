package com.histudy.mentoring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.histudy.mentoring.model.*;
import com.histudy.mentoring.service.*;

@Controller
public class MentoringController {

    @Autowired
    private MentoringService mentoringService;

    //멘토 전체 목록
    @GetMapping("/mentorList.do")
    public String mentorList(HttpServletRequest request) {

        List<MentorListDTO> mentorList = mentoringService.mentorList();
        
        request.setAttribute("mentorList", mentorList);
        request.setAttribute("activeCategory", 0);

        return "/mentoring/mentorList";
    }

    //멘토 카테고리 필터
    @GetMapping("/mentorListCategory.do")
    public String mentorListCategory(
            @RequestParam("sc_idx") int sc_idx,
            HttpServletRequest request) {

        List<MentorListDTO> mentorList =
                mentoringService.mentorListCategory(sc_idx);

        request.setAttribute("mentorList", mentorList);
        request.setAttribute("activeCategory", sc_idx);

        return "/mentoring/mentorList";
    }
    
 // 멘토 프로필 등록 폼으로 이동
    @GetMapping("/mentorProfileForm.do")
    public String mentorProfileForm() {
        return "/mentoring/mentorProfileForm";
    }

    // 멘토 프로필 등록 저장
    @PostMapping("/mentorProfileCreate.do")
    public String mentorProfileCreate(MentoProfileDTO dto, HttpServletRequest request) {

        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");
        
        if(user_idx == null) {
        	return "redirect:/mentorList.do";
        }

        dto.setUser_idx(user_idx);

        int result = mentoringService.mentorProfileCreate(dto);

        // 성공하면 목록으로
        return "redirect:/mentorList.do";

    }
}
