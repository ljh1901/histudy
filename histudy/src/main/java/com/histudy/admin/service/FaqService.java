package com.histudy.admin.service;

import java.util.*;

import com.histudy.admin.model.*;

public interface FaqService {
    List<MenuCategoryDTO> getCategoryList();
    List<FaqDTO> getFaqList(Integer category_idx);
    FaqDTO getFaqOne(int faq_idx);
    int updateFaq(FaqDTO dto);
    int insertFaq(FaqDTO dto);
    int deleteFaq(int faq_idx);
}