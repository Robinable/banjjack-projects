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

    //페이징
    public int listCount(String category) {
        int count = writeDao.listCount(category);
        return count;
    }

    //게시판 불러오기
    public List<WriteVo> getList(String category, int displayPost, int postnum) {
        List<WriteVo> boardList = writeDao.getList(category, displayPost, postnum);
        return boardList;
    }

    //글 쓰기, 답글 쓰기
    public void Write(WriteVo writeVo) {
        writeDao.Write(writeVo);
    }

    //글 수정
    public void updateBoard(WriteVo writeVo) {
        writeDao.updateBoard(writeVo);
    }

    //글 삭제
    public void delete(String _id) {
        writeDao.delete(_id);
    }

    //조회수 증가, 글보기
    public List<WriteVo> getViewVo(String _id) {
        List<WriteVo> writevo = writeDao.getViewVo(_id);
        return writevo;
    }

    //파일 저장할때 사용할 글번호 가져오기
    public WriteVo get_id(WriteVo writeVo) {
        WriteVo _id = writeDao.get_id(writeVo);
        return _id;
    }

    //파일이름, 경로 저장
    public void writeFile(FileVo fileVo) {
        writeDao.writeFile(fileVo);
    }

    //글보기에서 이미지정보 가져오기
    public FileVo getFile(String _id) {
        FileVo fileVo = writeDao.getFile(_id);
        return fileVo;
    }


}