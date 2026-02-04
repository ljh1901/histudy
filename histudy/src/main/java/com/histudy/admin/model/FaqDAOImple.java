package com.histudy.admin.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class FaqDAOImple implements FaqDAO {
    @Autowired
    private SqlSession session;

    public FaqDAOImple(SqlSession session) {
		this.session = session;
	}

	@Override
    public List<MenuCategoryDTO> getCategoryList() {
        return session.selectList("com.histudy.admin.getFaqCategoryList");
    }

    @Override
    public List<FaqDTO> getFaqList(Map<String, Object> map) {
        return session.selectList("com.histudy.admin.getFaqList", map);
    }
}