package com.green.dao.impl;

import com.green.dao.EventDao;
import com.green.vo.EventVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

@Repository("EventDao")
public class EventDaoImpl implements EventDao {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<EventVo> eventlist(int displaypost, int postnum) {

        HashMap map = new HashMap();
        map.put("displaypost",displaypost);
        map.put("postnum",postnum);

        List<EventVo> vo = sqlSession.selectList("Event.eventlist",map);
        return vo;
    }

    @Override
    public int eventcount() {
        int count = sqlSession.selectOne("Event.eventcount");
        return count;
    }

    @Override
    public int noweventcount(LocalDate now) {
        int count = sqlSession.selectOne("Event.noweventcount",now);
        return count;
    }

    @Override
    public int pasteventcount(LocalDate now) {
        int count = sqlSession.selectOne("Event.pasteventcount",now);
        return count;
    }

    @Override
    public List<EventVo> noweventlist(LocalDate now, int displaypost, int postnum) {
        HashMap map = new HashMap();
        map.put("now",now);
        map.put("displaypost",displaypost);
        map.put("postnum",postnum);

        List<EventVo> vo = sqlSession.selectList("Event.noweventlist",map);
        return vo;
    }

    @Override
    public List<EventVo> pasteventlist(LocalDate now, int displaypost, int postnum) {
        HashMap map = new HashMap();
        map.put("now",now);
        map.put("displaypost",displaypost);
        map.put("postnum",postnum);

        List<EventVo> vo = sqlSession.selectList("Event.pasteventlist",map);
        return vo;
    }

    @Override
    public void writeevent(EventVo eventVo) {
        sqlSession.insert("Event.writeevent",eventVo);
    }

    @Override
    public EventVo selectCont(int _id) {
        EventVo vo = sqlSession.selectOne("Event.selectCont",_id);
        return vo;
    }

    @Override
    public void readcntup(int _id) {
        sqlSession.selectOne("Event.readcntup",_id);
    }

    @Override
    public void eventupdate(EventVo eventVo) {
        sqlSession.update("Event.eventupdate",eventVo);
        System.out.println("확인:"+eventVo);
    }
}