package com.green.dao;

import com.green.vo.CommentVo;

import java.util.List;
import java.util.Map;

public interface CommentDao {

   List<CommentVo> getCommentList(int content_id);

   void commentUpdate(Map<String, Object> map);

   void commentDelete(int _id);

   void writeComment(CommentVo commentVo);

   int commentCount(int content_id) throws Exception;

   List commentListPage(int content_id, int displayPost,int postNum) throws Exception;

}