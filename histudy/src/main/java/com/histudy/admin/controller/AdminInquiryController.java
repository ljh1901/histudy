package com.histudy.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.histudy.inquiry.model.InquiryDTO;
import com.histudy.inquiry.service.InquiryService;

@Controller
public class AdminInquiryController {

	@Autowired
	private InquiryService inquiryService;

	@RequestMapping("/adminInquiryList.do")
	public ModelAndView adminInquiryList() {
		List<InquiryDTO> list = inquiryService.getInquiryList();

		ModelAndView mav = new ModelAndView();
		mav.addObject("inquiryList", list);
		mav.setViewName("admin/adminInquiry/adminInquiryList");
		return mav;
	}
	
	@RequestMapping("/adminInquiryDetail.do")
	public ModelAndView adminInquiryDetail(@RequestParam("inquiry_idx") int idx) {
		InquiryDTO dto = inquiryService.getInquiryDetail(idx);

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("admin/adminInquiry/adminInquiryDetail");
		return mav;
	}

	@PostMapping("/adminInquiryReply.do")
	public ModelAndView insertReply(InquiryDTO dto) {
		int result = inquiryService.updateInquiryReply(dto);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminMsg");
		if (result > 0) {
			mav.addObject("msg", "답변이 등록되었습니다.");
			mav.addObject("url", "adminInquiryDetail.do?inquiry_idx=" + dto.getInquiry_idx());
		} else {
			mav.addObject("msg", "답변 등록 실패!");
			mav.addObject("url", "history.back()");
		}
		return mav;
	}
}
