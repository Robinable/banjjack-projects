package com.green.dao.impl;

import com.green.dao.LeaveUserDao;
import com.green.vo.UserVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("leaveUserDao")
public class LeaveUserDaoImpl implements LeaveUserDao {

    @Autowired
    private SqlSession sqlSession;


    @Override
    public void insertLeaveUser(UserVo userVo) {
        sqlSession.insert("LeaveUser.insertLeaveUser", userVo);
    }
}