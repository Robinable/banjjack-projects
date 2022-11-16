package com.green.service;

import com.green.vo.CommunityVo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.green.dao.CommunityDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityService {

    @Autowired
    private CommunityDao communityDao;
    //리스트조회
    public List<CommunityVo> getCommunityList(int displaypost, int postnum) {
        Map<String, Object> map = new HashMap<>();
        map.put("displaypost", displaypost);
        map.put("postnum", postnum);
        List<CommunityVo> communityList = communityDao.getCommunityList(map);
        return    communityList;
    }
    //페이징
    public int listCount() {
        int count = communityDao.listCount();
        return count;
    }
    //쓰기
    public void writeCommunity(CommunityVo communityVo){
        communityDao.writeCommunity(communityVo);

    }

    //게시글조회
    public List<CommunityVo> readCommunity(int _id) {
        List<CommunityVo> communityRead = communityDao.readCommunity(_id);
        return communityRead;
    }

    //수정
    public void updateCommunity(Map<String, Object> map){
        communityDao.updateCommunity(map);
    }

    //삭제
    public void deleteCommunity(String _id){
        communityDao.deleteCommunity(_id);
    }

}