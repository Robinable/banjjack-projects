package com.green.dao;

import com.green.vo.UserVo;
import com.green.vo.WriteVo;

import java.util.List;

public interface WriteDao {

    void Write(WriteVo writeVo);

    List<WriteVo> getList(String category);
}
