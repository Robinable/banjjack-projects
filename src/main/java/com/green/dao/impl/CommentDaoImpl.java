package com.green.dao.impl;

import com.green.dao.CommentDao;
import com.green.vo.CommentVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("CommentDao")
public class CommentDaoImpl implements CommentDao {

    @Autowired
    private SqlSession sqlSession;
    @Override
    public List<CommentVo> getCommentList(int content_id) {
        List<CommentVo> commentList = sqlSession.selectList("Comment.commentList", content_id);
        return commentList;
    }

    @Override
    public void commentUpdate(Map<String, Object> map) {
        sqlSession.update("Comment.commentUpdate", map);
    }

    @Override
    public void commentDelete(int _id) {
        sqlSession.delete("Comment.commentDelete", _id);

    }

    @Override
    public void writeComment(CommentVo commentVo) {
        sqlSession.insert("Comment.writeComment", commentVo);
    }



}
