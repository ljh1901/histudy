package com.histudy.lecture.model;
import java.sql.*;
public class LectureDTO {
	private int lecture_idx;
	private String lecture_name;
	private String lecture_lecturer;
	private String lecture_content;
	private int lecture_like,lecture_hate;
	private Date lecture_date;
	private String lecture_file;
	private int category_idx;
	public LectureDTO() {
		// TODO Auto-generated constructor stub
	}
	public LectureDTO(int lecture_idx, String lecture_name, String lecture_lecturer, String lecture_content,
			int lecture_like, int lecture_hate, Date lecture_date, String lecture_file, int category_idx) {
		super();
		this.lecture_idx = lecture_idx;
		this.lecture_name = lecture_name;
		this.lecture_lecturer = lecture_lecturer;
		this.lecture_content = lecture_content;
		this.lecture_like = lecture_like;
		this.lecture_hate = lecture_hate;
		this.lecture_date = lecture_date;
		this.lecture_file = lecture_file;
		this.category_idx = category_idx;
	}
	public int getLecture_idx() {
		return lecture_idx;
	}
	public void setLecture_idx(int lecture_idx) {
		this.lecture_idx = lecture_idx;
	}
	public String getLecture_name() {
		return lecture_name;
	}
	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}
	public String getLecture_lecturer() {
		return lecture_lecturer;
	}
	public void setLecture_lecturer(String lecture_lecturer) {
		this.lecture_lecturer = lecture_lecturer;
	}
	public String getLecture_content() {
		return lecture_content;
	}
	public void setLecture_content(String lecture_content) {
		this.lecture_content = lecture_content;
	}
	public int getLecture_like() {
		return lecture_like;
	}
	public void setLecture_like(int lecture_like) {
		this.lecture_like = lecture_like;
	}
	public int getLecture_hate() {
		return lecture_hate;
	}
	public void setLecture_hate(int lecture_hate) {
		this.lecture_hate = lecture_hate;
	}
	public Date getLecture_date() {
		return lecture_date;
	}
	public void setLecture_date(Date lecture_date) {
		this.lecture_date = lecture_date;
	}
	public String getLecture_file() {
		return lecture_file;
	}
	public void setLecture_file(String lecture_file) {
		this.lecture_file = lecture_file;
	}
	public int getCategory_idx() {
		return category_idx;
	}
	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}
	
}
