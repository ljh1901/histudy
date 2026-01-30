package com.histudy.user.service;

import com.histudy.user.model.UserDTO;
import com.histudy.user.model.userDAO;

public class UserServiceImple implements UserService {

    private userDAO dao;

    // applicationContext.xml에서 등록한 userDAO 부품을 여기서 받습니다.
    public UserServiceImple(userDAO dao) {
        this.dao = dao;
    }

    @Override
    public void userSignUp(UserDTO dto) {
        dao.userSignUp(dto);
    }

    @Override
    public UserDTO userSignin(UserDTO dto) {
        return dao.userSignin(dto);
    }
}