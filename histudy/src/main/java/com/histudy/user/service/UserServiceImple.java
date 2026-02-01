package com.histudy.user.service;

import com.histudy.user.model.UserDTO;
import com.histudy.user.model.UserDAO;

public class UserServiceImple implements UserService {

	private UserDAO dao;

	// applicationContext.xml에서 등록한 userDAO 부품을 여기서 받습니다.
	public UserServiceImple(UserDAO dao) {
		this.dao = dao;
	}

	@Override
	public UserDTO userSignin(UserDTO dto) {
		// TODO Auto-generated method stub
		return userSignin(dto);
	}

}