package com.histudy.studycafe.service;

import java.util.List;

import com.histudy.studycafe.model.StudycafeDTO;
import com.histudy.studycafe.model.StudycafeJoinReservationDTO;
import com.histudy.studycafe.model.TicketJoinTicketCategoryDTO;

public interface StudycafeSerivce {
	public List<StudycafeDTO> studycafeList();
	public StudycafeJoinReservationDTO seatInfo(int seat_idx);
	public List<TicketJoinTicketCategoryDTO> ticketInfo(int ticket_category_idx);
}
