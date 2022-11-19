package com.green.controller;

import com.green.dao.CommunityDao;
import com.green.service.CommunityService;
import com.green.vo.CommunityVo;
import com.green.vo.PageVo;
import com.green.vo.TimeGap;
import com.green.vo.UserVo;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Array;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommunityController {
    PageVo page = new PageVo();
    TimeGap timeGap = new TimeGap();
    @Autowired
    CommunityService communityService;
    @Autowired
    CommunityDao communityDao ;

    //리스트획득
    @GetMapping("/getCommunityList")
    @ResponseBody
    public List<JSONObject> getCommunityList(@RequestParam String tag) throws ParseException {
        int displaypost =page.getDisplaypost();
        int postnum = page.getPostnum();
        System.out.println(tag);


        List<JSONObject> getList = new ArrayList<>();
        for(CommunityVo vo : communityService.getCommunityList(displaypost, postnum, tag)) {
            JSONObject obj = new JSONObject();
            timeGap.setTime(vo.getTime());
            obj.put("_id", vo.get_id());
            obj.put("username", vo.getUsername());
            obj.put("usernickname", vo.getUsernickname());
            obj.put("title", vo.getTitle());
            obj.put("tag", vo.getTag());
            obj.put("time", timeGap.getTime());
            obj.put("readcount", vo.getReadcount());
            obj.put("commentcount", vo.getCommentcount());
            getList.add(obj);
        }
        return getList;
    }
    //리스트출력
    @GetMapping("/communityList")
    public String CommunityList(Model model, @RequestParam(defaultValue = "1") int num, @RequestParam String tag){

        page.setNum(num);
        page.setCount(communityService.listCount());


        model.addAttribute("page", page);
        model.addAttribute("select", num);
        model.addAttribute("num", num);
        model.addAttribute("tag", tag);
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
    public String communityRead(Model model, @RequestParam int _id){
        model.addAttribute("id", _id);

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

    public Map<String, Object> communityWrite(CommunityVo communityVo, HttpSession httpSession) {


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

    //수정폼 변수세팅
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