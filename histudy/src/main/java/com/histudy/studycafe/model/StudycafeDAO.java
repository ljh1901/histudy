package com.histudy.studycafe.model;

import java.util.List;

public interface StudycafeDAO {
	public List<StudycafeDTO> studycafeList();
	public StudycafeJoinReservationDTO seatInfo(int seat_idx);
	public List<TicketJoinTicketCategoryDTO> ticketInfo(int ticket_category_idx);
}
