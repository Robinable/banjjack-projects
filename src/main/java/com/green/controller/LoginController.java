package com.green.controller;

import com.green.service.UserService;
import com.green.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


@Controller
public class LoginController{

    @Autowired
    private UserService userService;


    @RequestMapping("/login")
    public String login() {
        return "/login";
    }


    @RequestMapping("/signup")
    public String signup() {
        return "/signup";
    }


    // 회원가입 (정보등록)
    @PostMapping("/signup/register")
    public String insertInfo(@RequestParam("username") String username, @RequestParam("userpassword") String userpassword,
                             @RequestParam("usernickname") String usernickname) {
        UserVo userVo = new UserVo(0, username, userpassword, usernickname);
        userService.insertInfo(userVo);
        System.out.println(userVo.toString());

        return "/signup";
    }

    // user 정보 가져오기
    // 아이디 중복확인
    @GetMapping("/getUser")
    @ResponseBody
    public int getuser(@RequestParam("username") String username) {
        System.out.println(username);
        int count = userService.usernameCheck(username);
        return count;
    }
    // 닉네임 중복확인
    @GetMapping("/getNickname")
    @ResponseBody
    public int getnickname(@RequestParam("usernickname") String usernickname) {
        System.out.println(usernickname);
        int count = userService.nicknameCheck(usernickname);
        return  count;
    }

    @PostMapping("/login/loginCheck")
    @ResponseBody
    public String loginCheck(@RequestParam("username") String username,
                             @RequestParam("userpassword") String userpassword,
                             HttpSession session) {


        String result = "";
        if(session.getAttribute("login") != null) {
            session.removeAttribute("login");
        }

        UserVo loginCk = userService.loginCk(username, userpassword);
        System.out.println(loginCk.toString());
        if(loginCk != null) {
            session.setAttribute("login", loginCk);
            result = "성공";
        } else {
            result = "실패";
        }
        return "result";
    }

}