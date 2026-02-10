package com.histudy.mentoring.service;

import java.util.List;

import com.histudy.mentoring.model.*;


public interface MentoringService {
    List<MentorListDTO> mentorList();
    List<MentorListDTO> mentorListCategory(int sc_idx);
    int mentorProfileCreate(MentoProfileDTO dto);
    int mentorProfileCount(int user_idx);
    
    Integer findMentorIdxAndUserIdx(int user_idx);

    void createMentoring(MentoringDTO dto, String scheduleJson, String skillTags);
    
    List<MentorApplicationDTO> selectMentorApplications(int mentor_idx);
    MentorApplicationDTO selectMentorApplicationDetail(int ma_id);

    int approveMentorApplication(int ma_id);
    int rejectMentorApplication(int ma_id, String reject_reason);
    int deleteMentorApplication(int ma_id);

    MentorSummaryDTO selectMentorSummary(int mentor_idx);
    
    int approveAndMatch(int ma_id);

    int selectLatestMentoringIdxByMentor(int mentor_idx);

}
