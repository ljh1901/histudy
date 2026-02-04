package com.histudy.admin.service;

import java.util.*;

import com.histudy.admin.model.*;

public interface FaqService {
    List<MenuCategoryDTO> getCategoryList();
    List<FaqDTO> getFaqList(Integer category_idx);
}