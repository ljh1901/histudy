package com.histudy.user.service;
import com.histudy.user.model.UserDTO;

public interface UserService {
    public void userSignUp(UserDTO dto);
    public UserDTO userSignin(UserDTO dto);
}