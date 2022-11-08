package com.green.dao;

import com.green.vo.NoteVo;

import java.util.List;

public interface NoteDao {
    void insertNote(NoteVo vo);

    List<NoteVo> selectRecept(String recept);

    List<NoteVo> selectSend(String send);

    NoteVo selectCont(int _id);

    void deleteNote(int _id);

    int receptcount(String recept);

    List<NoteVo> receptpage(String recept, int displaypost, int postnum);

    int sendcount(String send);

    List<NoteVo> sendpage(String send, int displaypost, int postnum);

    int chkrecept(String recept);
}
