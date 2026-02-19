package com.histudy.notifications.model;

public class NotificationsDTO {
    private int n_idx;
    private int n_sender_idx;
    private String n_type;
    private String n_title;
    private String n_content;
    private String n_read;
    private String n_date;
    private int user_idx;
    
    public NotificationsDTO() {
		// TODO Auto-generated constructor stub
	}
    
	public NotificationsDTO(int n_idx, int n_sender_idx, String n_type, String n_title, String n_content, String n_read,
			String n_date, int user_idx) {
		super();
		this.n_idx = n_idx;
		this.n_sender_idx = n_sender_idx;
		this.n_type = n_type;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_read = n_read;
		this.n_date = n_date;
		this.user_idx = user_idx;
	}

	public int getN_idx() {
		return n_idx;
	}

	public void setN_idx(int n_idx) {
		this.n_idx = n_idx;
	}

	public int getN_sender_idx() {
		return n_sender_idx;
	}

	public void setN_sender_idx(int n_sender_idx) {
		this.n_sender_idx = n_sender_idx;
	}

	public String getN_type() {
		return n_type;
	}

	public void setN_type(String n_type) {
		this.n_type = n_type;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_read() {
		return n_read;
	}

	public void setN_read(String n_read) {
		this.n_read = n_read;
	}

	public String getN_date() {
		return n_date;
	}

	public void setN_date(String n_date) {
		this.n_date = n_date;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
    
    
}
