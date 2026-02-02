package com.histudy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	//관리자 메인 대시보드
	@GetMapping("/adminMain.do")
	public String adminMain() {
		return "admin/adminMain";
	}
	//스터디 카페 관리
	//스터디 카페 전체 목록
	@GetMapping("/adminCafeList.do")
	public String adminCafeList() {
		return "admin/adminCafeList";
	}
	//입점 스터디 카페
	@GetMapping("/adminCafe1.do")
	public String adminCafeMain() {
		return "admin/adminCafe1";
	}
	//스터디 카페 매출화면
	@GetMapping("/adminCafeSales.do")
	public String adminCafeSales() {
		return "admin/adminCafeSales";
	}
	//스터디 카페 좌석현황
	@GetMapping("/adminCafeSeat.do")
	public String adminCafeSeat() {
		return "admin/adminCafeSeat";
	}
	//스터디 카페 문의사항
	@GetMapping("/adminCafeInquiryList.do")
	public String adminCafeInquiryList() {
		return "admin/adminCafeInquiryList";
	}
	//스터디 카페 요금제 등록
	@GetMapping("/adminCafePrice.do")
	public String adminCafePrice() {
		return "admin/adminCafePrice";
	}
	
	//자주 묻는 질문 관리
	@GetMapping("/adminFaqForm.do")
	public String adminFaqForm() {
		return "admin/adminFaqForm";
	}
}
