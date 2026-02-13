package com.histudy.inquiry.service;

import java.util.List;

import com.histudy.inquiry.model.InquiryCategoryDTO;
import com.histudy.inquiry.model.InquiryDTO;

public interface InquiryService {
    
    // 문의 등록
    int insertInquiry(InquiryDTO dto);
    
    // 전체 목록 조회 (관리자용)
    List<InquiryDTO> getInquiryList();
    
    // 사용자별 목록 조회 (사용자 본인용)
    List<InquiryDTO> getUserInquiryList(int user_idx);
    
    // 상세 내용 보기
    InquiryDTO getInquiryDetail(int inquiry_idx);
    
    // 답변 등록 및 수정
    int updateInquiryReply(InquiryDTO dto);
    
    // 카테고리 목록 가져오기 (작성 폼용)
    List<InquiryCategoryDTO> getCategoryList();
}