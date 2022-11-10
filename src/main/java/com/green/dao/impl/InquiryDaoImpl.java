package com.green.dao.impl;

import com.green.dao.InquiryDao;
import com.green.vo.InquiryVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository("InquiryDao")
public class InquiryDaoImpl implements InquiryDao {
    @Autowired private SqlSession sqlSession;

    @Override
    public void writeinquiry(InquiryVo inquiryVo) {
        sqlSession.insert("Inquiry.write",inquiryVo);
    }

    @Override
    public int allcount() {
        int count = sqlSession.selectOne("Inquiry.allcount");
        return count;
    }

    @Override
    public List<InquiryVo> alllist(int displaypost, int postnum) {
        HashMap map = new HashMap<>();
        map.put("displaypost",displaypost);
        map.put("postnum",postnum);

        List<InquiryVo> vo = sqlSession.selectList("Inquiry.alllist",map);
        return vo;
    }

    @Override
    public List<InquiryVo> caselist(int category, int displaypost, int postnum) {
        HashMap map = new HashMap<>();
        map.put("displaypost",displaypost);
        map.put("postnum",postnum);
        map.put("category",category);

        List<InquiryVo> vo = sqlSession.selectList("Inquiry.caselist",map);

        return vo;
    }

    @Override
    public int casecount(int category) {
        int count = sqlSession.selectOne("Inquiry.casecount", category);
        return count;
    }
}
