package com.histudy.mentoring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

        return "/mentoring/mentorList";
    }
    
 // 硫섑넗 �봽濡쒗븘 �벑濡� �뤌�쑝濡� �씠�룞
    @GetMapping("/mentorProfileForm.do")
    public String mentorProfileForm() {
        return "/mentoring/mentorProfileForm";
    }

    @PostMapping("/mentorProfileCreate.do")
    public String mentorProfileCreate(MentoProfileDTO dto, HttpServletRequest request) {

        HttpSession session = request.getSession();
        Integer user_idx = (Integer) session.getAttribute("user_idx");
        if(user_idx == null) {
        	return "redirect:/mentorList.do";
        }
        dto.setUser_idx(user_idx);
        int result = mentoringService.mentorProfileCreate(dto);
<<<<<<< HEAD
=======

        // �꽦怨듯븯硫� 紐⑸줉�쑝濡�
>>>>>>> 7281913589687c8c03e06e3a8a87b26d3b895c6c
        return "redirect:/mentorList.do";

    }
}

