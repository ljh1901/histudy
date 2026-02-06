package com.histudy.admin.service;

import com.histudy.admin.model.TicketCategoryDTO;
import com.histudy.studycafe.model.StudycafeDTO;
import com.histudy.studycafe.model.TicketJoinTicketCategoryDTO;

import java.util.*;

public interface AdminService {
    List<StudycafeDTO> getCafeList();
    List<Map<String, Object>> getSalesList(Map<String, Object> params);
    
    List<TicketCategoryDTO> getTicketCategoryList();
    List<TicketJoinTicketCategoryDTO> getTicketList(int studycafe_idx);
    int registerTicket(Map<String, Object> data);
    int removeTicket(int ticket_idx);
    
    void updateCafeLayout(int studycafe_idx, List<Map<String, Object>> layoutList);
    List<Map<String, Object>> getLayoutList(int studycafe_idx);
}