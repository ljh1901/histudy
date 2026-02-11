package com.histudy.admin.model;

import java.util.*;

public interface NoticeDAO {
	public List<NoticeCategoryDTO> getNoticeCategoryList();
	public List<NoticeDTO> getNoticeList(Map<String, Object> map);
	public NoticeDTO getNoticeOne(int notice_idx);
	public int insertNotice(NoticeDTO dto);
	public int updateNotice(NoticeDTO dto);
	public int deleteNotice(int notice_idx);
}
