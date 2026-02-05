package com.histudy.studycafe.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class StudycafeDAOImple implements StudycafeDAO{
	private SqlSessionTemplate sqlSession;

	public StudycafeDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<StudycafeDTO> studycafeList() {
		List<StudycafeDTO> list = sqlSession.selectList("studycafeListSQL");
		return list;
	}
	@Override
	public StudycafeJoinReservationDTO seatInfo(int seat_idx) {
		StudycafeJoinReservationDTO seatInfo = sqlSession.selectOne("selectSeatInfoSQL", seat_idx);
		return seatInfo;
	}
	@Override
	public List<TicketJoinTicketCategoryDTO> ticketInfo(int ticket_category_idx) {
		List<TicketJoinTicketCategoryDTO> ticketInfo = sqlSession.selectList("selectTicketInfoSQL", ticket_category_idx);
		return ticketInfo;
	}
	
}
