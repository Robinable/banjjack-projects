package com.green.service;

import com.green.dao.impl.LeaveUserDaoImpl;
import com.green.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LeaveUserService {

    @Autowired
    private LeaveUserDaoImpl leaveUserDaoImpl;

    public void insertLeaveUser(UserVo userVo) {
        leaveUserDaoImpl.insertLeaveUser(userVo);
    }
}