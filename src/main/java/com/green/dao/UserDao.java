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

    UserVo selectUserInfo(HashMap<String, String> map);

    String findId(String useremail);

    String findPasswd(HashMap<String,String> map);

    void updatePassword(HashMap<String,String> map);

    String selectUsername(String useremail);

    String findEmailByUseremail(String useremail);

    String selectUseremail(String username);

    String findNowPasswd(String username);

    void updateNewPasswd(HashMap<String,String> map);

    void mypageUsernicknameUpdate(HashMap<String, Object> map);

    void mypageUsersidoUpdate(HashMap<String, Object> map);

    void mypageUsergugunUpdate(HashMap<String, Object> map);

    void mypageUserpetUpdate(HashMap<String, Object> map);

    UserVo getUserInfo(String username);

    void deleteUser(String username);

    String idUsername(String username);
}