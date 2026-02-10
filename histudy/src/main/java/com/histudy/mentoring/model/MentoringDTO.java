package com.histudy.mentoring.model;

public class MentoringDTO {
    private int mentoring_idx;
    private String mentoring_title;
    private String job_group;
    private String job_role;
    private int career_years;
    private String company_name;
    private String contact_phone_public;
    private String contact_email_public;
    private int session_minutes;
    private String description;
    private String pre_notice;
    private String status;      
    private String created_at;  
    private int mentor_idx;
    private int sc_idx;

    public MentoringDTO() {
    	
    }

	public int getMentoring_idx() {
		return mentoring_idx;
	}

	public void setMentoring_idx(int mentoring_idx) {
		this.mentoring_idx = mentoring_idx;
	}

	public String getMentoring_title() {
		return mentoring_title;
	}

	public void setMentoring_title(String mentoring_title) {
		this.mentoring_title = mentoring_title;
	}

	public String getJob_group() {
		return job_group;
	}

	public void setJob_group(String job_group) {
		this.job_group = job_group;
	}

	public String getJob_role() {
		return job_role;
	}

	public void setJob_role(String job_role) {
		this.job_role = job_role;
	}

	public int getCareer_years() {
		return career_years;
	}

	public void setCareer_years(int career_years) {
		this.career_years = career_years;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getContact_phone_public() {
		return contact_phone_public;
	}

	public void setContact_phone_public(String contact_phone_public) {
		this.contact_phone_public = contact_phone_public;
	}

	public String getContact_email_public() {
		return contact_email_public;
	}

	public void setContact_email_public(String contact_email_public) {
		this.contact_email_public = contact_email_public;
	}

	public int getSession_minutes() {
		return session_minutes;
	}

	public void setSession_minutes(int session_minutes) {
		this.session_minutes = session_minutes;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPre_notice() {
		return pre_notice;
	}

	public void setPre_notice(String pre_notice) {
		this.pre_notice = pre_notice;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public int getMentor_idx() {
		return mentor_idx;
	}

	public void setMentor_idx(int mentor_idx) {
		this.mentor_idx = mentor_idx;
	}

	public int getSc_idx() {
		return sc_idx;
	}

	public void setSc_idx(int sc_idx) {
		this.sc_idx = sc_idx;
	}

	public MentoringDTO(int mentoring_idx, String mentoring_title, String job_group, String job_role, int career_years,
			String company_name, String contact_phone_public, String contact_email_public, int session_minutes,
			String description, String pre_notice, String status, String created_at, int mentor_idx, int sc_idx) {
		super();
		this.mentoring_idx = mentoring_idx;
		this.mentoring_title = mentoring_title;
		this.job_group = job_group;
		this.job_role = job_role;
		this.career_years = career_years;
		this.company_name = company_name;
		this.contact_phone_public = contact_phone_public;
		this.contact_email_public = contact_email_public;
		this.session_minutes = session_minutes;
		this.description = description;
		this.pre_notice = pre_notice;
		this.status = status;
		this.created_at = created_at;
		this.mentor_idx = mentor_idx;
		this.sc_idx = sc_idx;
	}
    

}
