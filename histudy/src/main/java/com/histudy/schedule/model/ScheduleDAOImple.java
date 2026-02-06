package com.histudy.schedule.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.*;


public class ScheduleDAOImple implements ScheduleDAO {

	private SqlSessionTemplate sqlSession;
	
	public ScheduleDAOImple(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	private static final String NAMESPACE = "com.histudy.mapper.schedule";

	@Override
	public List<ScheduleDTO> getScheduleList(int user_idx) {
		// user_idx를 파라미터로 전달하여 특정 사용자의 일정 목록을 가져옵니다.
		return sqlSession.selectList(NAMESPACE + ".getScheduleList", user_idx);
	}

	@Override
	public int insertSchedule(ScheduleDTO dto) {
		// 새로운 일정을 등록합니다.
		return sqlSession.insert(NAMESPACE + ".insertSchedule", dto);
	}

	@Override
	public int updateSchedule(ScheduleDTO dto) {
		// 기존 일정을 수정합니다.
		return sqlSession.update(NAMESPACE + ".updateSchedule", dto);
	}

	@Override
	public int deleteSchedule(int schedule_idx) {
		// 일정 번호(PK)를 기준으로 삭제합니다.
		return sqlSession.delete(NAMESPACE + ".deleteSchedule", schedule_idx);
	}
}