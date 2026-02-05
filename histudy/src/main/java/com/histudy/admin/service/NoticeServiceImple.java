package com.histudy.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.histudy.admin.model.NoticeCategoryDTO;
import com.histudy.admin.model.NoticeDAO;
import com.histudy.admin.model.NoticeDTO;

@Service
public class NoticeServiceImple implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	public NoticeServiceImple(NoticeDAO noticeDAO) {
		super();
		this.noticeDAO = noticeDAO;
	}

	@Override
	public List<NoticeCategoryDTO> getNoticeCategoryList() {		
		return noticeDAO.getNoticeCategoryList();
	}

	@Override
	public List<NoticeDTO> getNoticeList(Integer noticeCategory_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("notice_category_idx", noticeCategory_idx); 
		return noticeDAO.getNoticeList(map);

	}
	@Override
	public NoticeDTO getNoticeDetail(int notice_idx) {
	    return noticeDAO.getNoticeOne(notice_idx);
	}
	
	@Override
	public int updateNotice(NoticeDTO dto) {
		return noticeDAO.updateNotice(dto);
	}
	
	@Override
	public int deleteNoitce(int notice_idx) {
		return noticeDAO.deleteNotice(notice_idx);
	}

	@Override
	public int insertNotice(NoticeDTO dto) {
	    return noticeDAO.insertNotice(dto);
	}
}
