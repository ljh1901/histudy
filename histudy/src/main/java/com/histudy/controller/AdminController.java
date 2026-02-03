package com.histudy.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.admin.model.*;
import com.histudy.admin.service.*;

@Controller
public class AdminController {
	
	@Autowired
    private AdminService adminService;
	
	@Autowired
    private FaqService faqService;
	

	// 관리자 메인 대시보드
    @GetMapping("/adminMain.do")
    public String adminMain() {
        return "admin/adminMain";
    }
    // 스터디 카페 전체 목록
    @GetMapping("/adminCafeList.do")
    public ModelAndView adminList() {
        List<StudyCafeDTO> list = adminService.getCafeList();
        
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/adminCafeList"); 
        mav.addObject("cafeList", list);
        
        return mav;
    }
    @GetMapping("/adminCafeDetail.do")
    public ModelAndView adminCafeDetail(@RequestParam("studycafe_idx") int idx) {
        ModelAndView mav = new ModelAndView();    
        mav.setViewName("admin/adminCafeDetail");
        return mav;
    }
	//스터디 카페 매출화면
    @GetMapping("/adminCafeSales.do")
    public ModelAndView adminCafeSales(@RequestParam Map<String, Object> params) {
        List<Map<String, Object>> salesData = adminService.getSalesList(params);
        return new ModelAndView("admin/adminCafeSales").addObject("salesData", salesData);
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
	//자주 묻는 질문 리스트
	@GetMapping("/adminFaqForm.do")
	public ModelAndView adminFaqForm(@RequestParam(value="menu_category_idx", required=false) Integer menuCategoryIdx) {
	    ModelAndView mav = new ModelAndView("admin/adminFaqForm");
	    
	    List<MenuCategoryDTO> categoryList = faqService.getCategoryList();
	    List<FaqDTO> faqList = faqService.getFaqList(menuCategoryIdx);
	    
	    mav.addObject("categoryList", categoryList);
	    mav.addObject("faqList", faqList);
	    return mav;
	    }
	//자주 묻는 질문 등록
    @GetMapping("/adminFaqWrite.do")
    public ModelAndView adminFaqWrite() {
        ModelAndView mav = new ModelAndView("admin/adminFaqWrite");
        mav.addObject("categoryList", faqService.getCategoryList());
        return mav;
    }
}
