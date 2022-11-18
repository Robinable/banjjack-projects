package com.green.dao;

import com.green.vo.WriteVo;
import com.green.vo.FileVo;

import java.util.List;

public interface WriteDao {

    void Write(WriteVo writeVo);

    List<WriteVo> getList(String category, int displayPost, int postnum, int menu_id);

    void updateBoard(WriteVo writeVo);

    void delete(String id);

    List<WriteVo> getViewVo(String id);

    WriteVo get_id(WriteVo writeVo);

    void writeFile(FileVo fileVo);

    FileVo getFile(String id);

    int listCount(String category);
}




