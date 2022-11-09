package com.green.dao;

import com.green.vo.EventVo;

import java.time.LocalDate;
import java.util.List;

public interface EventDao {
    List<EventVo> eventlist(int displaypost, int postnum);

    int eventcount();

    int noweventcount(LocalDate now);

    int pasteventcount(LocalDate now);
}
