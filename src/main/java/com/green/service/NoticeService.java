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

    public NoticeVo selectCont(int _id) {
        NoticeVo vo = noticeDaoImpl.selectcont(_id);
        return vo;
    }

    public void cntup(int _id) {
        noticeDaoImpl.cntup(_id);
    }
}
