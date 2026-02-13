package com.histudy.inquiry.model;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;


public class InquiryDAOImple implements InquiryDAO {

    private SqlSessionTemplate sqlSession;

    public InquiryDAOImple(SqlSessionTemplate sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
    public int insertInquiry(InquiryDTO dto) {
        return sqlSession.insert("insertInquiry", dto);
    }

    @Override
    public List<InquiryDTO> selectInquiryList() {
        return sqlSession.selectList("selectInquiryList");
    }

    @Override
    public List<InquiryDTO> selectUserInquiryList(int user_idx) {
        return sqlSession.selectList("selectUserInquiryList", user_idx);
    }

    @Override
    public InquiryDTO selectInquiryDetail(int inquiry_idx) {
        return sqlSession.selectOne("selectInquiryDetail", inquiry_idx);
    }

    @Override
    public int updateInquiryReply(InquiryDTO dto) {
        return sqlSession.update("updateInquiryReply", dto);
    }

    @Override
    public int deleteInquiry(int inquiry_idx) {
        return sqlSession.delete("deleteInquiry", inquiry_idx);
    }

    @Override
    public List<InquiryCategoryDTO> selectCategoryList() {
        return sqlSession.selectList("selectCategoryList");
    }
}