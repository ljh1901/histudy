package com.histudy.mentoring.model;

import java.util.Date;

public class MentorMatchDTO {
    private int match_id;
    private int mentoring_idx;
    private Date matched_time;
    private String status;
    private int mentor_idx;
    private int mentee_user_idx;

    public MentorMatchDTO() {}

	public int getMatch_id() {
		return match_id;
	}

	public void setMatch_id(int match_id) {
		this.match_id = match_id;
	}

	public int getMentoring_idx() {
		return mentoring_idx;
	}

	public void setMentoring_idx(int mentoring_idx) {
		this.mentoring_idx = mentoring_idx;
	}

	public Date getMatched_time() {
		return matched_time;
	}

	public void setMatched_time(Date matched_time) {
		this.matched_time = matched_time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMentor_idx() {
		return mentor_idx;
	}

	public void setMentor_idx(int mentor_idx) {
		this.mentor_idx = mentor_idx;
	}

	public int getMentee_user_idx() {
		return mentee_user_idx;
	}

	public void setMentee_user_idx(int mentee_user_idx) {
		this.mentee_user_idx = mentee_user_idx;
	}

	public MentorMatchDTO(int match_id, int mentoring_idx, Date matched_time, String status, int mentor_idx,
			int mentee_user_idx) {
		super();
		this.match_id = match_id;
		this.mentoring_idx = mentoring_idx;
		this.matched_time = matched_time;
		this.status = status;
		this.mentor_idx = mentor_idx;
		this.mentee_user_idx = mentee_user_idx;
	}

    
}
