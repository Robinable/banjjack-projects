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
            obj.put("username", vo.getUsername());
            obj.put("title", vo.getTitle());
            obj.put("tag", vo.getTag());
            obj.put("time", vo.getTime());
            obj.put("readcount", vo.getReadcount());
            getList.add(obj);
        }
        return getList;
    }
    //리스트출력
    @GetMapping("/communityList")
    public String CommunityList(){
        return "/communityList";
    }
    //게시글 조회
    @GetMapping("/getCommunityRead")
    @ResponseBody
    public List<JSONObject> getCommunityRead(@RequestParam int _id) {
        List<JSONObject> getRead = new ArrayList<>();
        for(CommunityVo vo: communityService.readCommunity(_id)){
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("username", vo.getUsername());
            obj.put("title", vo.getTitle());
            obj.put("tag", vo.getTag());
            obj.put("time", vo.getTime());
            obj.put("readcount", vo.getReadcount());
            obj.put("content", vo.getContent());
            getRead.add(obj);
        }
        return getRead;
    }
    //게시글 표시
    @GetMapping("/communityRead")
    public String communityRead(){

        return "/communityRead";
    }

    //글쓰기쓰기폼
    @GetMapping("/communityWriteForm")

    public String communityWriteForm() {
        return "/communityWriteForm";
    }
    //쓰기 메소드
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

    //수정폼세팅
    @GetMapping("/getCommunityUpdateForm")
    @ResponseBody
    public List<JSONObject> getcommunityUpdateForm(int _id){
        List<JSONObject> getRead = new ArrayList<>();
        for(CommunityVo vo: communityService.readCommunity(_id)){
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("username", vo.getUsername());
            obj.put("title", vo.getTitle());
            obj.put("tag", vo.getTag());
            obj.put("time", vo.getTime());
            obj.put("readcount", vo.getReadcount());
            obj.put("content", vo.getContent());
            getRead.add(obj);
        }
        return getRead;
    }
    //수정폼

    @GetMapping("/communityUpdateForm")

    public String communityUpdateForm(){
        return "/communityUpdateForm";
    };

    //수정 메소드
    @PostMapping("/communityUpdate")
    @ResponseBody
    public Map<String, Object> communityUpdate(@RequestParam String content, String title, int _id){


        Map<String, Object> communityUpdateData = new HashMap<>();
        communityUpdateData.put("content", content);
        communityUpdateData.put("title", title);
        communityUpdateData.put("_id", _id);

        Map<String, Object> map = new HashMap<>();
        try {
            communityService.updateCommunity(communityUpdateData);
            map.put("result", "success");
        }catch (Exception e) {
            e.printStackTrace();
            map.put("result", "fail");
        }
        return map;
    }
    //삭제

    @PostMapping("/communityDelete")
    @ResponseBody
    public Map<String, Object>  communityDelete(@RequestParam String _id){
        Map<String, Object> map = new HashMap<>();
        try {
            communityService.deleteCommunity(_id);
            map.put("result", "success");
        }catch (Exception e) {
            e.printStackTrace();
            map.put("result", "fail");
        }
        return map;
    }
}