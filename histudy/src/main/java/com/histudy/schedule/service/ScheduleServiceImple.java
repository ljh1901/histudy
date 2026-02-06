package com.histudy.schedule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.histudy.schedule.model.ScheduleDTO;
import com.histudy.schedule.model.ScheduleDAO;

@Service // 스프링 비즈니스 로직 클래스로 인식하게 함
public class ScheduleServiceImple implements ScheduleService {

	private ScheduleDAO scheduleDao;
	
	@Autowired 
    public ScheduleServiceImple(ScheduleDAO scheduleDao) {
        this.scheduleDao = scheduleDao;
    }

	@Override
	public List<ScheduleDTO> getScheduleList(int user_idx) {
		// DB에서 일정 목록을 가져와 반환함
		return scheduleDao.getScheduleList(user_idx);
	}

	@Override
	public int insertSchedule(ScheduleDTO dto) {
		return scheduleDao.insertSchedule(dto);
	}

	@Override
	public int updateSchedule(ScheduleDTO dto) {
		return scheduleDao.updateSchedule(dto);
	}

	@Override
	public int deleteSchedule(int schedule_idx) {
		return scheduleDao.deleteSchedule(schedule_idx);
	}
}