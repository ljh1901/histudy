package com.histudy.mentoring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class MentoringController {
    @GetMapping("/mentorList.do")
    public String mentorList(HttpServletRequest request) {
    	
        return "/mentoring/mentorList";
    }
}

