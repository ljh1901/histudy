package com.histudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.histudy.user.service.UserService;
import com.histudy.user.model.UserDTO;


@Controller
public class UserController {

	@Autowired
	private UserService userService;

	// 회원가입 페이지 보여주기
    @RequestMapping(value="/userSignup.do", method=RequestMethod.GET)
    public String signupView() {
        return "user/userSignup"; // WEB-INF/views/user/userSignup.jsp 파일로 이동
    }

    // 회원가입 버튼 눌렀을 때 처리
    @RequestMapping(value="/userSignup.do", method=RequestMethod.POST)
    public String signup(UserDTO dto) {
        userService.userSignin(dto); // 서비스 실행!
        return "redirect:/userSignin.do"; // 가입 완료 후 로그인 페이지로 이동
    }
}
