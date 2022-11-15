package com.green.dao.impl;



import com.green.dao.CommunityDao;
import com.green.vo.CommentVo;
import com.green.vo.CommunityVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("CommunityDao")

public class CommunityDaoImpl implements CommunityDao {

    @Autowired
    SqlSession sqlSession;
    @Override
    public List<CommunityVo> getCommunityList() {
        List<CommunityVo> communityList
                = sqlSession.selectList("Community.communityList");
        return communityList;
    }

    @Override
    public void writeCommunity(CommunityVo communityVo) {
        sqlSession.insert("Community.communityWrite", communityVo);
    }

    @Override
    public List<CommunityVo> readCommunity(int _id) {
        List<CommunityVo> voList =
                sqlSession.selectList("Community.communityRead", _id);
        return voList;
    }

    @Override
    public void updateCommunity(Map<String, Object> map) {
        sqlSession.update("Community.communityUpdate", map);

    }

    @Override
    public void deleteCommunity(String _id) {
        sqlSession.delete("Community.communityDelete", _id);
    }
}