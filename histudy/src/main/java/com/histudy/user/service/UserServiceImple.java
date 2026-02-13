package com.histudy.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.dao.DuplicateKeyException;
import com.histudy.membership.model.MembershipDAO;
import com.histudy.user.model.UserDAO;
import com.histudy.user.model.UserDAOImple;
import com.histudy.user.model.UserDTO;

@Service
public class UserServiceImple implements UserService {

	private UserDAO dao;
	@Autowired
	private MembershipDAO mdao;

	// 생성자 주입
	public UserServiceImple(UserDAO dao) {
		this.dao = dao;
		this.mdao = mdao;
	}

	@Override
	public int userSignUp(UserDTO dto) {
		dto.setUser_pw(com.histudy.security.PwdModule.securityPwd(dto.getUser_pw()));
		mdao.insertBasic(dto.getUser_idx());
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
		try {
			((UserDAOImple) dao).updateUserTb(dto);
			dao.updateProfile(dto);
			return 1;

		} catch (org.springframework.dao.DuplicateKeyException e) {
			// 중복 시 -2를 던져도 컨트롤러가 "fail"로 바꾸므로,
			// 일단 -2를 유지하고 JS에서 "fail" 처리 시 메시지를 보강합니다.
			return -2;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public String userFindId(String user_name, String user_tel) {
		UserDTO dto = new UserDTO();
		dto.setUser_name(user_name);
		dto.setUser_tel(user_tel);
		return dao.userFindId(dto);
	}

	@Override
	public String userFindPw(String user_id, String user_name, String user_tel) {
		UserDTO dto = new UserDTO();
		dto.setUser_id(user_id);
		dto.setUser_name(user_name);
		dto.setUser_tel(user_tel);

		int count = dao.userCheckPw(dto);
		if (count > 0) {
			String tempPw = java.util.UUID.randomUUID().toString().substring(0, 7);

			String hashPw = com.histudy.security.PwdModule.securityPwd(tempPw);
			dto.setUser_pw(hashPw);
			dao.userUpdatePw(dto);
			return tempPw;
		}

		return null;
	}
}