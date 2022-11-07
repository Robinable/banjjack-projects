package com.green.dao.impl;

import com.green.dao.UserDao;
import com.green.vo.UserVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<UserVo> selectAll() {
        return sqlSession.selectList("User.selectAll");
    }

    @Override
    public int insertUser(UserVo userVo) {
        return sqlSession.insert("User.insertUser", userVo);
    }

    public int usernameCheck(String username) {
        return sqlSession.selectOne("User.usernameCheck", username);
    }

    public int nicknameCheck(String usernickname) {
        return sqlSession.selectOne("User.nicknameCheck", usernickname);
    }

    public void insertInfo(UserVo userVo) {
        sqlSession.insert("User.insertInfo", userVo);
    }


    public String loginPasswordCheck(String username) {
        return sqlSession.selectOne("User.loginPasswordCheck", username);
    }

    public UserVo selectUserInfoByUsername(String username) {
        return sqlSession.selectOne("User.selectUserInfoByUsername", username);
    }

}


