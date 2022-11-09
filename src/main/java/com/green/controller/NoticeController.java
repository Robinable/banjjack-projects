package com.green.controller;

import com.green.service.NoticeService;
import com.green.vo.NoteVo;
import com.green.vo.NoticeVo;
import com.green.vo.Page;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class NoticeController {
    @Autowired private NoticeService noticeService;

    Page page = new Page();
    @GetMapping("/noticeList")
    public String noticeList(@RequestParam int num, Model model){

        page.setNum(num);
        page.setCount(noticeService.noticecount());

        model.addAttribute("page",page);
        model.addAttribute("select", num);
        model.addAttribute("num", num);

        return "/noticelist";
    }

    @GetMapping("/getnoticelist")
    @ResponseBody
    public List<JSONObject> getnoticelist(@RequestParam int num){

        int postnum = page.getPostnum();
        int displaypost = page.getDisplaypost();

        List<JSONObject> NoteVoList = new ArrayList<>();
        for (NoticeVo vo : noticeService.noticelist(displaypost,postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("writer", vo.getWriter());
            obj.put("time", vo.getTime());
            obj.put("readcount", vo.getReadcount());

            NoteVoList.add(obj);
        }
        return NoteVoList;
    }

    @GetMapping("/noticecontform")
    public String noticecontform( @RequestParam int _id){

        noticeService.cntup(_id);

        return "/noticecont";
    }

    @GetMapping("/getnoticecont")
    @ResponseBody
    public List<JSONObject> getnoticecont(@RequestParam int _id){

        List<JSONObject> NoteVoList = new ArrayList<>();
        NoticeVo vo = noticeService.selectCont(_id);

        JSONObject obj = new JSONObject();
        obj.put("_id", vo.get_id());
        obj.put("title", vo.getTitle());
        obj.put("writer", vo.getWriter());
        obj.put("time", vo.getTime());
        obj.put("readcount", vo.getReadcount());

        NoteVoList.add(obj);

        return NoteVoList;
    }

}
