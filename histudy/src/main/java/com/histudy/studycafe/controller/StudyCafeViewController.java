package com.histudy.studycafe.controller;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.histudy.studycafe.model.PayDTO;
import com.histudy.studycafe.model.SeatDTO;
import com.histudy.studycafe.model.StudycafeDTO;
import com.histudy.studycafe.model.StudycafeJoinReservationDTO;
import com.histudy.studycafe.model.StudycafeReservationDTO;
import com.histudy.studycafe.service.StudycafeSerivce;
import com.histudy.studycafe.service.StudycafeServiceImple;
import com.histudy.user.model.UserDTO;
import com.histudy.user.service.UserService;

@Controller
public class StudyCafeViewController {
	@Autowired
	private StudycafeSerivce studycafeService;
	
	@Autowired
	private UserService userService;
	
	// 1. 스터디 카페 뷰
	@GetMapping("/studycafe.do")
	public String studycafeView(Model model, HttpSession session) {
		List<StudycafeDTO> studycafeDTO = studycafeService.studycafeList();
		List<SeatDTO> seatList = studycafeService.seatInfo(1);
		if(session.getAttribute("user_id")!=null) {
		UserDTO udto = userService.userInfo((String)session.getAttribute("user_id"));
		model.addAttribute("udto", udto);
		}
		model.addAttribute("dto",studycafeDTO);
		model.addAttribute("seatList", seatList);
		return "studycafe/studycafeView";
	}
	
	// 스터디 카페 좌석 정보
	@GetMapping("/seatInfo.do")
	@ResponseBody
	public ResponseEntity<List<SeatDTO>> seatInfo(@RequestParam(value="studycafe_idx", required = true, defaultValue = "1") int studycafe_idx){
		System.out.println(studycafe_idx);
		List<SeatDTO> seatList = studycafeService.seatInfo(studycafe_idx);
		ResponseEntity<List<SeatDTO>> seatDTO = new ResponseEntity<List<SeatDTO>>(seatList, HttpStatus.OK);	
		return seatDTO;
	}

	// 스터디 카페 영수증 뷰
	@GetMapping("/receipt.do")
	public ModelAndView receiptView(@RequestParam String paymentId,
	                                @RequestParam(required=false) Integer viewTotalAmount,
	                                HttpSession session) {
	    ModelAndView mav = new ModelAndView();
	    try {
	        PayDTO receipt = studycafeService.processPaymentAndReservation(paymentId, viewTotalAmount, session);
	        mav.setViewName("studycafe/receipt");
	        mav.addObject("receipt", receipt);
	    } catch(Exception e) {
	        e.printStackTrace();
	        mav.setViewName("studycafe/receipt");
	        mav.addObject("msg", "결제를 취소하셨습니다.");
	    }
	    return mav;
	}



}
