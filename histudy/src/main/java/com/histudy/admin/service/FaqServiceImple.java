package com.histudy.admin.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.histudy.admin.model.*;

@Service
public class FaqServiceImple implements FaqService {
	@Autowired
	private FaqDAO faqDAO;

	public FaqServiceImple(FaqDAO faqDAO) {
		super();
		this.faqDAO = faqDAO;
	}

	@Override
	public List<MenuCategoryDTO> getCategoryList() {
		return faqDAO.getCategoryList();
	}

	@Override
	public List<FaqDTO> getFaqList(Integer menuCategoryIdx) {
		Map<String, Object> map = new HashMap<>();
		map.put("menu_category_idx", menuCategoryIdx); 
		return faqDAO.getFaqList(map);
	}
	@Override
	public FaqDTO getFaqOne(int faq_idx) {
		return faqDAO.getFaqOne(faq_idx);
	}
	@Override
	public int updateFaq(FaqDTO dto) {
		return faqDAO.updateFaq(dto);
	}
}