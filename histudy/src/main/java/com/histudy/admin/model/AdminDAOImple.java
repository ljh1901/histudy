package com.histudy.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class AdminDAOImple implements AdminDAO {

    private final SqlSessionTemplate sqlSession;

    public AdminDAOImple(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }
    @Override
    public List<StudyCafeDTO> selectAllCafes() {
        return sqlSession.selectList("com.histudy.admin.selectAllCafes");
    }
    @Override
    public List<Map<String, Object>> selectSalesList(Map<String, Object> params) {     
        return sqlSession.selectList("com.histudy.admin.selectSalesList", params);
    }
}
