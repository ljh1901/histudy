package com.histudy.inquiry.service;

import java.util.List;

import com.histudy.inquiry.model.InquiryCategoryDTO;
import com.histudy.inquiry.model.InquiryDAO;
import com.histudy.inquiry.model.InquiryDTO;

public class InquiryServiceImple implements InquiryService {

    private InquiryDAO inquiryDao;

    public InquiryServiceImple(InquiryDAO inquiryDao) {
		super();
		this.inquiryDao = inquiryDao;
	}

	@Override
    public int insertInquiry(InquiryDTO dto) {
        return inquiryDao.insertInquiry(dto);
    }

    @Override
    public List<InquiryDTO> getInquiryList() {
        return inquiryDao.selectInquiryList();
    }

    @Override
    public List<InquiryDTO> getUserInquiryList(int user_idx) {
        return inquiryDao.selectUserInquiryList(user_idx);
    }

    @Override
    public InquiryDTO getInquiryDetail(int inquiry_idx) {
        return inquiryDao.selectInquiryDetail(inquiry_idx);
    }

    @Override
    public int updateInquiryReply(InquiryDTO dto) {
        return inquiryDao.updateInquiryReply(dto);
    }

    @Override
    public List<InquiryCategoryDTO> getCategoryList() {
        return inquiryDao.selectCategoryList();
    }
}