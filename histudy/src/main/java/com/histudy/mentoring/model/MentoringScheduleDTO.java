package com.histudy.mentoring.model;

import java.util.Date;

public class MentoringScheduleDTO {
    private int schedule_id;
    private String status; 
    private Date mentoring_starttime;
    private Date mentoring_endtime;
    private int mentoring_idx;

    public MentoringScheduleDTO() {
    	
    }

	public int getSchedule_id() {
		return schedule_id;
	}

	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getMentoring_starttime() {
		return mentoring_starttime;
	}

	public void setMentoring_starttime(Date mentoring_starttime) {
		this.mentoring_starttime = mentoring_starttime;
	}

	public Date getMentoring_endtime() {
		return mentoring_endtime;
	}

	public void setMentoring_endtime(Date mentoring_endtime) {
		this.mentoring_endtime = mentoring_endtime;
	}

	public int getMentoring_idx() {
		return mentoring_idx;
	}

	public void setMentoring_idx(int mentoring_idx) {
		this.mentoring_idx = mentoring_idx;
	}

	public MentoringScheduleDTO(int schedule_id, String status, Date mentoring_starttime, Date mentoring_endtime,
			int mentoring_idx) {
		super();
		this.schedule_id = schedule_id;
		this.status = status;
		this.mentoring_starttime = mentoring_starttime;
		this.mentoring_endtime = mentoring_endtime;
		this.mentoring_idx = mentoring_idx;
	}

}
