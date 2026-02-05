package com.histudy.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.histudy.studycafe.model.StudycafeDTO;
import com.histudy.studycafe.model.TicketJoinTicketCategoryDTO;

import java.util.*;

@Repository
public class AdminDAOImple implements AdminDAO {

    private SqlSessionTemplate session;

    public AdminDAOImple(SqlSessionTemplate session) {
        this.session = session;
    }
    @Override
    public List<StudycafeDTO> selectAllCafes() {
        return session.selectList("com.histudy.admin.selectAllCafes");
    }
    @Override
    public List<Map<String, Object>> selectSalesList(Map<String, Object> params) {     
        return session.selectList("com.histudy.admin.selectSalesList", params);
    }
    
    @Override
    public void deleteLayoutByCafeIdx(int studycafe_idx) {
        session.delete("com.histudy.admin.deleteLayoutByCafeIdx", studycafe_idx);
    }

    @Override
    public void insertLayout(Map<String, Object> item) {
        session.insert("com.histudy.admin.insertLayout", item);
    }

    @Override
    public List<Map<String, Object>> getLayoutList(int studycafe_idx) {
        return session.selectList("com.histudy.admin.selectLayoutList", studycafe_idx);
    }
    
    @Override
    public List<TicketCategoryDTO> getTicketCategoryList() {
        return session.selectList("com.histudy.admin.getTicketCategoryList");
    }
    
    @Override
    public List<TicketJoinTicketCategoryDTO> getTicketList(int studycafe_idx) {
        return session.selectList("com.histudy.admin.getTicketList", studycafe_idx);
    }

    @Override
    public int insertTicket(Map<String, Object> data) {
        session.insert("com.histudy.admin.insertTicket", data);
        return Integer.parseInt(data.get("newIdx").toString());
    }

    @Override
    public int deleteTicket(int ticket_idx) {
        return session.delete("com.histudy.admin.deleteTicket", ticket_idx);
    }
}