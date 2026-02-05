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

	// 1. 회원가입 View 이동
	@GetMapping("/userSignUp.do")
	public ModelAndView signUpView() {
		ModelAndView mav = new ModelAndView();

		// 1. 연도 리스트 
		java.util.List<Integer> yearList = new java.util.ArrayList<>();
		for (int i = 2026; i >= 1950; i--) {
			yearList.add(i);
		}

		// 2. 월 리스트 생성
		java.util.List<String> monthList = new java.util.ArrayList<>();
		for (int i = 1; i <= 12; i++) {
			monthList.add(String.format("%02d", i));
		}

		// 3. 일 리스트 생성
		java.util.List<String> dayList = new java.util.ArrayList<>();
		for (int i = 1; i <= 31; i++) {
			dayList.add(String.format("%02d", i));
		}

		mav.addObject("yearList", yearList);
		mav.addObject("monthList", monthList);
		mav.addObject("dayList", dayList);
		
		mav.setViewName("user/userSignUp");

		return mav;
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
	public String userSignIn(@RequestBody Map<String, String> params, HttpSession session,
	        HttpServletResponse response) {
	    String user_id = params.get("user_id");
	    String user_pwd = params.get("user_pwd");
	    String remember_id = params.get("remember_id");
	    int result = userService.userSignIn(user_id, com.histudy.security.PwdModule.securityPwd(user_pwd));
	    String msg = "";
	    if (result == 1) {
	        UserDTO loginUser = userService.userInfo(user_id); 

	        session.setAttribute("user_id", user_id);
	        session.setAttribute("user_idx", loginUser.getUser_idx());
	        session.setAttribute("user_name", loginUser.getUser_name()); // 이름 저장 
	        
	        msg = "로그인 성공"; 

	        // 3. 쿠키 처리
	        if (remember_id != null) {
	            Cookie ck = new Cookie("id", user_id);
	            ck.setMaxAge(24 * 60 * 60 * 30);
	            response.addCookie(ck);
	        } else {
	            Cookie ck = new Cookie("id", user_id);
	            ck.setMaxAge(0);
	            response.addCookie(ck);
	        }
	        return msg;
	    } else {
	        msg = "아이디 또는 비밀번호를 잘못입력하셨습니다.";
	        return msg;
	    }
	}

	@GetMapping("/userCheckEmail.do")
	@ResponseBody
	public String emailCheck(String user_email) {
	    // userService에 이메일 중복 체크 로직이 있다고 가정 
	    int result = userService.userCheckEmail(user_email); 
	    return String.valueOf(result); 
	}
	
	@RequestMapping(value = "/userLogout.do", method = RequestMethod.GET)
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