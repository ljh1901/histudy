package com.histudy.mentoring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.histudy.mentoring.model.*;
import com.histudy.mentoring.service.*;

@Controller
public class MentoringController {

    @Autowired
    private MentoringService mentoringService;

    @GetMapping("/mentorList.do")
    public String mentorList(HttpServletRequest request) {

        List<MentorListDTO> mentorList = mentoringService.mentorList();
        
        request.setAttribute("mentorList", mentorList);
        request.setAttribute("activeCategory", 0);
        
        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");
        
        boolean isMentor = false;
        if (user_idx != null) {
            isMentor = mentoringService.mentorProfileCount(user_idx) > 0;
        }
        request.setAttribute("isMentor", isMentor);

        return "/mentoring/mentorList";
    }

    @GetMapping("/mentorListCategory.do")
    public String mentorListCategory(
            @RequestParam("sc_idx") int sc_idx,
            HttpServletRequest request) {

        List<MentorListDTO> mentorList =
                mentoringService.mentorListCategory(sc_idx);

        request.setAttribute("mentorList", mentorList);
        request.setAttribute("activeCategory", sc_idx);

        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");

        boolean isMentor = false;
        if (user_idx != null) {
            isMentor = mentoringService.mentorProfileCount(user_idx) > 0;
        }
        request.setAttribute("isMentor", isMentor);
        
        return "/mentoring/mentorList";
    }
    
    @GetMapping("/mentorProfileForm.do")
    public String mentorProfileForm() {
        return "/mentoring/mentorProfileForm";
        
    }

    @PostMapping("/mentorProfileCreate.do")
    public String mentorProfileCreate(MentoProfileDTO dto, HttpServletRequest request, RedirectAttributes ra) {

        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");
        if(user_idx == null) {
        	ra.addFlashAttribute("msg","로그인이 필요합니다.");
        	return "redirect:/mentorList.do";
        }
        dto.setUser_idx(user_idx);
        
        if(mentoringService.mentorProfileCount(user_idx)<=0) {
        	int result = mentoringService.mentorProfileCreate(dto);
        	ra.addFlashAttribute("msg","멘토 등록 완료!");
        }
        else {
        	ra.addFlashAttribute("msg","멘토 등록이 이미 되어있음!");
        	
        }
        return "redirect:/mentorList.do";

    }
    
    @GetMapping("/mentoringCreate.do")
    public String mentoringCreate(HttpServletRequest request) {

        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");

        if (user_idx == null) {
            return "redirect:/mentorList.do";
        }

        if (mentoringService.mentorProfileCount(user_idx) <= 0) {
            return "redirect:/mentorList.do";
        }

        return "/mentoring/mentoringCreate";
    }

    
    
}

