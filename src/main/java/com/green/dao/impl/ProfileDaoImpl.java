package com.green.dao.impl;

import com.green.dao.ProfileDao;
import com.green.vo.ProfileVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("profileDao")
public class ProfileDaoImpl implements ProfileDao {

    @Autowired
    private SqlSession sqlSession;

    public void saveProfileImg(ProfileVo profileVo) {
        sqlSession.insert("Profile.saveProfileImg", profileVo);
    }

    public String selectImg(String userFilename) {
        return sqlSession.selectOne("Profile.selectImg", userFilename);
    }
}
