package com.green.controller;

import com.green.service.EventService;
import com.green.vo.EventVo;
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

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
public class EventController {
    @Autowired
    private EventService eventService;

    Page page = new Page();

    //전체 이벤트
    @GetMapping("/eventlistform")
    public String eventlistform(@RequestParam int num, Model model){

        page.setNum(num);
        page.setCount(eventService.eventcount());

        model.addAttribute("page",page);
        model.addAttribute("select", num);
        model.addAttribute("num", num);

        return "/eventlist";
    }


    @GetMapping("/geteventlist")
    @ResponseBody
    public List<JSONObject> geteventlist(@RequestParam int num){

        int postnum = page.getPostnum();
        int displaypost = page.getDisplaypost();

        List<JSONObject> NoteVoList = new ArrayList<>();
        for (EventVo vo : eventService.eventlist(displaypost,postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("writer", vo.getWriter());
            obj.put("end_time", vo.getEnd_time());
            obj.put("start_time", vo.getStart_time());

            NoteVoList.add(obj);
            System.out.println(NoteVoList);
        }
        return NoteVoList;
    }

    //진행중인 이벤트
    @GetMapping("/noweventlist")
    public String noweventlist(@RequestParam int num, Model model){

        LocalDate now = LocalDate.now();
        //    int count = eventService.noweventcount(now);
        //   int count2 = eventService.pasteventcount(now);

        page.setNum(num);
        page.setCount(eventService.noweventcount(now));

        model.addAttribute("page",page);
        model.addAttribute("select", num);
        model.addAttribute("num", num);

        return "/noweventlist";
    }

    @GetMapping("/getnoweventlist")
    @ResponseBody
    public List<JSONObject> getnoweventlist(@RequestParam int num){

        LocalDate now = LocalDate.now();

        int postnum = page.getPostnum();
        int displaypost = page.getDisplaypost();

        List<JSONObject> NoteVoList = new ArrayList<>();
        for (EventVo vo : eventService.noweventlist(now,displaypost,postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("writer", vo.getWriter());
            obj.put("end_time", vo.getEnd_time());
            obj.put("start_time", vo.getStart_time());

            NoteVoList.add(obj);
            System.out.println(NoteVoList);
        }
        return NoteVoList;
    }

    //지난 이벤트
    @GetMapping("/pasteventlist")
    public String pasteventlist(@RequestParam int num, Model model){

        LocalDate now = LocalDate.now();
        //    int count = eventService.noweventcount(now);
        //   int count2 = eventService.pasteventcount(now);

        page.setNum(num);
        page.setCount(eventService.pasteventcount(now));

        model.addAttribute("page",page);
        model.addAttribute("select", num);
        model.addAttribute("num", num);

        return "/pasteventlist";
    }

    @GetMapping("/getpasteventlist")
    @ResponseBody
    public List<JSONObject> getpasteventlist(@RequestParam int num){

        LocalDate now = LocalDate.now();

        int postnum = page.getPostnum();
        int displaypost = page.getDisplaypost();

        List<JSONObject> NoteVoList = new ArrayList<>();
        for (EventVo vo : eventService.pasteventlist(now,displaypost,postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("writer", vo.getWriter());
            obj.put("end_time", vo.getEnd_time());
            obj.put("start_time", vo.getStart_time());

            NoteVoList.add(obj);
            System.out.println(NoteVoList);
        }
        return NoteVoList;
    }





}
