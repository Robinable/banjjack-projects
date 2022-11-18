package com.green.dao;

import com.green.vo.InquiryVo;

import java.util.List;

public interface InquiryDao {
    void writeinquiry(InquiryVo inquiryVo);

    int allcount();

    List<InquiryVo> alllist(int displaypost, int postnum);

    List<InquiryVo> caselist(int category, int displaypost, int postnum);

    int casecount(int category);

    int mylistcount(String send);

    List<InquiryVo> inquirymylist(String send, int displaypost, int postnum);

    InquiryVo selectCont(int _id);
}