package com.green.controller;

import com.green.service.NoticeService;
import com.green.vo.*;
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
public class NoticeController {
    @Autowired private NoticeService noticeService;

    // 공지사항 리스트
    PageVo page = new PageVo();
    @GetMapping("/noticeList") // /noticeList?num=1
    public String noticeList(@RequestParam(required = false, defaultValue = "1") int num, Model model){

        page.setNum(num);
        page.setCount(noticeService.noticecount());

        model.addAttribute("page",page);
        model.addAttribute("select", num);
        model.addAttribute("num", num);

        return "/noticelist";
    }

    @GetMapping("/getnoticelist") // 공지사항리스트 ajax용
    @ResponseBody
    public List<JSONObject> getnoticelist(@RequestParam int num){

        int postnum = page.getPostnum();
        int displaypost = page.getDisplaypost();

        List<JSONObject> NoticeVoList = new ArrayList<>();
        for (NoticeVo vo : noticeService.noticelist(displaypost,postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("writer", vo.getWriter());
            obj.put("time", vo.getTime());
            obj.put("readcount", vo.getReadcount());

            NoticeVoList.add(obj);
        }
        return NoticeVoList;
    }

    @GetMapping("/noticecontform")  // 게시글 내용, 조회수
    public String noticecontform( @RequestParam int _id, Model model){
        noticeService.cntup(_id);
        model.addAttribute("_id",_id);

        return "/noticecont";
    }

    @GetMapping("/getnoticecont")  // 게시글 내용 ajax용
    @ResponseBody
    public List<JSONObject> getnoticecont(@RequestParam int _id){

        List<JSONObject> NoticeVoList = new ArrayList<>();
        NoticeVo vo = noticeService.selectCont(_id);

        JSONObject obj = new JSONObject();
        obj.put("_id", vo.get_id());
        obj.put("title", vo.getTitle());
        obj.put("writer", vo.getWriter());
        obj.put("time", vo.getTime());
        obj.put("content", vo.getContent());


        NoticeVoList.add(obj);

        return NoticeVoList;
    }

    @GetMapping("/writenoticeForm")  //공지사항 쓰기
    public String writeinquiryForm() {

        return "/writenoticeForm";
    }
    @PostMapping("/writenotice")
    public String writenotice(HttpServletRequest request) {

        NoticeVo noticeVo = new NoticeVo();
        noticeVo.setContent(request.getParameter("content"));
        noticeVo.setTitle(request.getParameter("title"));
        noticeVo.setWriter(request.getParameter("writer"));

        noticeService.writenotice(noticeVo);

        return "redirect:/noticeList";
    }

    @GetMapping("/noticeupdateForm")
    public String noticeupdateForm(@RequestParam int _id, Model model){
        model.addAttribute("_id",_id);

        return "/noticeupdateForm";
    }

    @PostMapping("/noticeupdate")
    public String noticeupdate(HttpServletRequest request) {

        NoticeVo noticeVo = new NoticeVo();
        noticeVo.setContent(request.getParameter("content"));
        noticeVo.setTitle(request.getParameter("title"));
        noticeVo.set_id(Integer.parseInt(request.getParameter("_id")));


        noticeService.noticeupdate(noticeVo);

        return "redirect:/noticeList";

    }
}


