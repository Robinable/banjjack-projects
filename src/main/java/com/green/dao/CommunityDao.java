package com.green.dao;

import com.green.vo.CommunityVo;

import java.util.List;

public interface CommunityDao {

    //리스트조회
    List<CommunityVo> getCommunityList() ;

    //쓰기
    void writeCommunity(CommunityVo communityVo);

    //게시글조회
    List<CommunityVo> readCommunity(int _id);

    //수정
    void updateCommunity(CommunityVo communityVo);

    //삭제
    void deleteCommunity(int _id);


}
