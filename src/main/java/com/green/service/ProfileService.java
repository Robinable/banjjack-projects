package com.green.service;

import com.green.dao.impl.ProfileDaoImpl;
import com.green.vo.ProfileVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class ProfileService {

    @Autowired
    private ProfileDaoImpl profileDaoimpl;


    public void saveProfileImg(HashMap<String,String> map) {
        profileDaoimpl.saveProfileImg(map);
    }

    public String getUserProfile(String username) {
        return profileDaoimpl.getUserProfile(username);
    }

    public String getUserByUsername(String username) {
        return profileDaoimpl.getUserByUsername(username);
    }

    public void updateUsername(HashMap<String, String> map) {
        profileDaoimpl.updateUsername(map);
    }
}
