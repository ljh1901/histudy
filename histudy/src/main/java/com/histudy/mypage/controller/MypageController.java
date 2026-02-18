package com.histudy.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.membership.model.MembershipPaymentDTO;
import com.histudy.membership.service.MembershipService;
	
@Controller
public class MypageController {
	@Autowired
	private MembershipService membershipService;

	@GetMapping("myDashboard.do")
	public ModelAndView myDashboard() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myDashboard");
		return mav;
	}
	@GetMapping("mySchedule.do")
	public ModelAndView mySchedule() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/mySchedule");
		return mav;
	}
	@GetMapping("myPurchase.do")
	public ModelAndView myPurchase(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		Integer user_idx=(Integer)session.getAttribute("user_idx");
//		List<MembershipPaymentDTO> list=membershipService.getPayment(user_idx);
//		mav.addObject("list",list);
		mav.setViewName("mypage/myPurchase");
		return mav;
	}
	@GetMapping("myHeart.do")
	public ModelAndView myHeart() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myHeart");
		return mav;
	}
	@GetMapping("myAlarm.do")
	public ModelAndView myAlarm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myAlarm");
		return mav;
	}
}
