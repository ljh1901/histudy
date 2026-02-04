package com.histudy.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class AdminDAOImple implements AdminDAO {

    private SqlSessionTemplate session;

    public AdminDAOImple(SqlSessionTemplate session) {
        this.session = session;
    }
    @Override
    public List<StudyCafeDTO> selectAllCafes() {
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
}