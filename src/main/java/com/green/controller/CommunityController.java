package com.green.controller;

import com.green.dao.CommunityDao;
import com.green.service.CommunityService;
import com.green.vo.CommunityVo;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommunityController {
    @Autowired
    CommunityService communityService;
    @Autowired
    CommunityDao communityDao ;

    //리스트획득
    @GetMapping("/getCommunityList")
    @ResponseBody
    public List<JSONObject> getCommunityList() {
        List<JSONObject> getList = new ArrayList<>();
        for(CommunityVo vo : communityService.getCommunityList()) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("name", vo.getUsername());
            obj.put("title", vo.getTitle());
            obj.put("tag", vo.getTag());
            obj.put("time", vo.getTime());
            obj.put("readcount", vo.getReadcount());
            getList.add(obj);
        }
        System.out.println("dd"+getList);
        return getList;
    }
    //리스트출력
    @GetMapping("/communityList")
    public String CommunityList(){
        return "/communityList";
    }
    //게시글조회폼
    @GetMapping("/getCommunityRead")
    @ResponseBody
    public List<JSONObject> getCommunityRead(@RequestParam int _id) {
        System.out.println(_id);
        List<JSONObject> getRead = new ArrayList<>();
        for(CommunityVo vo: communityService.readCommunity(_id)){
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("name", vo.getUsername());
            obj.put("title", vo.getTitle());
            obj.put("tag", vo.getTag());
            obj.put("time", vo.getTime());
            obj.put("readcount", vo.getReadcount());
            obj.put("content", vo.getContent());
            getRead.add(obj);
        }
        System.out.println("ee"+getRead);
        return getRead;
    }
    @GetMapping("/communityRead")
    public String communityRead(){
        return "/communityRead";
    }

    //쓰기폼
    @GetMapping("/communityWriteForm")
    public String communityWriteForm() {
        return "/communityWriteForm";
    }
    //쓰기
    @PostMapping("/communityWrite")
    @ResponseBody

    public Map<String, Object> communityWrite(CommunityVo communityVo) {
        System.out.println(communityVo);
        Map<String, Object> map = new HashMap<>();
        try{
            communityService.writeCommunity(communityVo);
            map.put("result", "success");
        }catch (Exception e){
            e.printStackTrace();
            map.put("result", "fail");
        }
        return map;

    }

    //수정폼
    //수정
    //삭제
}
