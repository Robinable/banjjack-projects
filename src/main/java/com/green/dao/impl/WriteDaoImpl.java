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

    //글 쓰기, 답글 쓰기
    @Override
    public void Write(WriteVo writeVo) {
        int lvl = writeVo.getLvl();
        if (lvl == 0) {
            sqlSession.insert("Write.insertWrite", writeVo);
        } else {
            sqlSession.update("Write.UpdateRef", writeVo);
            sqlSession.insert("Write.BoardReply", writeVo);
        }
    }

    //파일 저장할때 사용할 글번호 가져오기
    @Override
    public WriteVo get_id(WriteVo writeVo) {
        WriteVo get_id = sqlSession.selectOne("Write.get_id", writeVo);
        return get_id;
    }

    //파일이름, 경로 저장
    @Override
    public void writeFile(FileVo fileVo) {
        sqlSession.insert("Write.writeFile", fileVo);
    }

    //글보기에서 이미지정보 가져오기
    @Override
    public FileVo getFile(String _id) {
        FileVo fileVo = sqlSession.selectOne("Write.getFile", _id);
        return fileVo;
    }

    //페이징
    @Override
    public int listCount(String category) {
        int count = sqlSession.selectOne("Write.listCount", category);
        return count;
    }

    //게시판 불러오기
    @Override
    public List<WriteVo> getList(String category, int displayPost, int postnum, int menu_id) {
        HashMap map = new HashMap();
        map.put("displaypost", displayPost);
        map.put("postnum", postnum);
        map.put("category", category);
        map.put("menu_id", menu_id);

        List<WriteVo> boardList = sqlSession.selectList("Write.boardList", map);
        return boardList;
    }

    //글 수정
    @Override
    public void updateBoard(WriteVo writeVo) {
        sqlSession.update("Write.updateBoard", writeVo);
    }

    //글 삭제
    @Override
    public void delete(String _id) {
        sqlSession.delete("Write.delete", _id);
    }

    //조회수 증가, 글보기
    @Override
    public List<WriteVo> getViewVo(String _id) {
        sqlSession.update("Write.updateReadCount", _id);
        List<WriteVo> getView = sqlSession.selectList("Write.getView", _id);
        return getView;
    }


}