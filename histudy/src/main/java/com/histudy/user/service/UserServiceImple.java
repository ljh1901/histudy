package com.histudy.user.service;

import com.histudy.user.model.UserDTO;
import com.histudy.user.model.UserDAO;

public class UserServiceImple implements UserService {

	private UserDAO dao;

	public UserServiceImple(UserDAO dao) {
		this.dao = dao;
	}

	public void userSignUp(UserDTO dto) {
		dao.userSignUp(dto);
	}

	public UserDTO userSignIn(UserDTO dto) {
		return dao.userSignIn(dto);
	}

	public int userCheckId(String user_id) {
		return dao.userCheckId(user_id);
	}
}
