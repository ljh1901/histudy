package com.histudy.mentoring.service;

import java.util.List;

import com.histudy.mentoring.model.*;


public interface MentoringService {
    List<MentorListDTO> mentorList();
    List<MentorListDTO> mentorListCategory(int sc_idx);
    int mentorProfileCreate(MentoProfileDTO dto);
}
