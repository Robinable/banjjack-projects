package com.green.dao;


import com.green.vo.NoteVo;
import com.green.vo.NoticeVo;

import java.util.List;

public interface NoticeDao {

    List<NoticeVo> noticelist(int displaypost, int postnum);

    NoticeVo selectcont(int _id);

    void cntup(int _id);

    int noticecount();
}

