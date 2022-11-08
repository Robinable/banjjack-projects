package com.green.dao.impl;

import com.green.dao.NoteDao;
import com.green.vo.NoteVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository("NoteDao")
public class NoteDaoImpl implements NoteDao {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertNote(NoteVo vo) {
        sqlSession.insert("Note.insertNote",vo);
    }

    @Override
    public List<NoteVo> selectRecept(String recept) {
        List<NoteVo> vo = sqlSession.selectList("Note.selectRecept",recept);
        return vo;
    }

    @Override
    public List<NoteVo> selectSend(String send) {
        List<NoteVo> vo = sqlSession.selectList("Note.selectSend",send);
        return vo;
    }

    @Override
    public NoteVo selectCont(int _id) {
        NoteVo vo = sqlSession.selectOne("Note.selectCont",_id);
        return vo;
    }

    @Override
    public void deleteNote(int _id) {
        sqlSession.delete("Note.deleteNote",_id);
    }

    @Override
    public int receptcount(String recept) {
        int count = sqlSession.selectOne("Note.receptcount",recept);
        return count;
    }

    @Override
    public List<NoteVo> receptpage(String recept, int displaypost, int postnum) {

        HashMap map = new HashMap();
        map.put("displaypost",displaypost);
        map.put("postnum",postnum);
        map.put("recept",recept);

        List<NoteVo> vo = sqlSession.selectList("Note.receptpage", map);
        return vo;
    }

    @Override
    public int sendcount(String send) {
        int count = sqlSession.selectOne("Note.sendcount",send);
        return count;
    }

    @Override
    public List<NoteVo> sendpage(String send, int displaypost, int postnum) {

        HashMap map = new HashMap();
        map.put("displaypost",displaypost);
        map.put("postnum",postnum);
        map.put("send",send);

        List<NoteVo> vo = sqlSession.selectList("Note.sendpage", map);
        return vo;
    }

    @Override
    public int chkrecept(String recept) {
        int chk = sqlSession.selectOne("chkrecept",recept);
        return chk;
    }
}
