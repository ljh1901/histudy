package com.histudy.schedule.model;

import java.util.*;

public interface ScheduleDAO {
	    public List<ScheduleDTO> getScheduleList(int user_idx); // 조회
	    public int insertSchedule(ScheduleDTO dto);            // 등록
	    public int updateSchedule(ScheduleDTO dto);            // 수정
	    public int deleteSchedule(int schedule_idx);           // 삭제
	}

