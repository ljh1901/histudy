package com.histudy.membership.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.membership.model.MembershipDAO;
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
	@PostMapping("/membership/verify")
    @ResponseBody
    public Map<String, Object> verifyPayment(@RequestBody Map<String, String> payload) {
        String receiptId = payload.get("receipt_id");
        String userId = payload.get("user_id");

        System.out.println(">>> 결제ID: " + receiptId);
        System.out.println(">>> 유저ID: " + userId);
        
        Map<String, Object> result = new HashMap<String, Object>();
        try {
        	MembershipPaymentDTO dto = new MembershipPaymentDTO();
            dto.setPayId(receiptId);        
            
        	membershipService.insertPayment(dto);
            System.out.println("DB저장 성공");
            result.put("verified", true); 
        } catch (Exception e) {
            e.printStackTrace();
            result.put("verified", false); 
            result.put("message", "DB 에러 발생");
        }
        return result;
    }
	
}
