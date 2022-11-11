package com.green.controller;

import com.green.service.UserService;
import com.green.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    // 로그인창
    @RequestMapping("/login")
    public String login(HttpSession session) {
        if (session.getAttribute("login") != null) {
            return "redirect:/";
        }
        return "/login";
    }

    // 회원가입창
    @RequestMapping("/signup")
    public String signup() {
        return "/signup";
    }

    // 가입하기 버튼 눌렀을 때 (insert)
    @PostMapping("/signup/register")
    public String insertInfo(@RequestParam("username") String username, @RequestParam("userpassword") String userpassword,
                             @RequestParam("usernickname") String usernickname, @RequestParam("useremail") String useremail,
                             @RequestParam("usersido") String usersido, @RequestParam("usergugun") String usergugun,
                             @RequestParam("userpet") String userpet,
                             HttpSession session) {

        session.removeAttribute("login");

        UserVo userVo = new UserVo(0, username, userpassword, usernickname, useremail, usersido, usergugun, userpet);
        userService.insertInfo(userVo);

        return "redirect:/login";
    }

    // user 정보 가져오기
    // 아이디 중복확인 (ajax)
    @GetMapping("/getUser")
    @ResponseBody
    public int getuser(@RequestParam("username") String username) {
        int count = userService.usernameCheck(username);
        return count;
    }

    // 닉네임 중복확인 (ajax)
    @GetMapping("/getNickname")
    @ResponseBody
    public int getnickname(@RequestParam("usernickname") String usernickname) {
        int count = userService.nicknameCheck(usernickname);
        return count;
    }

    // 로그인 버튼 눌렀을 때
    @PostMapping("/login/loginCheck")
    public String loginCheck(@RequestParam("username") String username,
                             @RequestParam("userpassword") String userpassword,
                             HttpSession session,
                             HttpServletResponse response,
                             Model model) {

        String returnURL = "";

        // 기존 login 세션에 값이 있으면
//        if (session.getAttribute("login") != null) {
//            // 기존에 있던 값을 제거함
//            session.removeAttribute("login");
//        }

        // 비밀번호 일치 확인
        String loginCk = userService.loginPasswordCheck(username);

        // 일치한다면
        if (userpassword.equals(loginCk)) {
            HashMap<String,String> map = new HashMap<>();
            map.put("username", username);
            map.put("userpassword", userpassword);

            // 로그인 하려는 아이디와 비밀번호의 vo를 select해서 반환
            UserVo userVo = userService.selectUserInfo(map);

            // 반환한 vo가 있으면
            if(userVo != null) {
                // login 세션 생성 > vo 담아
                userVo.setUserpassword("0");
                session.setAttribute("login", userVo);


                // 로그인 성공
                returnURL = "redirect:/";
            } else {
                // 로그인 실패
                returnURL = "redirect:/login";
            }

            // 일치하지 않으면
        } else {
            model.addAttribute("message", "error");
            returnURL = "/login";
        }
        return returnURL;
    }

    // 아이디 찾기창
    @GetMapping("/findIdForm")
    public String findIdForm() {
        return "/findId";
    }

    // 아이디찾기 폼에서 검색 버튼 눌렀을 때
    @PostMapping("/findIdSuccess")
    public String findId(@RequestParam("useremail") String useremail, Model model) {
        String useremail2 = userService.findEmailByUseremail(useremail);
        // 불러온 이메일이 db 이메일과 일치한다면
        if (useremail.equals(useremail2)) {
            String username = userService.findId(useremail);
            System.out.println(username);
            model.addAttribute("username", username);
            return "/findId";

            // 일치하지 않으면
        } else {
            model.addAttribute("message", "error");
            return "/findId";
        }

    }

    // 비밀번호 찾기창
    @GetMapping("/findPasswordForm")
    public String findPasswordForm() {
        return "/findPasswd";
    }

    // 비밀번호 찾기창에서 다음 버튼 눌렀을 때
    @PostMapping("/findPasswdSuccess")
    public String findPassword(@RequestParam("username") String username,
                               @RequestParam("useremail") String useremail,
                               Model model) {
        String username2 = userService.selectUsername(useremail);
        String useremail2 = userService.selectUseremail(username);

        // 불러온 아이디와 이메일이 db 값과 일치한다면
        if (username.equals(username2) && useremail.equals(useremail2)) {
            HashMap<String, String> map = new HashMap<>();
            map.put("username", username2);
            map.put("useremail", useremail2);

            String userpassword = userService.findPasswd(map);

            model.addAttribute("username", username);

            return "/findPasswdUpdate";

            // 일치하지 않으면
        } else {
            System.out.println("여기");
            model.addAttribute("message", "error");
            return "/findPasswd";
        }
    }

    // findPassword의 다음 버튼이 성공적으로 처리 됐을 때 비밀번호 재설정창
    @PostMapping("/passwdUpdateSuccess")
    public String findPasswordUpdate(@RequestParam("username") String username,
                                     @RequestParam("userpassword") String userpassword) {

        HashMap<String, String> map = new HashMap<>();
        map.put("username", username);
        map.put("userpassword", userpassword);

        userService.updatePassword(map);

        return "redirect:/login";
    }

    // 마이페이지창
    @GetMapping("/myPageForm")
    public String myPageForm() {
        return "/mypage";
    }

    // 마이페이지창에서 저장눌렀을 때
    @PostMapping("/myPageSuccess")
    public String myPage(@RequestParam("username")     String username,
                         @RequestParam("usernickname") String usernickname,
                         @RequestParam("usersido")     String usersido,
                         @RequestParam("usergugun")    String usergugun) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("username", username);
        map.put("usernickname", usernickname);
        map.put("usersido", usersido);
        map.put("usergugun", usergugun);

        userService.mypageUsernicknameUpdate(map);
        userService.mypageUsersidoUpdate(map);
        userService.mypageUsergugunUpdate(map);



        return "/mypage";
    }

    // 마이페이지 내비밀번호변경창
    @GetMapping("/myPagePasswdForm")
    public String myPagePasswdForm() {
        return "/mypagePasswd";
    }

    // 마이페이지 내비밀번호변경 저장 버튼 눌렀을 때
    @PostMapping("/mypagePasswdUpdate")
    public  String mypagePasswd(@RequestParam("now_userpassword") String now_userpassword,
                                @RequestParam("userpassword") String userpassword,
                                Model model) {

        String nowUserPasswd = userService.findNowPasswd(now_userpassword);

        if(now_userpassword.equals(nowUserPasswd)) {
            HashMap<String, String> map = new HashMap<>();
            map.put("now_userpassword", now_userpassword);
            map.put("userpassword", userpassword);
            userService.updateNewPasswd(map);
            model.addAttribute("userpassword", userpassword);
            model.addAttribute("nowUserpassword", now_userpassword);
            return "/mypage";

        } else {
            model.addAttribute("message", "error");
            return "/mypagePasswd";
        }


    }

}