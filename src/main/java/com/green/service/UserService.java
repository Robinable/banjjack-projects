package com.green.service;

import com.green.dao.impl.UserDaoImpl;
import com.green.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDaoImpl userDaoImpl;


    public List<UserVo> selectAll(){
        return userDaoImpl.selectAll();
    }

    public int insertUser(UserVo userVo){
        return userDaoImpl.insertUser(userVo);
    }

    public int usernameCheck(String username) {
        return userDaoImpl.usernameCheck(username);
    }

    public int nicknameCheck(String usernickname) {
        return userDaoImpl.nicknameCheck(usernickname);
    }

    public void insertInfo(UserVo userVo) {
         userDaoImpl.insertInfo(userVo);
    }

    public UserVo successLogin(UserVo userVo) {
        return userDaoImpl.successLogin(userVo);
    }

    public UserVo loginCk(String username, String userpassword) {
        return userDaoImpl.loginCk(username, userpassword);
    }

//    public UserVo loginCk(HashMap<String, String> map) {
//        return  userDaoImpl.loginCk(map);
//    }
}

