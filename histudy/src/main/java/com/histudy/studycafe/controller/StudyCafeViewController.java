package com.histudy.studycafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudyCafeViewController {
	
	@GetMapping("/studycafe.do")
	public String studycafeView() {
		return "studycafe/studycafeView";
	}
}
