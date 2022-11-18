package com.green.dao;

import com.green.vo.ProfileVo;

import java.util.HashMap;

public interface ProfileDao {

    void saveProfileImg(HashMap<String,String> map);

    String getUserProfile(String username);

    String getUserByUsername(String username);

    void updateUsername(HashMap<String, String> map);
}