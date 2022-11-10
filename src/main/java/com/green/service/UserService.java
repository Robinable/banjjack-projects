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


    public String loginPasswordCheck(String username) {
        return userDaoImpl.loginPasswordCheck(username);
    }

    public UserVo selectUserInfo(HashMap<String,String> map) {
        return userDaoImpl.selectUserInfo(map);
    }

    public String findId(String useremail) {
        return userDaoImpl.findId(useremail);
    }

    public String findPasswd(HashMap<String,String> map) {
        return userDaoImpl.findPasswd(map);
    }

    public void updatePassword(HashMap<String,String> map) {
         userDaoImpl.updatePassword(map);
    }

    public String selectUsername(String useremail){
        return userDaoImpl.selectUsername(useremail);
    }

    public String selectUseremail(String username){
        return userDaoImpl.selectUseremail(username);
    }

    public String findEmailByUseremail(String useremail) {
        return userDaoImpl.findEmailByUseremail(useremail);
    }

    public String findNowPasswd(String now_userpassword) {
        return userDaoImpl.findNowPasswd(now_userpassword);
    }

    public void updateNewPasswd(HashMap<String,String> map) {
        userDaoImpl.updateNewPasswd(map);
    }
}

