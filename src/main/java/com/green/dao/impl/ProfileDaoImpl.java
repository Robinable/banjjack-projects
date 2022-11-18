package com.green.dao.impl;

import com.green.dao.ProfileDao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository("profileDao")
public class ProfileDaoImpl implements ProfileDao {

    @Autowired
    private SqlSession sqlSession;

    public void saveProfileImg(HashMap<String,String> map) {
        sqlSession.insert("Profile.saveProfileImg", map);
    }

    @Override
    public String getUserProfile(String username) {
        return sqlSession.selectOne("Profile.getUserProfile", username);
    }

    @Override
    public String getUserByUsername(String username) {
        return sqlSession.selectOne("Profile.getUserByUsername", username);
    }

    @Override
    public void updateUsername(HashMap<String, String> map) {
        sqlSession.update("Profile.updateUsername", map);
    }

}