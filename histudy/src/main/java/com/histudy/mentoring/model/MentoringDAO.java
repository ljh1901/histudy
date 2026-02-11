package com.histudy.mentoring.model;

import java.util.List;
import java.util.Map;

public interface MentoringDAO {
    List<MentorListDTO> mentorList();
    List<MentorListDTO> mentorListCategory(int sc_idx);
    int mentorProfileCreate(MentoProfileDTO dto);
    
    int mentorProfileCount(int user_idx);
    
    Integer findMentorIdxAndUserIdx(int user_idx);

    int insertMentoring(MentoringDTO dto);

    int insertMentoringSchedule(MentoringScheduleDTO dto);
    
    List<MentorApplicationDTO> selectMentorApplications(int mentor_idx);
    MentorApplicationDTO selectMentorApplicationDetail(int ma_id);

    int approveMentorApplication(int ma_id);
    int rejectMentorApplication(Map<String, Object> map);
    int deleteMentorApplication(int ma_id);

    MentorSummaryDTO selectMentorSummary(int mentor_idx);
    List<String> selectMentorTags(int mentor_idx);

    MentorMatchDTO selectMatchInfoMaId(int ma_id);
    int insertMentoringMatch(MentorMatchDTO dto);
    int countMentoringMatch(MentorMatchDTO dto);

    int selectLatestMentoringIdxByMentor(int mentor_idx);

    MentoringDTO selectMentoringDetailForApply(int mentoring_idx);
    MentorSummaryDTO selectMentorInfoByMentoringIdx(int mentoring_idx);
    int insertMentoringApplication(java.util.Map<String, Object> map);

    MentoringDetailDTO selectMentoringDetailByMentor(int mentor_idx);
    List<MentoringReviewDTO> selectMentoringReviews(int mentor_idx);
    Integer selectWritableMatchId(Map<String, Object> map);
    int insertMentoringReview(MentoringReviewDTO dto);

    
}
