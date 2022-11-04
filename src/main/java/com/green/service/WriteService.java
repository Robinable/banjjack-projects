package com.green.service;

import com.green.dao.WriteDao;
import com.green.vo.WriteVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WriteService {
    @Autowired
    private WriteDao writeDao;


    public List<WriteVo> getList(String category) {
        List<WriteVo> boardList = writeDao.getList(category);
        return boardList;
    }

    public void Write(WriteVo writeVo) {
        writeDao.Write(writeVo);
    }

    public WriteVo getBoard(String _id) {
        System.out.println(_id);
        WriteVo board = writeDao.getBoard(_id);
        return board;
    }

}
