package com.histudy.mentoring.model;

import java.util.Date;

public class MentoringReviewDTO {
  private int review_id;
  private int match_id;
  private int mentoring_idx;
  private int mentee_user_idx;

  private Double rating;
  private String review_content;
  private Date review_date;

  private String mentee_name;
  private String mentee_profile_img;
  
  public MentoringReviewDTO() {

}

public int getReview_id() {
	return review_id;
}

public void setReview_id(int review_id) {
	this.review_id = review_id;
}

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

public int getMentee_user_idx() {
	return mentee_user_idx;
}

public void setMentee_user_idx(int mentee_user_idx) {
	this.mentee_user_idx = mentee_user_idx;
}

public Double getRating() {
	return rating;
}

public void setRating(Double rating) {
	this.rating = rating;
}

public String getReview_content() {
	return review_content;
}

public void setReview_content(String review_content) {
	this.review_content = review_content;
}

public Date getReview_date() {
	return review_date;
}

public void setReview_date(Date review_date) {
	this.review_date = review_date;
}

public String getMentee_name() {
	return mentee_name;
}

public void setMentee_name(String mentee_name) {
	this.mentee_name = mentee_name;
}

public String getMentee_profile_img() {
	return mentee_profile_img;
}

public void setMentee_profile_img(String mentee_profile_img) {
	this.mentee_profile_img = mentee_profile_img;
}

public MentoringReviewDTO(int review_id, int match_id, int mentoring_idx, int mentee_user_idx, Double rating,
		String review_content, Date review_date, String mentee_name, String mentee_profile_img) {
	super();
	this.review_id = review_id;
	this.match_id = match_id;
	this.mentoring_idx = mentoring_idx;
	this.mentee_user_idx = mentee_user_idx;
	this.rating = rating;
	this.review_content = review_content;
	this.review_date = review_date;
	this.mentee_name = mentee_name;
	this.mentee_profile_img = mentee_profile_img;
}
  
  
}
