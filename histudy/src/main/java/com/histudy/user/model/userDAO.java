package com.histudy.user.model;

public interface userDAO {

	public void userSignUp(UserDTO dto);

	public UserDTO userSignin(UserDTO dto);

	public String userIdFind(UserDTO dto);

	public String userPwdFind(UserDTO dto);



}
