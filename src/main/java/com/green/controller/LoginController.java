package com.green.controller;

import com.green.service.UserService;
import com.green.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
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
    public String insertInfo(@RequestParam("username") String username,         @RequestParam("userpassword") String userpassword,
                             @RequestParam("usernickname") String usernickname, @RequestParam("useremail") String useremail,
                             @RequestParam("usersido") String usersido,         @RequestParam("usergugun") String usergugun,
                             @RequestParam("userpet") String userpet) {
        UserVo userVo = new UserVo(0, username, userpassword, usernickname, useremail, usersido, usergugun, userpet);
        userService.insertInfo(userVo);
        System.out.println(userVo.toString());

        return "redirect:/";
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

    // 로그인 proccess
    @PostMapping("/login/loginCheck")
    public String loginCheck(@RequestParam("username") String username,
                             @RequestParam("userpassword") String userpassword,
                             HttpSession session,
                             Model model) {

        System.out.println(username);
        System.out.println(userpassword);
        String result = "";
        if(session.getAttribute("login") != null) {
            session.removeAttribute("login");
        }

        // 비밀번호 일치 확인
        String loginCk = userService.loginPasswordCheck(username);

        // 일치한다면
        if(loginCk.equals(userpassword)) {
            session.setAttribute("login", loginCk);
            UserVo userVo = userService.selectUserInfoByUsername(username);
            model.addAttribute("userVo", userVo);

            return "redirect:/";

        // 일치하지 않으면
        } else {
            model.addAttribute("message", "error");
            return "redirect:/login";
        }
    }


    @GetMapping("/findIdForm")
    public String findIdForm() {
        return "/findId";
    }

    @PostMapping("/findIdSuccess")
    public String findId(@RequestParam("useremail") String useremail, Model model) {

        String username = userService.findId(useremail);
        System.out.println(username);
        model.addAttribute("username", username);
        return "/findId";
    }


    @GetMapping("/findPasswordForm")
    public String findPasswordForm() {
        return "/findPasswd";
    }

    @PostMapping("/findPasswdSuccess")
    public String findPassword(@RequestParam("username") String username,
                               @RequestParam("useremail") String useremail,
                               Model model) {
        HashMap<String, String> map = new HashMap<>();
        map.put("username", username);
        map.put("useremail", useremail);
        String userpassword = userService.findPasswd(map);
        System.out.println(userpassword);
        model.addAttribute("username", username);
        return "/findPasswdUpdate";
    }

    @PostMapping("/passwdUpdateSuccess")
    public String findPasswordUpdate(@RequestParam("username") String username,
                                     @RequestParam("userpassword") String userpassword) {
        System.out.println(username);
        System.out.println(userpassword);

        HashMap<String,String> map = new HashMap<>();
        map.put("username", username);
        map.put("userpassword", userpassword);

        userService.updatePassword(map);
        return "redirect:/login";
    }

}