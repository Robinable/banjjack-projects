package com.green.service;


import com.green.dao.impl.NoteDaoImpl;
import com.green.vo.NoteVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoteService {

    @Autowired
    private NoteDaoImpl noteDaoImpl;


    public void insertNote(NoteVo vo) {
        noteDaoImpl.insertNote(vo);
    }

    public List<NoteVo> selectRecept(String recept) {
        List<NoteVo> vo = noteDaoImpl.selectRecept(recept);
        return vo;
    }


    public List<NoteVo> selectSend(String send) {
        List<NoteVo> vo = noteDaoImpl.selectSend(send);
        return vo;
    }

    public NoteVo selectCont(int _id) {
        NoteVo vo = noteDaoImpl.selectCont(_id);
        return vo;
    }

    public void deleteNote(int _id) {
        noteDaoImpl.deleteNote(_id);
    }

    public int receptcount(String recept) {
        int count = noteDaoImpl.receptcount(recept);
        return count;
    }

    public List<NoteVo> receptpage(String recept, int displaypost, int postnum) {
        List<NoteVo> vo = noteDaoImpl.receptpage(recept,displaypost,postnum);
        return vo;
    }

    public int sendcount(String send) {
        int count = noteDaoImpl.sendcount(send);
        return count;
    }

    public List<NoteVo> sendpage(String send, int displaypost, int postnum) {
        List<NoteVo> vo = noteDaoImpl.sendpage(send,displaypost,postnum);
        return vo;
    }

    public int chkrecept(String recept) {
        int chk = noteDaoImpl.chkrecept(recept);
        return chk;
    }
}

