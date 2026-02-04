package com.histudy.lecture.model;
import java.sql.*;
public class LectureReviewDTO {
   private int review_idx;
   private String review_title;
   private String review_content;
   private int review_score;
   private Date review_date;
   private int user_idx;
   private int lecture_idx;
   public int getReview_idx() {
      return review_idx;
   }
   public void setReview_idx(int review_idx) {
      this.review_idx = review_idx;
   }
   public String getReview_title() {
      return review_title;
   }
   public void setReview_title(String review_title) {
      this.review_title = review_title;
   }
   public String getReview_content() {
      return review_content;
   }
   public void setReview_content(String review_content) {
      this.review_content = review_content;
   }
   public int getReview_score() {
      return review_score;
   }
   public void setReview_score(int review_score) {
      this.review_score = review_score;
   }
   public Date getReview_date() {
      return review_date;
   }
   public void setReview_date(Date review_date) {
      this.review_date = review_date;
   }
   public int getUser_idx() {
      return user_idx;
   }
   public void setUser_idx(int user_idx) {
      this.user_idx = user_idx;
   }
   public int getLecture_idx() {
      return lecture_idx;
   }
   public void setLecture_idx(int lecture_idx) {
      this.lecture_idx = lecture_idx;
   }
   public LectureReviewDTO(int review_idx, String review_title, String review_content, int review_score,
         Date review_date, int user_idx, int lecture_idx) {
      super();
      this.review_idx = review_idx;
      this.review_title = review_title;
      this.review_content = review_content;
      this.review_score = review_score;
      this.review_date = review_date;
      this.user_idx = user_idx;
      this.lecture_idx = lecture_idx;
   }
   
   
}
