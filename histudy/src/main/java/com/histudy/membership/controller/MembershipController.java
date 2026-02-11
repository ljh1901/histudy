package com.histudy.membership.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.mentoring.service.MentoringService;
import com.histudy.user.model.UserDTO;
import com.histudy.user.service.UserService;

@Controller
public class MembershipController {

    @Autowired
    private UserService userService;
    
	@GetMapping("membership.do")
	public ModelAndView membershipPayment(HttpSession session) {
		Integer user_idx = (Integer) session.getAttribute("user_idx");
	    String user_id = (String) session.getAttribute("user_id");
		ModelAndView mav=new ModelAndView();
		if(user_id!=null) {
			UserDTO udto=userService.userInfo(user_id);
			String name=udto.getUser_name();
			String email=udto.getUser_email();
			String tel=udto.getUser_tel();
			String id=udto.getUser_id();
			mav.addObject("uname",name);
			mav.addObject("uemail",email);
			mav.addObject("utel",tel);
			mav.addObject("uid",id);
		}
		
		mav.setViewName("membership/membershipPayment");
		return mav;
	}
	@PostMapping("/membership/verifys")
	public ModelAndView membershipResult() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("lecture/lectureList");
		return mav;
	}
	
}
