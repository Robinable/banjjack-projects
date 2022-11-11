package com.green.controller;

import com.green.service.InquiryService;
import com.green.vo.InquiryVo;
import com.green.vo.NoteVo;
import com.green.vo.PageVo;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class InquiryController {

    // 1:1문의
    @Autowired
    private InquiryService inquiryService;

    PageVo page = new PageVo();

    @GetMapping("writeinquiryForm")
    public String writeinquiryForm() {

        return "inquiryWrite";
    }

    @PostMapping("writeinquiry")
    public String writeinquiry(HttpServletRequest request) {


        InquiryVo inquiryVo = new InquiryVo();
        inquiryVo.setContent(request.getParameter("content"));
        inquiryVo.setTitle(request.getParameter("title"));
        inquiryVo.setSend(request.getParameter("send"));
        inquiryVo.setRecept("관리자");
        inquiryVo.setCategory(Integer.parseInt(request.getParameter("category")));

        inquiryService.writeinquiry(inquiryVo);

        return "inquiryWrite";
    }

    @GetMapping("inquirylistForm")  // /inquirylistForm?num=1
    public String inquirylistForm(@RequestParam int num, Model model) {

        page.setNum(num);
        page.setCount(inquiryService.allcount());

        model.addAttribute("page", page);
        model.addAttribute("select", num);
        model.addAttribute("num", num);

        return "inquirylist";
    }

    @GetMapping("/alllist")  // ajax용
    @ResponseBody
    public List<JSONObject> alllist(@RequestParam int num) {

        int postnum = page.getPostnum();
        int displaypost = page.getDisplaypost();

        List<JSONObject> NoteVoList = new ArrayList<>();
        for (InquiryVo vo : inquiryService.alllist(displaypost, postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("content", vo.getContent());
            obj.put("category", vo.getCategory());
            obj.put("send", vo.getSend());
            obj.put("time", vo.getTime());


            NoteVoList.add(obj);
        }
        return NoteVoList;
    }

    @GetMapping("/caselist")  // /caselist?num=1&category=         ajax용
    @ResponseBody
    public List<JSONObject> caselist(@RequestParam int num, @RequestParam int category ,Model model) {

        page.setNum(num);
        page.setCount(inquiryService.casecount(category));

        model.addAttribute("page", page);
        model.addAttribute("select", num);
        model.addAttribute("num", num);

        int postnum = page.getPostnum();
        int displaypost = page.getDisplaypost();

        List<JSONObject> NoteVoList = new ArrayList<>();
        for (InquiryVo vo : inquiryService.caselist(category, displaypost, postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("content", vo.getContent());
            obj.put("category", vo.getCategory());
            obj.put("send", vo.getSend());
            obj.put("time", vo.getTime());
            System.out.println(obj);

            NoteVoList.add(obj);
            System.out.println(NoteVoList);
        }

        return NoteVoList;

    }
}