package com.histudy.mentoring.model;


public class MentoringScheduleDTO {
    private int schedule_id;
    private String status; 
    private String mentoring_start_time;
    private String mentoring_end_time;
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

	public String getMentoring_start_time() {
		return mentoring_start_time;
	}

	public void setMentoring_start_time(String mentoring_start_time) {
		this.mentoring_start_time = mentoring_start_time;
	}

	public String getMentoring_end_time() {
		return mentoring_end_time;
	}

	public void setMentoring_end_time(String mentoring_end_time) {
		this.mentoring_end_time = mentoring_end_time;
	}

	public int getMentoring_idx() {
		return mentoring_idx;
	}

	public void setMentoring_idx(int mentoring_idx) {
		this.mentoring_idx = mentoring_idx;
	}

	public MentoringScheduleDTO(int schedule_id, String status, String mentoring_start_time, String mentoring_end_time,
			int mentoring_idx) {
		super();
		this.schedule_id = schedule_id;
		this.status = status;
		this.mentoring_start_time = mentoring_start_time;
		this.mentoring_end_time = mentoring_end_time;
		this.mentoring_idx = mentoring_idx;
	}

	
    
}
