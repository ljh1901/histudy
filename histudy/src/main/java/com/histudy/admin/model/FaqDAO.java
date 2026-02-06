package com.histudy.admin.model;

import java.util.*;

public interface FaqDAO {
    List<MenuCategoryDTO> getCategoryList();
    List<FaqDTO> getFaqList(Map<String, Object> map);
    FaqDTO getFaqOne(int faq_idx);
    int updateFaq(FaqDTO dto);
    int insertFaq(FaqDTO dto);
    int deleteFaq(int faq_idx);
}