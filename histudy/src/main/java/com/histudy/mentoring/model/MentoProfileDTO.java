package com.histudy.mentoring.model;

public class MentoProfileDTO {
    private int mentor_idx;
    private int user_idx;
    private String mentor_tel;
    private int sc_idx;
    private String mentor_intro;
    private String mentor_link;

    public MentoProfileDTO() {
    	
    }

	public int getMentor_idx() {
		return mentor_idx;
	}

	public void setMentor_idx(int mentor_idx) {
		this.mentor_idx = mentor_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getMentor_tel() {
		return mentor_tel;
	}

	public void setMentor_tel(String mentor_tel) {
		this.mentor_tel = mentor_tel;
	}

	public int getSc_idx() {
		return sc_idx;
	}

	public void setSc_idx(int sc_idx) {
		this.sc_idx = sc_idx;
	}

	public String getMentor_intro() {
		return mentor_intro;
	}

	public void setMentor_intro(String mentor_intro) {
		this.mentor_intro = mentor_intro;
	}

	public String getMentor_link() {
		return mentor_link;
	}

	public void setMentor_link(String mentor_link) {
		this.mentor_link = mentor_link;
	}

	public MentoProfileDTO(int mentor_idx, int user_idx, String mentor_tel, int sc_idx, String mentor_intro,
			String mentor_link) {
		super();
		this.mentor_idx = mentor_idx;
		this.user_idx = user_idx;
		this.mentor_tel = mentor_tel;
		this.sc_idx = sc_idx;
		this.mentor_intro = mentor_intro;
		this.mentor_link = mentor_link;
	}

    
}
