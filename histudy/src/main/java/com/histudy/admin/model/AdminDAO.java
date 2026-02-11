package com.histudy.admin.model;

import java.util.*;

import com.histudy.studycafe.model.StudycafeDTO;
import com.histudy.studycafe.model.TicketJoinTicketCategoryDTO;

public interface AdminDAO {
	public List<StudycafeDTO> selectAllCafes();
	public List<Map<String, Object>> selectSalesList(Map<String, Object> params);
	public void deleteLayoutByCafeIdx(int studycafe_idx);
	public  void insertLayout(Map<String, Object> item);
	public List<Map<String, Object>> getLayoutList(int studycafe_idx);
    
	public List<TicketCategoryDTO> getTicketCategoryList();
	public List<TicketJoinTicketCategoryDTO> getTicketList(int studycafe_idx);
	public int insertTicket(Map<String, Object> data);
	public int deleteTicket(int ticket_idx);
}