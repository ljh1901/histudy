package com.histudy.user.model;

public interface UserDAO {

	public int userSignUp(UserDTO dto);
	public String userSignIn(String user_id);
	public int userCheckId(String user_id);
	public UserDTO userInfo(String user_id);
}
