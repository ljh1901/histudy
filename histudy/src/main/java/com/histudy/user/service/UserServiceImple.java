package com.histudy.user.service;

import com.histudy.user.model.UserDTO;
import com.histudy.user.model.UserDAO;

public class UserServiceImple implements UserService {

	private UserDAO dao;

	public UserServiceImple(UserDAO dao) {
		this.dao = dao;
	}

	public int userSignUp(UserDTO dto) {
		dto.setUser_pw(com.histudy.security.PwdModule.securityPwd(dto.getUser_pw()));
		int result = dao.userSignUp(dto);
		return result;
	}

	public int userSignIn(String user_id, String user_pwd) {
		String pwd = dao.userSignIn(user_id);
		if(pwd.equals(user_pwd)) {
			return 1;
		}else {
			return 2;
		}
	}
	public UserDTO userInfo(String user_id) {
		UserDTO udto = dao.userInfo(user_id);
		return udto;
	}
	public int userCheckId(String user_id) {
		return dao.userCheckId(user_id);
	}
}
