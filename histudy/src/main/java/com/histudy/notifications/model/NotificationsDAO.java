package com.histudy.notifications.model;

public interface NotificationsDAO {

	public int sendNotice(NotificationsDTO dto); // 스터디 리더가 멤버에게 보내는 알림
}
