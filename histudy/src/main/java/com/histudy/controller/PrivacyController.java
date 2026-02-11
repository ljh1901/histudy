package com.histudy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrivacyController {

	// 이용약관 페이지 연결
    @RequestMapping("/terms.do")
    public String terms() {
        return "privacy/terms"; 
    }

    // 개인정보처리방침 페이지 연결
    @RequestMapping("/privacy.do")
    public String privacy() {
        return "privacy/privacy";
    }
}
