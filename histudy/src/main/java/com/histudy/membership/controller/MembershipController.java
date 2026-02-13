package com.histudy.membership.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.membership.model.MembershipDAO;
import com.histudy.membership.model.MembershipDTO;
import com.histudy.membership.model.MembershipPaymentDTO;
import com.histudy.membership.service.MembershipService;
import com.histudy.mentoring.service.MentoringService;
import com.histudy.user.model.UserDTO;
import com.histudy.user.service.UserService;

@Controller
public class MembershipController {

    @Autowired
    private MembershipService membershipService;
    @Autowired
    private UserService userService;
    
	@GetMapping("membership.do")
	public ModelAndView membershipPayment(HttpSession session) {
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
	@PostMapping("/cookieMake.do") 
	@ResponseBody 
	public Map<String, Object> cookieMake(HttpServletResponse resp, @RequestBody MembershipPaymentDTO dto) {
	    
	    membershipService.insertPrimium(dto);
	    System.out.println(dto.getPayment_amount());
	    System.out.println("DB 저장 및 쿠키 생성 시작");
	    
	    Cookie ck = new Cookie("membershiip", "premium"); 
	    ck.setPath("/"); 
	    ck.setMaxAge(60*60*24*30); // 30일
	    resp.addCookie(ck);
	    
	    Map<String, Object> map = new HashMap<>();
	    map.put("result", "success");
	    
	    return map; 
	}
}
