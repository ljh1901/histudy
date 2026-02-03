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
}
