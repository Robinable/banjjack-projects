package com.green.controller;

import com.green.service.InquiryService;
import com.green.vo.InquiryVo;
import com.green.vo.NoteVo;
import com.green.vo.PageVo;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class InquiryController {

    // 1:1문의
    @Autowired
    private InquiryService inquiryService;

    PageVo page = new PageVo();

    @GetMapping("/writeinquiryForm")
    public String writeinquiryForm(Model model, @RequestParam (required = false, defaultValue = "0") int bnum,
                                   @RequestParam (required = false, defaultValue = "0") int lvl ,
                                   @RequestParam (required = false, defaultValue = "0") int step , HttpSession session)  {

        if (session.getAttribute("login") == null) {
            return "redirect:/login";
        }else{
        model.addAttribute("bnum", bnum);
        model.addAttribute("lvl", lvl);
        model.addAttribute("step", step);

        return "inquiryWrite";
        }
    }

    @PostMapping("/writeinquiry")     // 1:1문의 쓰기
    public String writeinquiry(HttpServletRequest request) {


        InquiryVo inquiryVo = new InquiryVo();
        inquiryVo.setContent(request.getParameter("content"));
        inquiryVo.setTitle(request.getParameter("title"));
        inquiryVo.setSend(request.getParameter("send"));
        inquiryVo.setCategory(Integer.parseInt(request.getParameter("category")));
        inquiryVo.setBnum(Integer.parseInt(request.getParameter("bnum")));
        inquiryVo.setLvl(Integer.parseInt(request.getParameter("lvl")));
        inquiryVo.setStep(Integer.parseInt(request.getParameter("step")));
        inquiryVo.setRecept(request.getParameter("recept"));

        String sen = inquiryVo.getSend();
        String rec = inquiryVo.getRecept();
//        if(sen.equals(rec)){
//            inquiryVo.setRecept(request.getParameter("recept"));}
//        else{
//            inquiryVo.setRecept("관리자");
//        }
        inquiryService.writeinquiry(inquiryVo);

        return "redirect:/inquirymylistForm?send="+sen;
    }

    // 1대1 문의 리스트
    @GetMapping("/inquirylistForm")  // /inquirylistForm?num=1
    public String inquirylistForm(@RequestParam(required = false, defaultValue = "1") int num,
                                  Model model) {

        page.setNum(num);
        page.setCount(inquiryService.allcount());

        model.addAttribute("page", page);
        model.addAttribute("select", num);
        model.addAttribute("num", num);

        return "/inquirylist";
    }

    @GetMapping("/alllist")  // 1대1 문의 ajax용
    @ResponseBody
    public List<JSONObject> alllist(@RequestParam int num) {

        int postnum = page.getPostnum();
        int displaypost = page.getDisplaypost();

        List<JSONObject> InquiryVoList = new ArrayList<>();
        for (InquiryVo vo : inquiryService.alllist(displaypost, postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("content", vo.getContent());
            obj.put("category", vo.getCategory());
            obj.put("send", vo.getSend());
            obj.put("time", vo.getTime());


            InquiryVoList.add(obj);
        }
        return InquiryVoList;
    }

    @GetMapping("/caselist")  // /caselist?num=1&category=  카테고리별 리스트 ajax용
    @ResponseBody
    public List<JSONObject> caselist(@RequestParam(required = false, defaultValue = "1") int num, @RequestParam int category ,Model model) {

        page.setNum(num);
        page.setCount(inquiryService.casecount(category));

        model.addAttribute("page", page);
        model.addAttribute("select", num);
        model.addAttribute("num", num);

        int postnum = page.getPostnum();
        int displaypost = page.getDisplaypost();

        List<JSONObject> InquiryVoList = new ArrayList<>();
        for (InquiryVo vo : inquiryService.caselist(category, displaypost, postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("content", vo.getContent());
            obj.put("category", vo.getCategory());
            obj.put("send", vo.getSend());
            obj.put("time", vo.getTime());

            InquiryVoList.add(obj);

        }

        return InquiryVoList;

    }
    // 내가 쓴 1대1문의함
    @GetMapping("/inquirymylistForm")
    public String inquirymylistForm(@RequestParam(required = false, defaultValue = "1") int num, @RequestParam String send, Model model) {

        page.setNum(num);
        page.setCount(inquiryService.mylistcount(send));

        model.addAttribute("page", page);
        model.addAttribute("select", num);
        model.addAttribute("num", num);

        return "inquirymylistForm";
    }

    @GetMapping("/inquirymylist")  // ajax용
    @ResponseBody
    public List<JSONObject> inquirymylist(@RequestParam(required = false, defaultValue = "1") int num, @RequestParam String send ,Model model) {

        int postnum = page.getPostnum();
        int displaypost = page.getDisplaypost();

        List<JSONObject> InquiryVoList = new ArrayList<>();
        for (InquiryVo vo : inquiryService.inquirymylist(send, displaypost, postnum)) {
            JSONObject obj = new JSONObject();
            obj.put("_id", vo.get_id());
            obj.put("title", vo.getTitle());
            obj.put("content", vo.getContent());
            obj.put("category", vo.getCategory());
            obj.put("send", vo.getSend());
            obj.put("time", vo.getTime());
            obj.put("bnum", vo.getBnum());
            obj.put("lvl", vo.getLvl());
            obj.put("step", vo.getStep());

            InquiryVoList.add(obj);
        }
        return InquiryVoList;
    }

    // 내용확인
    @GetMapping("/inquirycont")
    public String inquirycont(@RequestParam int _id, Model model) {

        model.addAttribute("_id",_id);

        return "/inquiryCont";
    }

    @GetMapping("/getinquirycont")  // 내용확인 ajax용
    @ResponseBody
    public  List<JSONObject> getinquirycont(@RequestParam int _id) {
        List<JSONObject> InquiryVoList = new ArrayList<>();
        InquiryVo vo = inquiryService.selectCont(_id);
        JSONObject obj = new JSONObject();
        obj.put("_id", vo.get_id());
        obj.put("title", vo.getTitle());
        obj.put("content", vo.getContent());
        obj.put("recept", vo.getRecept());
        obj.put("send", vo.getSend());
        obj.put("time", vo.getTime());
        obj.put("category",vo.getCategory());
        obj.put("bnum",vo.getBnum());
        obj.put("lvl",vo.getLvl());
        obj.put("step",vo.getStep());
        InquiryVoList.add(obj);

        return InquiryVoList;
    }

    @GetMapping("/replyinquiryForm")
    public String replyinquiryForm(@RequestParam int _id, @RequestParam int bnum,
                                   @RequestParam int lvl, @RequestParam int step, Model model) {

        model.addAttribute("_id",_id);
        model.addAttribute("bnum", bnum);
        model.addAttribute("lvl", lvl);
        model.addAttribute("step", step);

        return "inquiryReply";
    }
    @GetMapping("/replyinquiry")  // 내용확인 ajax용
    @ResponseBody
    public  List<JSONObject> replyinquiry(@RequestParam int _id) {
        List<JSONObject> InquiryVoList = new ArrayList<>();
        InquiryVo vo = inquiryService.selectCont(_id);
        JSONObject obj = new JSONObject();
        obj.put("_id", vo.get_id());
        obj.put("title", vo.getTitle());
        obj.put("content", vo.getContent());
        obj.put("recept", vo.getRecept());
        obj.put("send", vo.getSend());
        obj.put("time", vo.getTime());
        obj.put("category",vo.getCategory());
        obj.put("bnum",vo.getBnum());
        obj.put("lvl",vo.getLvl());
        obj.put("step",vo.getStep());
        InquiryVoList.add(obj);

        return InquiryVoList;
    }


}