package com.histudy.mentoring.model;

import java.util.List;

public class MentoringDetailDTO {
  private int mentoring_idx;
  private String mentoring_title;
  private String job_group;
  private String job_role;
  private Integer career_years;
  private String description;
  private String pre_notice;
  private List<String> tags; 
  private List<MentoringScheduleDTO> schedules;
  private String status;
  
  private int mentor_idx;
  private int mentor_user_idx;
  private String mentor_name;
  private String mentor_profile_img;

  private Double avg_rating;
  private Integer review_count;

  public MentoringDetailDTO() {
	// TODO Auto-generated constructor stub
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
public Integer getCareer_years() {
	return career_years;
}
public void setCareer_years(Integer career_years) {
	this.career_years = career_years;
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
public int getMentor_idx() {
	return mentor_idx;
}
public void setMentor_idx(int mentor_idx) {
	this.mentor_idx = mentor_idx;
}
public int getMentor_user_idx() {
	return mentor_user_idx;
}
public void setMentor_user_idx(int mentor_user_idx) {
	this.mentor_user_idx = mentor_user_idx;
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
public List<String> getTags() {
	return tags;
}
public void setTags(List<String> tags) {
	this.tags = tags;
}

public List<MentoringScheduleDTO> getSchedules() {
	return schedules;
}

public void setSchedules(List<MentoringScheduleDTO> schedules) {
	this.schedules = schedules;
}


public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public MentoringDetailDTO(int mentoring_idx, String mentoring_title, String job_group, String job_role,
		Integer career_years, String description, String pre_notice, List<String> tags,
		List<MentoringScheduleDTO> schedules, String status, int mentor_idx, int mentor_user_idx, String mentor_name,
		String mentor_profile_img, Double avg_rating, Integer review_count) {
	super();
	this.mentoring_idx = mentoring_idx;
	this.mentoring_title = mentoring_title;
	this.job_group = job_group;
	this.job_role = job_role;
	this.career_years = career_years;
	this.description = description;
	this.pre_notice = pre_notice;
	this.tags = tags;
	this.schedules = schedules;
	this.status = status;
	this.mentor_idx = mentor_idx;
	this.mentor_user_idx = mentor_user_idx;
	this.mentor_name = mentor_name;
	this.mentor_profile_img = mentor_profile_img;
	this.avg_rating = avg_rating;
	this.review_count = review_count;
}



}
