package com.histudy.user.service;

import com.histudy.user.model.UserDTO;
import com.histudy.user.model.UserDAO;

public class UserServiceImple implements UserService {

	private UserDAO dao;

	// applicationContext.xml에서 등록한 userDAO 부품을 여기서 받습니다.
	public UserServiceImple(UserDAO dao) {
		this.dao = dao;
	}
<<<<<<< HEAD
=======

>>>>>>> e0adc62aa466fc8efe0eb314b0bc51e46002ad31
	public UserDTO userSignin(UserDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}
<<<<<<< HEAD
}
=======

}
>>>>>>> e0adc62aa466fc8efe0eb314b0bc51e46002ad31
