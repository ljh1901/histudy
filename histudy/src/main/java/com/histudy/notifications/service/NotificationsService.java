package com.histudy.notifications.service;

import com.histudy.notifications.model.NotificationsDTO;

public interface NotificationsService {

	public int sendNotice(NotificationsDTO dto); // 스터디 리더가 멤버에게 보내는 알림
}
