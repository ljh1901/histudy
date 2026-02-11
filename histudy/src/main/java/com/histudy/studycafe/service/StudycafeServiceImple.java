package com.histudy.studycafe.service;

import java.util.List;

import com.histudy.studycafe.model.PayDTO;
import com.histudy.studycafe.model.SeatDTO;
import com.histudy.studycafe.model.StudycafeDAO;
import com.histudy.studycafe.model.StudycafeDTO;
import com.histudy.studycafe.model.StudycafeJoinReservationDTO;
import com.histudy.studycafe.model.TicketJoinTicketCategoryDTO;

public class StudycafeServiceImple implements StudycafeSerivce {

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
	public StudycafeJoinReservationDTO seatReservation(int seat_idx) {
		StudycafeJoinReservationDTO seatInfo = studycafeDAO.seatReservation(seat_idx);
		return seatInfo;
	}

	@Override
	public List<TicketJoinTicketCategoryDTO> ticketInfo(int ticket_category_idx) {
		List<TicketJoinTicketCategoryDTO> ticketInfo = studycafeDAO.ticketInfo(ticket_category_idx);
		return ticketInfo;
	}

	@Override
	public List<SeatDTO> seatInfo(int studycafe_idx) {
		List<SeatDTO> seatDTO = studycafeDAO.seatInfo(studycafe_idx);
		return seatDTO;
	}
	@Override
	public int orderPay(PayDTO payOrder) {
		int result = studycafeDAO.orderPay(payOrder);
		return result;
	}
	
	@Override
	public int paySeat(PayDTO paydto) {
		int result = studycafeDAO.paySeat(paydto);
		return result;
	}
	@Override
	public PayDTO receipt(String paymentId) {
		PayDTO receipt = studycafeDAO.receipt(paymentId);
		return receipt;
	}
	
	@Override
	public TicketJoinTicketCategoryDTO ticketTotalAmount(int ticket_idx) {
		TicketJoinTicketCategoryDTO tjtc = studycafeDAO.ticketTotalAmount(ticket_idx);
		return tjtc;
	}
}
