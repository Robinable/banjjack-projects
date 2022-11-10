package com.green.dao.impl;


import com.green.dao.WriteDao;
import com.green.vo.WriteVo;
import com.green.vo.FileVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository("WriteDao")
public class WriteDaoImpl implements WriteDao {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public void Write(WriteVo writeVo) {
        int lvl = writeVo.getLvl();
        if(lvl == 0) {
            sqlSession.insert("Write.insertWrite", writeVo);
        } else {
            sqlSession.update("Write.UpdateRef", writeVo);
            sqlSession.insert("Write.BoardReply", writeVo);
        }
    }

    @Override
    public WriteVo get_id(WriteVo writeVo) {
        WriteVo get_id = sqlSession.selectOne("Write.get_id", writeVo);
        System.out.println("content_id" + writeVo.get_id());
        return get_id;
    }

    @Override
    public void writeFile(FileVo fileVo) {
        sqlSession.insert("Write.writeFile", fileVo);
    }

    @Override
    public FileVo getFile(String _id) {
        FileVo fileVo = sqlSession.selectOne("Write.getFile", _id);
        return fileVo;
    }

    @Override
    public int listCount(String category) {
        int count = sqlSession.selectOne("Write.listCount", category);
        return count;
    }

    @Override
    public List<WriteVo> getList(String category, int displayPost, int postnum) {
        HashMap map = new HashMap();
        map.put("displaypost", displayPost);
        map.put("postnum", postnum);
        map.put("category", category);

        List<WriteVo> boardList = sqlSession.selectList("Write.boardList", map);
        return boardList;
    }

    @Override
    public WriteVo getBoard(String _id) {
        sqlSession.update("Write.updateReadCount", _id);
        WriteVo board = sqlSession.selectOne("Write.getBoard", _id);
        return board;
    }

    @Override
    public void updateBoard(WriteVo writeVo) {
        System.out.println(writeVo.toString());
        sqlSession.update("Write.updateBoard", writeVo);
    }

    @Override
    public void delete(String _id) {
        sqlSession.delete("Write.delete", _id);
    }

    @Override
    public List<WriteVo> getViewVo(String _id) {
        sqlSession.update("Write.updateReadCount", _id);
        List<WriteVo> getView = sqlSession.selectList("Write.getView", _id);
        return getView;
    }




}