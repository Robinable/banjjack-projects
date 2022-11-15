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

    public List<CommentVo> getCommentList(int content_id, int menu_id ) {
        Map<String, Object> map = new HashMap<>();
        map.put("content_id", content_id);
        map.put("menu_id", menu_id);

        List<CommentVo> commentList = commentDao.getCommentList(map);
        return     commentList;
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

    public int commentCount(int content_id) throws Exception {
        return commentDao.commentCount(content_id);
    }
    public List<CommentVo> coommentListPage(int content_id, int displayPost, int postNum ) throws Exception{
        return commentDao.commentListPage( content_id,  displayPost, postNum );
    }
}