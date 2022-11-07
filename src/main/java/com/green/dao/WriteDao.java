package com.green.dao;

import com.green.vo.UserVo;
import com.green.vo.WriteVo;

import java.util.List;

public interface WriteDao {

    void Write(WriteVo writeVo);

    List<WriteVo> getList(String category);

    WriteVo getBoard(String _id);

    void updateBoard(WriteVo writeVo);

    void delete(String id);

    List<WriteVo> getWritejson(String category);

    List<WriteVo> getViewjson(String id);
}
