package com.green.service;

import com.green.dao.impl.NoticeDaoImpl;
import com.green.vo.NoteVo;
import com.green.vo.NoticeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service


public class NoticeService {

    @Autowired
    private NoticeDaoImpl noticeDaoImpl;
    public List<NoticeVo> noticelist() {
        List<NoticeVo> vo = noticeDaoImpl.noticelist();
        return vo;
    }
}
