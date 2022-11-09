package com.green.controller;

import com.green.service.NoticeService;
import com.green.vo.NoteVo;
import com.green.vo.NoticeVo;
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

    @GetMapping("/noticeList")
    public String noticeList(@RequestParam int num, Model model){

        int pagenum_cnt = 5;
        int endpagenum = (int)(Math.ceil((double)num / (double)pagenum_cnt) * pagenum_cnt);
        int startpagenum = endpagenum - (pagenum_cnt - 1);

        int count = noticeService.noticecount();
        System.out.println("카운트"+count);
        int postnum = 10;
        int pagenum = (int)Math.ceil((double)count/postnum);
        int displaypost = (num - 1) * postnum;

        int endpagenum_tmp = (int)(Math.ceil((double)count / (double)postnum));
        if(endpagenum > endpagenum_tmp) {
            endpagenum = endpagenum_tmp;
        }

        boolean prev = startpagenum == 1 ? false : true;
        // prev의 bool을 정하는데
        //startpagenum이 1이면 false 아니라면 true
        boolean next = endpagenum * postnum >= count ? false : true;

        model.addAttribute("startpagenum", startpagenum);
        model.addAttribute("endpagenum", endpagenum);

        model.addAttribute("prev", prev);
        model.addAttribute("next", next);

        model.addAttribute("pagenum",pagenum);
        model.addAttribute("num",num);

        model.addAttribute("select", num);


        return "/noticelist";
    }

    @GetMapping("/getnoticelist")
    @ResponseBody
    public List<JSONObject> getnoticelist(@RequestParam int num){

        int postnum = 10;
        int displaypost = (num - 1) * postnum;

        List<JSONObject> NoteVoList = new ArrayList<>();
        for (NoticeVo vo : noticeService.noticelist(displaypost,postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("writer", vo.getWriter());
            obj.put("time", vo.getTime());
            obj.put("readcount", vo.getReadcount());
            obj.put("displaypost", vo.getDisplaypost());
            obj.put("postnum", vo.getPostnum());

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
