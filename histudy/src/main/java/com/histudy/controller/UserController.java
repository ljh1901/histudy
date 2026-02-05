package com.histudy.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;

import com.histudy.user.model.UserDTO;
import com.histudy.user.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    
    // 1. 회원가입 View
    @GetMapping("/userSignUp.do")
    public String signUpView() {
        return "user/userSignUp";
    }
    
    // 2. 회원가입 완료
    @PostMapping("/userSignUp.do")
    public String signup(UserDTO dto, HttpServletRequest request) {
        userService.userSignUp(dto); 
        request.setAttribute("msg", "회원가입 완료");
        return "redirect:/index.do"; 
    }
    
    // 3. 로그인 View
    @GetMapping("/userSignIn.do")
    public String userSignInView() {
        return "user/userSignIn";
    }

    @PostMapping("/userSignIn.do")
    @ResponseBody
    public String userSignIn(@RequestBody Map<String, String> params, 
    	HttpSession session, HttpServletResponse response) {
    	String user_id=params.get("user_id");
    	String user_pwd = params.get("user_pwd");
    	String remember_id = params.get("remember_id");
       int result = userService.userSignIn(user_id, com.histudy.security.PwdModule.securityPwd(user_pwd));
       String msg = "";
        if(result == 1) {
        	msg = "로그인 성공";
        	session.setAttribute("user_id", user_id);
        	session.setAttribute("user_idx", userService.userInfo(user_id).getUser_idx());
        	if(remember_id !=null) {
        		Cookie ck = new Cookie("id", user_id);
        		ck.setMaxAge(24*60*60*30);
        		response.addCookie(ck);
        	}
        	else {
        		Cookie ck = new Cookie("id", user_id);
        		ck.setMaxAge(0);
        		response.addCookie(ck);
        	}
        	return msg;
        }
        else {
        	msg = "아이디 또는 비밀번호를 잘못입력하셨습니다.";
        	return msg;
        }
    }

    @RequestMapping(value="/userLogout.do", method=RequestMethod.GET)
    public String logout(HttpSession session) {            
        session.invalidate();
        return "redirect:/index.do";
    }
    
    @GetMapping("/userCheckId.do")
    @ResponseBody
    public String idCheck(String user_id) {
        int result = userService.userCheckId(user_id);
        return String.valueOf(result); 
    }
}