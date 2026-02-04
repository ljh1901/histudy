package com.histudy.admin.model;

public class StudyCafeDTO {
    private int studycafe_idx;
    private String studycafe_name;
    
	public StudyCafeDTO(int studycafe_idx, String studycafe_name) {
		super();
		this.studycafe_idx = studycafe_idx;
		this.studycafe_name = studycafe_name;
	}

	public int getStudycafe_idx() {
		return studycafe_idx;
	}

	public void setStudycafe_idx(int studycafe_idx) {
		this.studycafe_idx = studycafe_idx;
	}

	public String getStudycafe_name() {
		return studycafe_name;
	}

	public void setStudycafe_name(String studycafe_name) {
		this.studycafe_name = studycafe_name;
	}


}