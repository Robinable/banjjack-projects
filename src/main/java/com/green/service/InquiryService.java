package com.green.service;

import com.green.dao.impl.InquiryDaoImpl;
import com.green.vo.InquiryVo;
import com.green.vo.NoteVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InquiryService {
    @Autowired
    private InquiryDaoImpl inquiryDaoImpl;

    public void writeinquiry(InquiryVo inquiryVo) {
        inquiryDaoImpl.writeinquiry(inquiryVo);
    }

    public int allcount() {
        int count = inquiryDaoImpl.allcount();
        return count;
    }

    public List<InquiryVo> alllist(int displaypost, int postnum) {
        List<InquiryVo> vo = inquiryDaoImpl.alllist(displaypost, postnum);
        return vo;
    }


    public List<InquiryVo> caselist(int category, int displaypost, int postnum) {
        List<InquiryVo> vo = inquiryDaoImpl.caselist(category, displaypost, postnum);
        return vo;
    }

    public int casecount(int category) {
        int count = inquiryDaoImpl.casecount(category);
        return count;
    }
}
