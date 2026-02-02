package com.histudy.admin.model;

import java.util.*;

public interface AdminDAO {
    List<StudyCafeDTO> selectAllCafes();
    List<Map<String, Object>> selectSalesList(Map<String, Object> params);
}