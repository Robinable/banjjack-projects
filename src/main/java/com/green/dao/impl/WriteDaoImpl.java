package com.green.dao.impl;


import com.green.dao.WriteDao;
import com.green.vo.WriteVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("WriteDao")
public class WriteDaoImpl implements WriteDao {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public void Write(WriteVo writeVo) {
        sqlSession.insert("Write.insertWrite", writeVo);
    }

    @Override
    public List<WriteVo> getList(String category) {
        List<WriteVo> boardList = sqlSession.selectList("Write.boardList", category);
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