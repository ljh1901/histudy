package com.histudy.studycafe.controller;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.histudy.studycafe.model.PayDTO;
import com.histudy.studycafe.model.TicketJoinTicketCategoryDTO;
import com.histudy.studycafe.service.StudycafeSerivce;
import com.histudy.studycafe.service.StudycafeServiceImple;

@RestController
@RequestMapping("/studycafe/payment")
public class StudyCafePayController {
	
	@Autowired
	private StudycafeSerivce studycafeService;
	
	@PostMapping(value="/payNotComplete.do")
	public ResponseEntity<PayDTO> payNotComplete(@RequestBody PayDTO payOrder,HttpSession session, @RequestParam int ticket_idx){
		payOrder.setUser_idx((Integer) session.getAttribute("user_idx"));
		int result = studycafeService.orderPay(payOrder);
		TicketJoinTicketCategoryDTO tjtcdto = studycafeService.ticketTotalAmount(ticket_idx);
		PayDTO payRequest = result>0?payOrder:null;
		payRequest.setTotalAmount(tjtcdto.getTicket_amount());
		ResponseEntity<PayDTO> re = new ResponseEntity<PayDTO>(payRequest, HttpStatus.OK);
		return re;
	}
}
