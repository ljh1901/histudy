package com.histudy.user.model;

public interface UserDAO {

	public void userSignUp(UserDTO dto);
	public UserDTO userSignIn(UserDTO dto);
	public int userCheckId(String user_id);
}
