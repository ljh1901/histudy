package com.histudy.admin.service;

import com.histudy.admin.model.AdminDAO;
import com.histudy.admin.model.StudyCafeDTO;
import java.util.*;

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
}