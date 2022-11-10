package com.green.service;

import com.green.dao.WriteDao;
import com.green.vo.WriteVo;
import com.green.vo.FileVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WriteService {
    @Autowired
    private WriteDao writeDao;

    public int listCount(String category) {
        int count = writeDao.listCount(category);
        return  count;
    }

    public List<WriteVo> getList(String category, int displayPost, int postnum) {
        List<WriteVo> boardList = writeDao.getList(category, displayPost, postnum);
        return boardList;
    }

    public void Write(WriteVo writeVo) {
        writeDao.Write(writeVo);
    }

    public WriteVo getBoard(String _id) {
        WriteVo board = writeDao.getBoard(_id);
        return board;
    }

    public void updateBoard(WriteVo writeVo) {
        writeDao.updateBoard(writeVo);
    }

    public void delete(String _id) {
        writeDao.delete(_id);
    }

    public List<WriteVo> getViewVo(String _id) {
        List<WriteVo> writevo = writeDao.getViewVo(_id);
        return writevo;
    }


    public WriteVo get_id(WriteVo writeVo) {
        WriteVo _id = writeDao.get_id(writeVo);
        return _id;
    }

    public void writeFile(FileVo fileVo) {
        writeDao.writeFile(fileVo);
        System.out.println(fileVo.toString());
    }

    public FileVo getFile(String _id) {
        FileVo fileVo = writeDao.getFile(_id);
        return fileVo;
    }


}
