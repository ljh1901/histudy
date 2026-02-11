package com.histudy.mentoring.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;  
import com.histudy.mentoring.model.*;

@Service
public class MentoringServiceImple implements MentoringService {

    private MentoringDAO mentoringDAO;

    @Autowired
    public MentoringServiceImple(MentoringDAO mentoringDAO) {
        this.mentoringDAO = mentoringDAO;
    }

    @Override
    public List<MentorListDTO> mentorList() {
        return mentoringDAO.mentorList();
    }

    @Override
    public List<MentorListDTO> mentorListCategory(int sc_idx) {
        return mentoringDAO.mentorListCategory(sc_idx);
    }

    @Override
    public int mentorProfileCreate(MentoProfileDTO dto) {
        return mentoringDAO.mentorProfileCreate(dto);
    }

    @Override
    public int mentorProfileCount(int user_idx) {
        return mentoringDAO.mentorProfileCount(user_idx);
    }

    @Override
    public Integer findMentorIdxAndUserIdx(int user_idx) {
        return mentoringDAO.findMentorIdxAndUserIdx(user_idx);
    }
    
    @Override
    public List<MentorApplicationDTO> selectMentorApplications(int mentor_idx) {
      return mentoringDAO.selectMentorApplications(mentor_idx);
    }

    @Override
    public MentorApplicationDTO selectMentorApplicationDetail(int ma_id) {
      return mentoringDAO.selectMentorApplicationDetail(ma_id);
    }

    @Override
    public int approveMentorApplication(int ma_id) {
      return mentoringDAO.approveMentorApplication(ma_id);
    }

    @Override
    public int rejectMentorApplication(int ma_id, String reject_reason) {
      java.util.Map<String, Object> map = new java.util.HashMap<>();
      map.put("ma_id", ma_id);
      map.put("reject_reason", reject_reason);
      return mentoringDAO.rejectMentorApplication(map);
    }
    
    @Override
    public int deleteMentorApplication(int ma_id) {
    	return mentoringDAO.deleteMentorApplication(ma_id);
    }
    
    @Override
    public MentorSummaryDTO selectMentorSummary(int mentor_idx) {
        MentorSummaryDTO dto = mentoringDAO.selectMentorSummary(mentor_idx);
        if (dto != null) {
            List<String> tags = mentoringDAO.selectMentorTags(mentor_idx);
            dto.setTags(tags);
        }
        return dto;
    }


    @Transactional
    @Override
    public int approveAndMatch(int ma_id) {

        int updated = mentoringDAO.approveMentorApplication(ma_id);
        if(updated <= 0) return 0; 
    
        MentorMatchDTO info = mentoringDAO.selectMatchInfoMaId(ma_id);
        if(info == null) return 1;
  
        int cnt = mentoringDAO.countMentoringMatch(info);
        if(cnt > 0) return 1; 

        mentoringDAO.insertMentoringMatch(info);

        return 1;
    }
    
    @Override
    public int selectLatestMentoringIdxByMentor(int mentor_idx) {
        return mentoringDAO.selectLatestMentoringIdxByMentor(mentor_idx);
    }


    @Override
    public MentoringDTO selectMentoringDetailForApply(int mentoring_idx) {
        return mentoringDAO.selectMentoringDetailForApply(mentoring_idx);
    }

    @Override
    public MentorSummaryDTO selectMentorInfoByMentoringIdx(int mentoring_idx) {
        return mentoringDAO.selectMentorInfoByMentoringIdx(mentoring_idx);
    }

    @Override
    public int applyMentoring(int mentoring_idx, int mentee_user_idx, String apply_content) {
        Map<String, Object> map = new java.util.HashMap<>();
        map.put("mentoring_idx", mentoring_idx);
        map.put("mentee_user_idx", mentee_user_idx);
        map.put("apply_content", apply_content);
        return mentoringDAO.insertMentoringApplication(map);
    }

    @Override
    public MentoringDetailDTO selectMentoringDetailByMentor(int mentor_idx) {
      return mentoringDAO.selectMentoringDetailByMentor(mentor_idx);
    }

    @Override
    public List<MentoringReviewDTO> selectMentoringReviews(int mentor_idx) {
      return mentoringDAO.selectMentoringReviews(mentor_idx);
    }

    @Override
    public Integer getWritableMatchId(int mentor_idx, int mentee_user_idx) {
      Map<String, Object> map = new HashMap<>();
      map.put("mentor_idx", mentor_idx);
      map.put("mentee_user_idx", mentee_user_idx);
      return mentoringDAO.selectWritableMatchId(map);
    }

    @Override
    public int writeReview(MentoringReviewDTO dto) {
      return mentoringDAO.insertMentoringReview(dto);
    }

    
    
    
    
    
    
    
    
    
  /*  @Override
    @Transactional
    public void createMentoring(MentoringDTO dto, String scheduleJson, String skillTags) {
    	
    	

        mentoringDAO.insertMentoring(dto);
        int mentoring_idx = dto.getMentoring_idx();

        ObjectMapper om = new ObjectMapper();
        List<Map<String, String>> slots;

        try {
            slots = om.readValue(scheduleJson, new TypeReference<List<Map<String, String>>>() {});
        } catch (Exception e) {
            throw new IllegalArgumentException("스케줄 JSON 파싱 실패: " + scheduleJson);
        }

        if (slots == null || slots.isEmpty()) {
            throw new IllegalArgumentException("스케줄을 1개 이상 선택해 주세요.");
        }

        for (Map<String, String> m : slots) {
            String day = m.get("day");
            String time = m.get("time");

            Date start = makeDate(day, time);
            if (start == null) {
                throw new IllegalArgumentException("스케줄 형식이 올바르지 않습니다: " + day + " " + time);
            }
            Date end = add1Hour(start);

            MentoringScheduleDTO sdto = new MentoringScheduleDTO();
            sdto.setMentoring_idx(mentoring_idx);
            sdto.setStatus("승인");
            sdto.setMentoring_start_time(start);
            sdto.setMentoring_end_time(end);

            mentoringDAO.insertMentoringSchedule(sdto);
        }
    }

    // ✅ makeDate / add1Hour 다시 포함
    private Date makeDate(String day, String time) {
        if (day == null || time == null) return null;

        String base = "";
        if (day.equals("MON")) base = "2000-01-03 ";
        else if (day.equals("TUE")) base = "2000-01-04 ";
        else if (day.equals("WED")) base = "2000-01-05 ";
        else if (day.equals("THU")) base = "2000-01-06 ";
        else if (day.equals("FRI")) base = "2000-01-07 ";
        else if (day.equals("SAT")) base = "2000-01-08 ";
        else if (day.equals("SUN")) base = "2000-01-09 ";
        else return null;

        try {
            return new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").parse(base + time);
        } catch (Exception e) {
            return null;
        }
    }

    private Date add1Hour(Date d) {
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        c.add(Calendar.HOUR, 1);
        return c.getTime();
    }  */
}
