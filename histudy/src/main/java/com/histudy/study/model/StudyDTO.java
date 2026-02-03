package com.histudy.study.model;

import java.util.*;

public class StudyDTO {

	private int study_idx; // 스터디 번호
	private String study_title; // 스터디 제목
	private String study_content; // 스터디 내용
	private Date study_start_date; // 스터디 개설일
	private String study_end_date; // 스터디 마감일
	private int study_current_members; // 현재 인원수
	private int study_max_members; // 최대 인원수
	private double study_location_lng; // 경도
	private double study_location_lat; // 위도
	private String study_addr; // 스터디 장소
	private String study_upload_img; // 스터디 배경 이미지
	private int sc_idx; // 카테고리 번호
	private int user_idx; // 회원번호
	
	public StudyDTO() {
		// TODO Auto-generated constructor stub
	}

	public StudyDTO(int study_idx, String study_title, String study_content, Date study_start_date, String study_end_date,
			int study_current_members, int study_max_members, double study_location_lng, double study_location_lat,
			String study_addr, String study_upload_img, int sc_idx, int user_idx) {
		super();
		this.study_idx = study_idx;
		this.study_title = study_title;
		this.study_content = study_content;
		this.study_start_date = study_start_date;
		this.study_end_date = study_end_date;
		this.study_current_members = study_current_members;
		this.study_max_members = study_max_members;
		this.study_location_lng = study_location_lng;
		this.study_location_lat = study_location_lat;
		this.study_addr = study_addr;
		this.study_upload_img = study_upload_img;
		this.sc_idx = sc_idx;
		this.user_idx = user_idx;
	}

	public int getStudy_idx() {
		return study_idx;
	}

	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}

	public String getStudy_title() {
		return study_title;
	}

	public void setStudy_title(String study_title) {
		this.study_title = study_title;
	}

	public String getStudy_content() {
		return study_content;
	}

	public void setStudy_content(String study_content) {
		this.study_content = study_content;
	}

	public Date getStudy_start_date() {
		return study_start_date;
	}

	public void setStudy_start_date(Date study_start_date) {
		this.study_start_date = study_start_date;
	}

	public String getStudy_end_date() {
		return study_end_date;
	}

	public void setStudy_end_date(String study_end_date) {
		this.study_end_date = study_end_date;
	}

	public int getStudy_current_members() {
		return study_current_members;
	}

	public void setStudy_current_members(int study_current_members) {
		this.study_current_members = study_current_members;
	}

	public int getStudy_max_members() {
		return study_max_members;
	}

	public void setStudy_max_members(int study_max_members) {
		this.study_max_members = study_max_members;
	}

	public double getStudy_location_lng() {
		return study_location_lng;
	}

	public void setStudy_location_lng(double study_location_lng) {
		this.study_location_lng = study_location_lng;
	}

	public double getStudy_location_lat() {
		return study_location_lat;
	}

	public void setStudy_location_lat(double study_location_lat) {
		this.study_location_lat = study_location_lat;
	}

	public String getStudy_addr() {
		return study_addr;
	}

	public void setStudy_addr(String study_addr) {
		this.study_addr = study_addr;
	}

	public String getStudy_upload_img() {
		return study_upload_img;
	}

	public void setStudy_upload_img(String study_upload_img) {
		this.study_upload_img = study_upload_img;
	}

	public int getSc_idx() {
		return sc_idx;
	}

	public void setSc_idx(int sc_idx) {
		this.sc_idx = sc_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	
	
}
