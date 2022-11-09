package com.green.controller;

import com.green.service.EventService;
import com.green.vo.EventVo;
import com.green.vo.NoteVo;
import com.green.vo.NoticeVo;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
public class EventController {

    @Autowired
    private EventService eventService;

    @GetMapping("/eventlistform")
    public String eventlistform(@RequestParam int num, Model model){
        int pagenum_cnt = 5;
        int endpagenum = (int)(Math.ceil((double)num / (double)pagenum_cnt) * pagenum_cnt);
        int startpagenum = endpagenum - (pagenum_cnt - 1);

        int count = eventService.eventcount();
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
        return "/eventlist";
    }


    @GetMapping("/geteventlist")
    @ResponseBody
    public List<JSONObject> geteventlist(@RequestParam int num){

        int postnum = 10;
        int displaypost = (num - 1) * postnum;

        List<JSONObject> NoteVoList = new ArrayList<>();
        for (EventVo vo : eventService.eventlist(displaypost,postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("writer", vo.getWriter());
            obj.put("end_time", vo.getEnd_time());
            obj.put("start_time", vo.getStart_time());
            obj.put("displaypost", vo.getDisplaypost());
            obj.put("postnum", vo.getPostnum());

            NoteVoList.add(obj);
            System.out.println(NoteVoList);
        }
        return NoteVoList;
    }

    @GetMapping("/noweventlist")
    public String noweventlist(@RequestParam int num, Model model){

        LocalDate now = LocalDate.now();

        int pagenum_cnt = 5;
        int endpagenum = (int)(Math.ceil((double)num / (double)pagenum_cnt) * pagenum_cnt);
        int startpagenum = endpagenum - (pagenum_cnt - 1);

        int count = eventService.noweventcount(now);
        int count2 = eventService.pasteventcount(now);
        System.out.println("현재진행중인 이벤트:"+ count);
        System.out.println("끝난 이벤트:"+ count2);

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



        return "/eventlist";
    }




}
