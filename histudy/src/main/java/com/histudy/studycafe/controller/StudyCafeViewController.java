package com.histudy.studycafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class StudyCafeViewController {
	@GetMapping("/studycafe.do")
	public String studycafeView(Model model) {
		String storeId = "store-83eacdb9-6d28-4c80-b53b-26d96da03490";
		String channelKey="channel-key-da563d5f-f117-444f-aba5-ad9b66277c1b";
		model.addAttribute("storeId", storeId);
		model.addAttribute("channelKey",channelKey);
		return "studycafe/studycafeView";
	}
}
