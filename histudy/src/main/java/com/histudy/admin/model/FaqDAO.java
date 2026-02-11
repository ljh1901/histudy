package com.histudy.admin.model;

import java.util.*;

public interface FaqDAO {
	public List<MenuCategoryDTO> getCategoryList();
	public List<FaqDTO> getFaqList(Map<String, Object> map);
	public FaqDTO getFaqOne(int faq_idx);
	public int updateFaq(FaqDTO dto);
	public int insertFaq(FaqDTO dto);
	public int deleteFaq(int faq_idx);
}