package com.histudy.user.service;

import com.histudy.user.model.UserDTO;
import com.histudy.user.model.UserDAO;

public class UserServiceImple implements UserService {

	private UserDAO dao;

	// applicationContext.xml�뿉�꽌 �벑濡앺븳 userDAO 遺��뭹�쓣 �뿬湲곗꽌 諛쏆뒿�땲�떎.
	public UserServiceImple(UserDAO dao) {
		this.dao = dao;
	}
	public UserDTO userSignin(UserDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}
}
