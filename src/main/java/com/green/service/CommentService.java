package com.green.service;

import com.green.dao.CommentDao;
import com.green.vo.CommentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentService {

    @Autowired
    private CommentDao commentDao;

    public List<CommentVo> getCommentList(int content_id, int menu_id, int displaypost, int postnum) {
        Map<String, Object> map = new HashMap<>();
        map.put("content_id", content_id);
        map.put("menu_id", menu_id);
        map.put("displaypost", displaypost);
        map.put("postnum", postnum);

        List<CommentVo> commentList = commentDao.getCommentList(map);
        return     commentList;
    }
    public int listCount(int num, int menu_id, int content_id) {
        int count = commentDao.listCount(num, menu_id, content_id);
        return count;
    }

    public void commentUpdate(Map<String, Object> map) {

        commentDao.commentUpdate(map);
    }
    public void commentDelete(CommentVo  commentVo) {
        commentDao.commentDelete( commentVo);
    }
    public void writeComment(CommentVo commentVo) {
        commentDao.writeComment( commentVo );
    }

}