package com.histudy.inquiry.model;

import java.util.List;

public interface InquiryDAO {
    
    // 1. 문의사항 등록 (사용자)
    int insertInquiry(InquiryDTO dto);
    
    // 2. 전체 문의 목록 조회 (관리자)
    List<InquiryDTO> selectInquiryList();
    
    // 3. 특정 사용자의 문의 목록 조회 (사용자 본인 확인용)
    List<InquiryDTO> selectUserInquiryList(int user_idx);
    
    // 4. 문의사항 상세 보기
    InquiryDTO selectInquiryDetail(int inquiry_idx);
    
    // 5. 관리자 답변 등록 및 상태 수정
    int updateInquiryReply(InquiryDTO dto);
    
    // 6. 문의사항 삭제 (필요 시)
    int deleteInquiry(int inquiry_idx);
    
    // 7. 카테고리 리스트 조회 (작성 폼 select 박스용)
    List<InquiryCategoryDTO> selectCategoryList();
}