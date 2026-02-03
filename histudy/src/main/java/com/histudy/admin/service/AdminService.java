package com.histudy.admin.service;

import com.histudy.admin.model.StudyCafeDTO;
import java.util.*;

public interface AdminService {
    List<StudyCafeDTO> getCafeList();
    List<Map<String, Object>> getSalesList(Map<String, Object> params);
}