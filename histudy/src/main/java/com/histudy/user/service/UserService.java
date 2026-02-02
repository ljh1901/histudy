package com.histudy.user.service;
import com.histudy.user.model.UserDTO;

public interface UserService {
	public void userSignUp(UserDTO dto);
	public UserDTO userSignIn(UserDTO dto);
	public int userCheckId(String user_id);
}