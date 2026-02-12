package com.histudy.studycafe.model;

public class TicketJoinTicketCategoryDTO {
	private int ticket_category_idx;
	private String ticket_category_name;
	private int studycafe_idx;
	private int ticket_idx;
	private int ticket_amount;
	private int ticket_time;
	private String ticket_name;
	public TicketJoinTicketCategoryDTO() {
		super();
	}
	public TicketJoinTicketCategoryDTO(int ticket_category_idx, String ticket_category_name, int studycafe_idx,
			int ticket_idx, int ticket_amount, String ticket_name, int ticket_time) {
		super();
		this.ticket_category_idx = ticket_category_idx;
		this.ticket_category_name = ticket_category_name;
		this.studycafe_idx = studycafe_idx;
		this.ticket_idx = ticket_idx;
		this.ticket_amount = ticket_amount;
		this.ticket_name = ticket_name;
		this.ticket_time = ticket_time;
	}
	public int getTicket_category_idx() {
		return ticket_category_idx;
	}
	public void setTicket_category_idx(int ticket_category_idx) {
		this.ticket_category_idx = ticket_category_idx;
	}
	public String getTicket_category_name() {
		return ticket_category_name;
	}
	public void setTicket_category_name(String ticket_category_name) {
		this.ticket_category_name = ticket_category_name;
	}
	public int getStudycafe_idx() {
		return studycafe_idx;
	}
	public void setStudycafe_idx(int studycafe_idx) {
		this.studycafe_idx = studycafe_idx;
	}
	public int getTicket_idx() {
		return ticket_idx;
	}
	public void setTicket_idx(int ticket_idx) {
		this.ticket_idx = ticket_idx;
	}
	public int getTicket_amount() {
		return ticket_amount;
	}
	public void setTicket_amount(int ticket_amount) {
		this.ticket_amount = ticket_amount;
	}
	public String getTicket_name() {
		return ticket_name;
	}
	public void setTicket_name(String ticket_name) {
		this.ticket_name = ticket_name;
	}
	public int getTicket_time() {
		return ticket_time;
	}
	public void setTicket_time(int ticket_time) {
		this.ticket_time = ticket_time;
	}
	
	
}
