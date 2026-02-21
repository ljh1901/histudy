package com.histudy.notifications.service;

import com.histudy.notifications.model.NotificationsDAOImple;
import com.histudy.notifications.model.NotificationsDTO;

public class NotificationsServiceImple implements NotificationsService {

	
	private NotificationsDAOImple ndao;
	
	public NotificationsServiceImple(NotificationsDAOImple ndao) {
		super();
		this.ndao = ndao;
	}

	@Override
	public int sendNotice(NotificationsDTO dto) {
		int result = ndao.sendNotice(dto);
		return result;
	}
}
