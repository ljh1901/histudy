package com.histudy.studycafe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.histudy.studycafe.model.StudycafeJoinReservationDTO;
import com.histudy.studycafe.model.TicketJoinTicketCategoryDTO;
import com.histudy.studycafe.service.StudycafeSerivce;

@RestController
@RequestMapping("/seatReservation.do")
public class StudyCafeController {
	
	@Autowired
	private StudycafeSerivce studycafeService;
	
	@GetMapping
	public ResponseEntity<List<TicketJoinTicketCategoryDTO>> ticketInfo(@RequestParam int ticket_category_idx) {
		List<TicketJoinTicketCategoryDTO> data = studycafeService.ticketInfo(ticket_category_idx);
		ResponseEntity<List<TicketJoinTicketCategoryDTO>> re = new ResponseEntity<List<TicketJoinTicketCategoryDTO>>(data,HttpStatus.OK);
		return re;
	}
	
	@PostMapping
	public StudycafeJoinReservationDTO seatReservation(@RequestBody StudycafeJoinReservationDTO sjrdto) {
		StudycafeJoinReservationDTO info = studycafeService.seatReservation(sjrdto.getSeat_idx());
		return info;
	}
}
