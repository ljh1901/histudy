package com.histudy.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.histudy.admin.service.*;

@Controller
public class AdminController {

	// 관리자 메인 대시보드
	@GetMapping("/adminMain.do")
	public String adminMain() {
		return "admin/adminMain";	
	} 
	
	@GetMapping("/adminInquiryList.do")
	public String adminInquiryList() {
		return ("admin/adminInquiry/adminInquiryList");
	}
	@GetMapping("/adminInquiryDetail.do")
	public String adminInquiryDetail() {
		return ("admin/adminInquiry/adminInquiryDetail");
	}
}