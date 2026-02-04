package com.histudy.admin.model;

import java.util.*;

import com.histudy.admin.model.StudyCafeDTO;

public interface AdminDAO {
    List<StudyCafeDTO> selectAllCafes();
    List<Map<String, Object>> selectSalesList(Map<String, Object> params);
    void deleteLayoutByCafeIdx(int studycafe_idx);
    void insertLayout(Map<String, Object> item);
    List<Map<String, Object>> getLayoutList(int studycafe_idx);
}