package com.histudy.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;

import com.histudy.user.model.UserDTO;
import com.histudy.user.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/userSignUp.do")
    public String signupView() {
        return "user/userSignUp";
    }

    @PostMapping("/userSignUp.do")
    public String signup(UserDTO dto, javax.servlet.http.HttpServletRequest request) {
    	String sec_pw=com.histudy.security.PwdModule.securityPwd(dto.getUser_pw());
    	dto.setUser_pw(sec_pw);
        userService.userSignUp(dto); 
        request.setAttribute("msg", "Hi, Study의 회원이 되셨어요!");
        return "main"; 
    }

    @GetMapping("/userSignIn.do")
    public String signinView() {
        return "user/userSignIn";
    }

    @PostMapping("/userSignIn.do")
    @ResponseBody
    public String signin(UserDTO dto, String rememberId, HttpSession session, javax.servlet.http.HttpServletResponse response) {
    	
    	String s_pwd = com.histudy.security.PwdModule.securityPwd(dto.getUser_pw());
    	dto.setUser_pw(s_pwd);
    	
        UserDTO user = userService.userSignIn(dto);
        
        System.out.println(user.getUser_idx());

        if (user != null) {
            session.setAttribute("loginUser", user);
            session.setAttribute("user_idx", user.getUser_idx());

            javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie("savedUserId", user.getUser_id());
            if ("on".equals(rememberId)) {
                cookie.setMaxAge(60 * 60 * 24 * 7); 
            } else {
                cookie.setMaxAge(0); 
            }
            cookie.setPath("/"); 
            response.addCookie(cookie); 

            return "success";
        } else {
            return "fail";
        }
    }

    @GetMapping("/main.do")
    public String mainView() {
        return "main";
    }

    @RequestMapping(value = "/userLogout.do", method = RequestMethod.GET)
    public String logout(javax.servlet.http.HttpSession session) {
        session.invalidate();
        return "redirect:/main.do";
    }
    
  
    @GetMapping("/userCheckId.do")
    @ResponseBody
    public String idCheck(String user_id) {
        int result = userService.userCheckId(user_id);
        return String.valueOf(result); 
    }
}