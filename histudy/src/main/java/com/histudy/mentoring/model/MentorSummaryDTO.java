package com.histudy.mentoring.model;

import java.util.List;

public class MentorSummaryDTO {

    private int mentoring_idx;
    private String mentoring_title;

    private List<String> tags;

   
    private int mentor_idx;
    private int user_idx;              
    private String mentor_name;       
    private String mentor_profile_img;  

    private String job_group;
    private String job_role;
    private Integer career_years;

    private Double avg_rating;           
    private Integer review_count;        
	
    
    
    
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
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
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
	public String getMentor_name() {
		return mentor_name;
	}
	public void setMentor_name(String mentor_name) {
		this.mentor_name = mentor_name;
	}
	public String getMentor_profile_img() {
		return mentor_profile_img;
	}
	public void setMentor_profile_img(String mentor_profile_img) {
		this.mentor_profile_img = mentor_profile_img;
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
	public Integer getCareer_years() {
		return career_years;
	}
	public void setCareer_years(Integer career_years) {
		this.career_years = career_years;
	}
	public Double getAvg_rating() {
		return avg_rating;
	}
	public void setAvg_rating(Double avg_rating) {
		this.avg_rating = avg_rating;
	}
	public Integer getReview_count() {
		return review_count;
	}
	public void setReview_count(Integer review_count) {
		this.review_count = review_count;
	}

    
}
