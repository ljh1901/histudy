package com.histudy.admin.model;

import java.util.*;

public interface FaqDAO {
    List<MenuCategoryDTO> getCategoryList();
    List<FaqDTO> getFaqList(Map<String, Object> map);
}
