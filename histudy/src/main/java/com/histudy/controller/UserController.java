package com.histudy.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.histudy.user.model.UserDTO;
import com.histudy.user.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // 1. 회원가입 페이지 이동
    @GetMapping("/userSignUp.do")
    public String signupView() {
        return "user/userSignUp";
    }

    // 2. 회원가입 처리 (POST)
    @PostMapping("/userSignUp.do")
    public String signup(UserDTO dto, javax.servlet.http.HttpServletRequest request) {
        // 1. 회원가입 처리
        userService.userSignUp(dto); 
        // 2. request에 메시지 저장 (포워드 방식이므로 데이터가 유지됨)
        request.setAttribute("msg", "회원가입이 완료되었습니다!");
        // 3. redirect가 아닌 "main"으로 포워드 (main.jsp가 실행됨)
        return "main"; 
    }
    // 3. 로그인 페이지 이동
    @GetMapping("/userSignIn.do")
    public String signinView() {
        return "user/userSignIn";
    }

    // 4. 로그인 처리 (POST)
    @PostMapping("/userSignIn.do")
    public String signin(UserDTO dto, HttpSession session) {
        UserDTO user = userService.userSignIn(dto);

        if (user != null) {
            session.setAttribute("loginUser", user);
            return "redirect:/main.do";
        } else {
            // 실패 시 에러 파라미터와 함께 로그인 창으로
            return "redirect:/userSignIn.do?error=y";
        }
    }

    // 5. 메인 페이지 이동
    @GetMapping("/main.do")
    public String mainView() {
        return "main";
    }

    // 6. 아이디 중복 체크 (AJAX 전용)
    @GetMapping("/userCheckId.do")
    @ResponseBody
    public String idCheck(String user_id) {
        int result = userService.userCheckId(user_id);
        return String.valueOf(result); 
    }
}