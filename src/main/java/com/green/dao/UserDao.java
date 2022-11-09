package com.green.dao;

import com.green.vo.UserVo;

import java.util.HashMap;
import java.util.List;

public interface UserDao {
    List<UserVo> selectAll();
    int insertUser(UserVo userVo);

    int usernameCheck(String username);

    int nicknameCheck(String usernickname);

    void insertInfo(UserVo userVo);

    String loginPasswordCheck(String username);

    UserVo selectUserInfoByUsername(String username);

    String findId(String useremail);

    String findPasswd(HashMap<String,String> map);

    void updatePassword(HashMap<String,String> map);

    String selectUsername(String useremail);

    String findEmailByUseremail(String useremail);

    String selectUseremail(String username);

    int findNowPasswd(String now_userpassword);

    void updateNewPasswd(HashMap<String,String> map);
}