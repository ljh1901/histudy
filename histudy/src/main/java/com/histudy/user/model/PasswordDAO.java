package com.histudy.user.model;

public interface PasswordDAO {
    UserDTO getUserInfo(int userIdx); // 사용자 비번 확인용 
    int updatePassword(int userIdx, String newPw); // 비밀번호 수정용 
}