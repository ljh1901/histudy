package com.histudy.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

// 1. 새로 만든 PasswordService를 import 해야 합니다.
import com.histudy.user.service.PasswordService; 

@Controller
public class UserPasswordController {

    @Autowired
    private PasswordService passwordService; // 2. userService가 아닌 passwordService로 변경

    @RequestMapping("/updatePassword.do")
    @ResponseBody
    public String updatePassword(
            @RequestParam("user_idx") int userIdx,
            @RequestParam("current_pw") String currentPw,
            @RequestParam("new_pw") String newPw,
            HttpSession session) {

        // 3. 호출 대상도 passwordService로 변경
        String result = passwordService.updatePassword(userIdx, currentPw, newPw);
        
        if ("success".equals(result.trim())) {
            session.invalidate();
        }
        
        return result; 
    }
}