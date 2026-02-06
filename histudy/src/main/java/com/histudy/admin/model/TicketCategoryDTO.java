package com.histudy.admin.model;

public class TicketCategoryDTO {
	
	private int ticket_category_idx;
    private String ticket_category_name;
	public TicketCategoryDTO(int ticket_category_idx, String ticket_category_name) {
		super();
		this.ticket_category_idx = ticket_category_idx;
		this.ticket_category_name = ticket_category_name;
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
    
    
}
