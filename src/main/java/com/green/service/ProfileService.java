package com.green.service;

import com.green.dao.impl.ProfileDaoImpl;
import com.green.vo.ProfileVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfileService {

    @Autowired
    private ProfileDaoImpl profileDaoimpl;


    public void saveProfileImg(ProfileVo profileVo) {
        profileDaoimpl.saveProfileImg(profileVo);
    }
}
