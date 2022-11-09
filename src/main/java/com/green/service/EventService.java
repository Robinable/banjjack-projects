package com.green.service;

import com.green.dao.impl.EventDaoImpl;
import com.green.vo.EventVo;
import com.green.vo.NoticeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class EventService {
    @Autowired
    private EventDaoImpl eventDaoImpl;

    public List<EventVo> eventlist(int displaypost, int postnum) {
        List<EventVo> vo = eventDaoImpl.eventlist(displaypost,postnum);
        return vo;
    }

    public int eventcount() {
        int count = eventDaoImpl.eventcount();
        return count;
    }

    public int noweventcount(LocalDate now) {
        int count = eventDaoImpl.noweventcount(now);
        return count;
    }

    public int pasteventcount(LocalDate now) {
        int count = eventDaoImpl.pasteventcount(now);
        return count;
    }

    public List<EventVo> noweventlist(LocalDate now, int displaypost, int postnum) {
        List<EventVo> vo = eventDaoImpl.noweventlist(now,displaypost,postnum);
        return vo;
    }

    public List<EventVo> pasteventlist(LocalDate now, int displaypost, int postnum) {
        List<EventVo> vo = eventDaoImpl.pasteventlist(now,displaypost,postnum);
        return vo;
    }
}
