package com.histudy.notifications.model;

import org.mybatis.spring.SqlSessionTemplate;

public class NotificationsDAOImple implements NotificationsDAO {


	private SqlSessionTemplate sqlSession;
	
	public NotificationsDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int sendNotice(NotificationsDTO dto) {
		
		int count = sqlSession.insert("sendNotice", dto);
		return count;
	}
}
