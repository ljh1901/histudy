package com.histudy.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.histudy.user.model.PasswordDAO;
import com.histudy.user.model.UserDTO;

@Service
public class PasswordServiceImple implements PasswordService {
    
	
	
    @Autowired
    private PasswordDAO passwordDAO;

    public PasswordServiceImple(PasswordDAO passwordDAO) {
        this.passwordDAO = passwordDAO;
    }
    
    @Override
    public String updatePassword(int userIdx, String currentPw, String newPw) {
        // 1. DB에서 해당 유저의 정보(암호화된 비번 포함)를 가져옴
        UserDTO user = passwordDAO.getUserInfo(userIdx); 
        
        // 2. 사용자가 입력한 현재 비밀번호를 암호화함 (DB 값과 비교하기 위함)
        String encryptedCurrentPw = com.histudy.security.PwdModule.securityPwd(currentPw);
        
        // 3. 암호화된 두 값을 비교
        if (user == null || !user.getUser_pw().equals(encryptedCurrentPw)) {
            return "wrong_pw";
        }
        
        System.out.println("입력된 비번: " + currentPw);
    	System.out.println("DB에서 가져온 비번: " + user.getUser_pw());
        // 4. 일치한다면 새 비밀번호도 암호화하여 저장하는 것이 보안상 좋습니다.
        String encryptedNewPw = com.histudy.security.PwdModule.securityPwd(newPw);
        int res = passwordDAO.updatePassword(userIdx, encryptedNewPw); 
        
        return (res > 0) ? "success" : "fail";
    }
    
}