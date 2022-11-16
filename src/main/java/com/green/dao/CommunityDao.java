package com.green.dao;

import com.green.vo.CommunityVo;

import java.util.List;
import java.util.Map;

public interface CommunityDao {

    //리스트조회
    List<CommunityVo> getCommunityList(Map<String, Object> map) ;
    //페이징
    int listCount();

    //쓰기
    void writeCommunity(CommunityVo communityVo);

    //게시글조회
    List<CommunityVo> readCommunity(int _id);

    //수정
    void updateCommunity(Map<String, Object> map);

    //삭제
    void deleteCommunity(String _id);

}