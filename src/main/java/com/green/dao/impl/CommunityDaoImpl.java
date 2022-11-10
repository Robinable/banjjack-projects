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
        sqlSession.insert("Community.writeCommunity", communityVo);
    }

    @Override
    public List<CommunityVo> readCommunity(int _id) {
        List<CommunityVo> readCommunitya =
                sqlSession.selectList("Community.communityRead", _id);
        return readCommunitya;
    }

    @Override
    public void updateCommunity(CommunityVo communityVo) {

    }

    @Override
    public void deleteCommunity(int _id) {

    }
}
