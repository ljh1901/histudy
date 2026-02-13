package com.histudy.studycafe.service;

import java.util.List;

import com.histudy.studycafe.model.PayDTO;
import com.histudy.studycafe.model.SeatDTO;
import com.histudy.studycafe.model.StudycafeDTO;
import com.histudy.studycafe.model.StudycafeJoinReservationDTO;
import com.histudy.studycafe.model.StudycafeReservationDTO;
import com.histudy.studycafe.model.TicketJoinTicketCategoryDTO;

public interface StudycafeSerivce {
	public List<StudycafeDTO> studycafeList();
	public StudycafeJoinReservationDTO seatReservation(int seat_idx);
	public List<TicketJoinTicketCategoryDTO> ticketInfo(int ticket_category_idx);
	public List<SeatDTO> seatInfo(int studycafe_idx);
	public int orderPay(PayDTO payOrder);
	public int paySeat(PayDTO paydto);
	public PayDTO receipt(String paymentId);
	public TicketJoinTicketCategoryDTO ticketTotalAmount(int ticket_idx);
	public int reservationComplete(int seat_idx);
	public int registerReservation(Integer user_idx, int seat_idx, String starttime, String endttime, String reservation_status, int ticket_idx, String paymentId);
}
