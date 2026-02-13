package com.histudy.admin.service;

import java.util.*;

import com.histudy.admin.model.*;

public interface FaqService {
	public List<MenuCategoryDTO> getCategoryList();
	public List<FaqDTO> getFaqList(Integer category_idx);
	public FaqDTO getFaqOne(int faq_idx);
	public int updateFaq(FaqDTO dto);
	public int insertFaq(FaqDTO dto);
	public int deleteFaq(int faq_idx);
}