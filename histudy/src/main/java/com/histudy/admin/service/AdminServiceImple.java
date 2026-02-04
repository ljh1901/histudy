package com.histudy.admin.service;

import com.histudy.admin.model.AdminDAO;
import com.histudy.admin.model.StudyCafeDTO;
import java.util.*;

import org.springframework.transaction.annotation.Transactional;

public class AdminServiceImple implements AdminService {

    private final AdminDAO adminDAO;

    public AdminServiceImple(AdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    @Override
    public List<StudyCafeDTO> getCafeList() {
        return adminDAO.selectAllCafes();
    }
    @Override
    public List<Map<String, Object>> getSalesList(Map<String, Object> params) {
        return adminDAO.selectSalesList(params);
    }
    
    @Override
    @Transactional
    public void updateCafeLayout(int studycafe_idx, List<Map<String, Object>> layoutList) {
        adminDAO.deleteLayoutByCafeIdx(studycafe_idx);
        
        if (layoutList != null && !layoutList.isEmpty()) {
            for (Map<String, Object> item : layoutList) {
                item.put("studycafe_idx", studycafe_idx);
                adminDAO.insertLayout(item);
            }
        }
    }
    @Override
    public List<Map<String, Object>> getLayoutList(int studycafe_idx) {
        return adminDAO.getLayoutList(studycafe_idx);
    }
    
}