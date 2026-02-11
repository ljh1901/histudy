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
	public StudycafeJoinReservationDTO seatReservation(int seat_idx) {
		StudycafeJoinReservationDTO seatInfo = sqlSession.selectOne("selectSeatInfoSQL", seat_idx);
		return seatInfo;
	}
	@Override
	public List<TicketJoinTicketCategoryDTO> ticketInfo(int ticket_category_idx) {
		List<TicketJoinTicketCategoryDTO> ticketInfo = sqlSession.selectList("selectTicketInfoSQL", ticket_category_idx);
		return ticketInfo;
	}
	@Override
	public List<SeatDTO> seatInfo(int studycafe_idx) {
		List<SeatDTO> seatDTO = sqlSession.selectList("selectSeatSQL", studycafe_idx);
		return seatDTO;
	}
	@Override
	public int orderPay(PayDTO payOrder) {
		int result = sqlSession.insert("insertOrderSQL", payOrder);
		return result;
	}
	@Override
	public int paySeat(PayDTO paydto) {
		int result = sqlSession.insert("updatePaySQL", paydto);
		return result;
	}
	@Override
	public PayDTO receipt(String paymentId) {
		PayDTO receipt = sqlSession.selectOne("selectReceiptSQL",paymentId);
		return receipt;
	}
	
	@Override
	public TicketJoinTicketCategoryDTO ticketTotalAmount(int ticket_idx) {
		TicketJoinTicketCategoryDTO tjtc = sqlSession.selectOne("selectTicketTotalAmountSQL", ticket_idx);
		return tjtc;
	}
}
