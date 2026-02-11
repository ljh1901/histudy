package com.histudy.schedule.model;

public class ScheduleDTO {
	    private int schedule_idx;
	    private int user_idx;
	    private Integer study_idx; // null 허용을 위해 객체 타입 사용
	    private String schedule_title;
	    private String schedule_content;
	    private String schedule_start_date; // FullCalendar와 연동을 위해 String 처리
	    private String schedule_end_date;
	    private String schedule_color;
	    private String schedule_regdate;

	    public ScheduleDTO() {
	    	
	    }

		public int getSchedule_idx() {
			return schedule_idx;
		}

		public void setSchedule_idx(int schedule_idx) {
			this.schedule_idx = schedule_idx;
		}

		public int getUser_idx() {
			return user_idx;
		}

		public void setUser_idx(int user_idx) {
			this.user_idx = user_idx;
		}

		public Integer getStudy_idx() {
			return study_idx;
		}

		public void setStudy_idx(Integer study_idx) {
			this.study_idx = study_idx;
		}

		public String getSchedule_title() {
			return schedule_title;
		}

		public void setSchedule_title(String schedule_title) {
			this.schedule_title = schedule_title;
		}

		public String getSchedule_content() {
			return schedule_content;
		}

		public void setSchedule_content(String schedule_content) {
			this.schedule_content = schedule_content;
		}

		public String getSchedule_start_date() {
			return schedule_start_date;
		}

		public void setSchedule_start_date(String schedule_start_date) {
			this.schedule_start_date = schedule_start_date;
		}

		public String getSchedule_end_date() {
			return schedule_end_date;
		}

		public void setSchedule_end_date(String schedule_end_date) {
			this.schedule_end_date = schedule_end_date;
		}

		public String getSchedule_color() {
			return schedule_color;
		}

		public void setSchedule_color(String schedule_color) {
			this.schedule_color = schedule_color;
		}

		public String getSchedule_regdate() {
			return schedule_regdate;
		}

		public void setSchedule_regdate(String schedule_regdate) {
			this.schedule_regdate = schedule_regdate;
		}

		public ScheduleDTO(int schedule_idx, int user_idx, Integer study_idx, String schedule_title,
				String schedule_content, String schedule_start_date, String schedule_end_date, String schedule_color,
				String schedule_regdate) {
			super();
			this.schedule_idx = schedule_idx;
			this.user_idx = user_idx;
			this.study_idx = study_idx;
			this.schedule_title = schedule_title;
			this.schedule_content = schedule_content;
			this.schedule_start_date = schedule_start_date;
			this.schedule_end_date = schedule_end_date;
			this.schedule_color = schedule_color;
			this.schedule_regdate = schedule_regdate;
		}
	    
	    
	}
