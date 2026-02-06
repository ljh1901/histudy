package com.histudy.user.service;

import org.springframework.stereotype.Service;
import org.mybatis.spring.SqlSessionTemplate;
import com.histudy.user.model.UserDAO;
import com.histudy.user.model.UserDAOImple;
import com.histudy.user.model.UserDTO;

@Service
public class UserServiceImple implements UserService {

	private UserDAO dao;

	// 생성자 주입
	public UserServiceImple(UserDAO dao) {
		this.dao = dao;
	}

	@Override
	public int userSignUp(UserDTO dto) {
		dto.setUser_pw(com.histudy.security.PwdModule.securityPwd(dto.getUser_pw()));
		return dao.userSignUp(dto);
	}

	@Override
	public int userSignIn(String user_id, String user_pwd) {
		String pwd = dao.userSignIn(user_id);
		if (pwd != null && pwd.equals(user_pwd)) {
			return 1;
		} else {
			return 2;
		}
	}

	// 나이 계산 로직을 통합
	@Override
	public UserDTO userInfo(String user_id) {
		// 1. DB에서 조인된 유저 정보(기본정보 + 프로필)를 가져옵니다.
		UserDTO dto = dao.userInfo(user_id);
		
		// 2. 나이 계산 로직 실행
		if (dto != null && dto.getUser_birthdate() != null) {
			// 현재 날짜 기준 연도 (2026년)
			int currentYear = java.time.LocalDate.now().getYear(); 
			
			// java.sql.Date를 LocalDate로 변환하여 연도 추출
			int birthYear = dto.getUser_birthdate().toLocalDate().getYear();
			
			// 한국식 나이 계산
			int age = currentYear - birthYear + 1;
			
			
		}
		
		return dto;
	}

	@Override
	public int userCheckId(String user_id) {
		return dao.userCheckId(user_id);
	}

	@Override
	public int userCheckEmail(String user_email) {
		return dao.userCheckEmail(user_email);
	}
	
	@Override
	public int updateProfile(UserDTO dto) {
	    // 1. usertb 테이블 수정 (dao에 만든 새 메서드 호출)
	    int res1 = ((UserDAOImple)dao).updateUserTb(dto); 
	    
	    // 2. mypage 테이블 수정 (기존 dao 메서드 호출)
	    int res2 = dao.updateProfile(dto);
	    
	    // 두 작업의 결과를 종합하여 리턴
	    return (res1 > 0 && res2 > 0) ? 1 : 0;
	}
}