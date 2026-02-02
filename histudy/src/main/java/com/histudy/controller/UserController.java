package com.histudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.histudy.user.service.UserService;
import com.histudy.user.model.UserDTO;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value="/userSignUp.do", method=RequestMethod.GET)
    public String signupView() {
        return "user/userSignUp"; 
    }
    
    @RequestMapping(value="/userSignUp.do", method=RequestMethod.POST)
    public String signup(UserDTO dto) {
       userService.userSignUp(dto); 
        return "redirect:/userSignIn.do"; 
    }
    
    @RequestMapping(value="/userSignIn.do", method=RequestMethod.GET)
    public String signinView() {
        return "user/userSignIn";
    }
    
    @RequestMapping(value="/userSignIn.do", method=RequestMethod.POST)
    public String signin(UserDTO dto, javax.servlet.http.HttpSession session) {
        UserDTO user = userService.userSignIn(dto);

        if (user != null) {
            // 2. 로그인 성공: 세션에 사용자 정보 저장
            session.setAttribute("loginUser", user);
            return "redirect:/main.do"; // 로그인 후 이동할 메인 페이지
        } else {
            // 3. 로그인 실패: 다시 로그인 페이지로
            return "redirect:/userSignIn.do?error=y";
        }
    
    }
    
    @RequestMapping(value="/main.do", method=RequestMethod.GET)
    public String mainView() {
        return "main"; 
    }
    
    @RequestMapping(value="/userCheckId.do", method=RequestMethod.GET)
    @ResponseBody
    public String idCheck(String user_id) {
        int result = userService.userCheckId(user_id);
        return String.valueOf(result); // "0" 또는 "1" 반환
    }
    
}
