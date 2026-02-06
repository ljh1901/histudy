package com.histudy.studycafe.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.histudy.studycafe.model.StudycafeDTO;
import com.histudy.studycafe.service.StudycafeSerivce;
import com.histudy.studycafe.service.StudycafeServiceImple;

@Controller
public class StudyCafeViewController {
	@Autowired
	private StudycafeSerivce studycafeService;
	
	@GetMapping("/studycafe.do")
	public String studycafeView(Model model) {
		List<StudycafeDTO> dto = studycafeService.studycafeList();
		String storeId = "store-83eacdb9-6d28-4c80-b53b-26d96da03490";
		String channelKey="channel-key-da563d5f-f117-444f-aba5-ad9b66277c1b";
		model.addAttribute("dto",dto);
		model.addAttribute("storeId", storeId);
		model.addAttribute("size", dto.size());
		return "studycafe/studycafeView";
	}
}
