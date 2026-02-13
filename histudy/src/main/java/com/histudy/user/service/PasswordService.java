package com.histudy.user.service;

public interface PasswordService {
    // 성공 시 "success", 비밀번호 불일치 시 "wrong_pw", 실패 시 "fail" 반환 
    String updatePassword(int userIdx, String currentPw, String newPw);
}