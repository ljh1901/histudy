package com.histudy.admin.service;

import java.util.List;

import com.histudy.admin.model.NoticeCategoryDTO;
import com.histudy.admin.model.NoticeDTO;

public interface NoticeService {
	public List<NoticeCategoryDTO> getNoticeCategoryList();
	public List<NoticeDTO> getNoticeList(Integer noticeCategory_idx);
	public NoticeDTO getNoticeDetail(int notice_idx);
	public int insertNotice(NoticeDTO dto);
	public int updateNotice(NoticeDTO dto);
	public int deleteNoitce(int notice_idx);
	
}
