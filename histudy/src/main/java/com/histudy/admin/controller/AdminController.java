package com.histudy.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AdminController {

	// 관리자 메인 대시보드
	@GetMapping("/adminMain.do")
	public String adminMain() {
		return "admin/adminMain";	
	} 

}