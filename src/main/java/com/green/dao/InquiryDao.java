package com.green.dao;

import com.green.vo.InquiryVo;

import java.util.List;

public interface InquiryDao {
    void writeinquiry(InquiryVo inquiryVo);

    int allcount();

    List<InquiryVo> alllist(int displaypost, int postnum);

    List<InquiryVo> caselist(int category, int displaypost, int postnum);

    int casecount(int category);
}
