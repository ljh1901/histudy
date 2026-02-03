package com.histudy.mentoring.model;

import java.util.List;

public interface MentoringDAO {
    List<MentorListDTO> mentorList();
    List<MentorListDTO> mentorListCategory(int sc_idx);
    int mentorProfileCreate(MentoProfileDTO dto);
}
