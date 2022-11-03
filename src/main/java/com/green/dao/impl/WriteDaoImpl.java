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
    private static SqlSession sqlSession;

    @Override
    public List<WriteVo> selectAll() {
        return null;
    }

    @Override
    public void Write(WriteVo writeVo) {
        System.out.println("DaoImpl:"+ writeVo);
        sqlSession.insert("Write.insertWrite", writeVo);
    }

    @Override
    public List<WriteVo> getList(int category) {
        System.out.println("DapImpl:" + category);
        List<WriteVo> boardList = sqlSession.selectList("Write.BoardList", category);
        return boardList;
    }


}