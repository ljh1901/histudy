package com.histudy.admin.model;

import java.util.*;

import com.histudy.studycafe.model.StudycafeDTO;
import com.histudy.studycafe.model.TicketJoinTicketCategoryDTO;

public interface AdminDAO {
	List<StudycafeDTO> selectAllCafes();
    List<Map<String, Object>> selectSalesList(Map<String, Object> params);
    void deleteLayoutByCafeIdx(int studycafe_idx);
    void insertLayout(Map<String, Object> item);
    List<Map<String, Object>> getLayoutList(int studycafe_idx);
    
    List<TicketCategoryDTO> getTicketCategoryList();
    List<TicketJoinTicketCategoryDTO> getTicketList(int studycafe_idx);
    int insertTicket(Map<String, Object> data);
    int deleteTicket(int ticket_idx);
}