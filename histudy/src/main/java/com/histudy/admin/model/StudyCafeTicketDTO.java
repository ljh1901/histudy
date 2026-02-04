package com.histudy.admin.model;

public class StudyCafeTicketDTO {
	private int ticket_idx;
    private int ticket_category_idx;
    private int ticket_amount;
    private String ticket_name;
    
    private String ticket_category_name;

	public StudyCafeTicketDTO(int ticket_idx, int ticket_category_idx, int ticket_amount, String ticket_name,
			String ticket_category_name) {
		super();
		this.ticket_idx = ticket_idx;
		this.ticket_category_idx = ticket_category_idx;
		this.ticket_amount = ticket_amount;
		this.ticket_name = ticket_name;
		this.ticket_category_name = ticket_category_name;
	}

	public int getTicket_idx() {
		return ticket_idx;
	}

	public void setTicket_idx(int ticket_idx) {
		this.ticket_idx = ticket_idx;
	}

	public int getTicket_category_idx() {
		return ticket_category_idx;
	}

	public void setTicket_category_idx(int ticket_category_idx) {
		this.ticket_category_idx = ticket_category_idx;
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

	public String getTicket_category_name() {
		return ticket_category_name;
	}

	public void setTicket_category_name(String ticket_category_name) {
		this.ticket_category_name = ticket_category_name;
	}
    
    
}
