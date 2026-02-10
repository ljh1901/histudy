package com.histudy.mentoring.model;

import java.util.Date;


public class MentorApplicationDTO {
  private int ma_id;
  private int mentee_user_idx;

  private String mentee_name;
  private String mentee_email;
  private String mentee_phone;
  private String mentee_profile_img;

  private String apply_content;
  private String status;
  private String reject_reason;

  private Date created_at;
  private Date updated_at;

  private int mentoring_idx;
  private String mentoring_title;
  
  public MentorApplicationDTO() {
  }
  
public int getMa_id() {
	return ma_id;
}
public void setMa_id(int ma_id) {
	this.ma_id = ma_id;
}
public int getMentee_user_idx() {
	return mentee_user_idx;
}
public void setMentee_user_idx(int mentee_user_idx) {
	this.mentee_user_idx = mentee_user_idx;
}
public String getMentee_name() {
	return mentee_name;
}
public void setMentee_name(String mentee_name) {
	this.mentee_name = mentee_name;
}
public String getMentee_email() {
	return mentee_email;
}
public void setMentee_email(String mentee_email) {
	this.mentee_email = mentee_email;
}
public String getMentee_phone() {
	return mentee_phone;
}
public void setMentee_phone(String mentee_phone) {
	this.mentee_phone = mentee_phone;
}
public String getMentee_profile_img() {
	return mentee_profile_img;
}
public void setMentee_profile_img(String mentee_profile_img) {
	this.mentee_profile_img = mentee_profile_img;
}
public String getApply_content() {
	return apply_content;
}
public void setApply_content(String apply_content) {
	this.apply_content = apply_content;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getReject_reason() {
	return reject_reason;
}
public void setReject_reason(String reject_reason) {
	this.reject_reason = reject_reason;
}
public Date getCreated_at() {
	return created_at;
}
public void setCreated_at(Date created_at) {
	this.created_at = created_at;
}
public Date getUpdated_at() {
	return updated_at;
}
public void setUpdated_at(Date updated_at) {
	this.updated_at = updated_at;
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
public MentorApplicationDTO(int ma_id, int mentee_user_idx, String mentee_name, String mentee_email,
		String mentee_phone, String mentee_profile_img, String apply_content, String status, String reject_reason,
		Date created_at, Date updated_at, int mentoring_idx, String mentoring_title) {
	super();
	this.ma_id = ma_id;
	this.mentee_user_idx = mentee_user_idx;
	this.mentee_name = mentee_name;
	this.mentee_email = mentee_email;
	this.mentee_phone = mentee_phone;
	this.mentee_profile_img = mentee_profile_img;
	this.apply_content = apply_content;
	this.status = status;
	this.reject_reason = reject_reason;
	this.created_at = created_at;
	this.updated_at = updated_at;
	this.mentoring_idx = mentoring_idx;
	this.mentoring_title = mentoring_title;
}

}
