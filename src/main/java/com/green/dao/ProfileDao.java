package com.green.dao;

import com.green.vo.ProfileVo;

public interface ProfileDao {

    void saveProfileImg(ProfileVo profileVo);

    String selectImg(String userFilename);
}
