package com.histudy.studycafe.service;

import java.util.List;

import com.histudy.studycafe.model.StudycafeDAO;
import com.histudy.studycafe.model.StudycafeDTO;
import com.histudy.studycafe.model.StudycafeJoinReservationDTO;
import com.histudy.studycafe.model.TicketJoinTicketCategoryDTO;

public class StudycafeServiceImple implements StudycafeSerivce{
	
	private StudycafeDAO studycafeDAO;
	
	
	public StudycafeServiceImple(StudycafeDAO studycafeDAO) {
		super();
		this.studycafeDAO = studycafeDAO;
	}


	@Override
	public List<StudycafeDTO> studycafeList() {
		List<StudycafeDTO> studycafeList = studycafeDAO.studycafeList();
		return studycafeList;
	}
	
	@Override
	public StudycafeJoinReservationDTO seatInfo(int seat_idx) {
		StudycafeJoinReservationDTO seatInfo = studycafeDAO.seatInfo(seat_idx);
		return seatInfo;
	}
	
	@Override
	public List<TicketJoinTicketCategoryDTO> ticketInfo(int ticket_category_idx) {
	List<TicketJoinTicketCategoryDTO> ticketInfo = studycafeDAO.ticketInfo(ticket_category_idx);
	return ticketInfo;
}
}
