package com.histudy.schedule.service;
import com.histudy.schedule.model.ScheduleDTO;
import java.util.*;

public interface ScheduleService {
	    List<ScheduleDTO> getScheduleList(int user_idx); // 조회
	    int insertSchedule(ScheduleDTO dto);            // 등록
	    int updateSchedule(ScheduleDTO dto);            // 수정
	    int deleteSchedule(int schedule_idx);           // 삭제
		
	}

