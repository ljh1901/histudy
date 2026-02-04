package com.histudy.user.service;
import com.histudy.user.model.UserDTO;

public interface UserService {
    public int userSignIn(String user_id, String user_pwd);
    public int userSignUp(UserDTO dto);
	public int userCheckId(String user_id);
	public UserDTO userInfo(String user_id);
}