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
    public List<CommentVo> getCommentList(Map<String, Object> map) {

        List<CommentVo> commentList = sqlSession.selectList("Comment.commentList", map);
        return commentList;
    }

    @Override
    public int listCount() {
       int count= sqlSession.selectOne("comment.listCount");
        return count;
    }

    @Override
    public void commentUpdate(Map<String, Object> map) {
        sqlSession.update("Comment.commentUpdate", map);
    }

    @Override
    public void commentDelete(CommentVo commentVo) {
        sqlSession.delete("Comment.commentDelete",  commentVo);


    }

    @Override
    public void writeComment(CommentVo commentVo) {
        sqlSession.insert("Comment.writeComment", commentVo);

    }



}
