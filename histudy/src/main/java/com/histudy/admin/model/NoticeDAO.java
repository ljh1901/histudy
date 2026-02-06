package com.histudy.admin.model;

import java.util.*;

public interface NoticeDAO {
	List<NoticeCategoryDTO> getNoticeCategoryList();
	List<NoticeDTO> getNoticeList(Map<String, Object> map);
	NoticeDTO getNoticeOne(int notice_idx);
	int insertNotice(NoticeDTO dto);
	int updateNotice(NoticeDTO dto);
	int deleteNotice(int notice_idx);
}
