package com.green.service;

import com.green.dao.CommentDao;
import com.green.vo.CommentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CommentService {

    @Autowired
    private CommentDao commentDao;

    public List<CommentVo> getCommentList(int content_id) {
        List<CommentVo> commentList = commentDao.getCommentList(content_id);
        return     commentList;
    }
    public void commentUpdate(Map<String, Object> map) {

        commentDao.commentUpdate(map);
    }
    public void commentDelete(int _id) {
        commentDao.commentDelete(_id);
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