package com.histudy.studycafe.model;

import java.util.List;

public interface StudycafeDAO {
	public List<StudycafeDTO> studycafeList();
	public StudycafeJoinReservationDTO seatReservation(int seat_idx);
	public List<TicketJoinTicketCategoryDTO> ticketInfo(int ticket_category_idx);
	public List<SeatDTO> seatInfo(int studycafe_idx);
	public int orderPay(PayDTO payOrder);
	public int paySeat(PayDTO paydto);
	public PayDTO receipt(String paymentId); // 영수증
	public int registerReservation(StudycafeReservationDTO srdto);
	public TicketJoinTicketCategoryDTO ticketTotalAmount(int ticket_idx);
}
