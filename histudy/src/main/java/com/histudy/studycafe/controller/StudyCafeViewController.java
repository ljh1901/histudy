package com.histudy.studycafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

// ºä¸¸ Ã³¸®
@Controller
public class StudyCafeViewController {
	
	@GetMapping("/studycafe.do")
	public String studycafeView() {
		return "studycafe/studycafeView";
	}
}
