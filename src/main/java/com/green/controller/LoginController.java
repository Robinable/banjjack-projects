package com.green.controller;

import com.green.service.LeaveUserService;
import com.green.service.ProfileService;
import com.green.service.UserService;
import com.green.vo.ProfileVo;
import com.green.vo.UserVo;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;


@Log
@Controller
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private ProfileService profileService;

    @Autowired
    private LeaveUserService leaveUserService;


    // 로그인창
    @RequestMapping("/login")
    public String login(HttpSession session) {
        if (session.getAttribute("login") != null) {
            return "redirect:/";
        }
        return "/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("login");
        return "redirect:/login";
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
                                     @RequestParam("userpassword") String userpassword,
                                     HttpSession session) {

        HashMap<String, String> map = new HashMap<>();
        map.put("username", username);
        map.put("userpassword", userpassword);

        userService.updatePassword(map);
        UserVo user = userService.getUserInfo(username);
        session.setAttribute("login", user);

        return "redirect:/login";
    }

    // 마이페이지창
    @GetMapping("/myPageForm")
    public String myPageForm() {


        return "/mypage";
    }

    // 마이페이지창에서 저장눌렀을 때
    @PostMapping("/myPageSuccess")
    public String myPage(@RequestParam(value="profile_img", required = false) MultipartFile file,
                         @RequestParam("username")     String username,
                         @RequestParam("usernickname") String usernickname,
                         @RequestParam("usersido")     String usersido,
                         @RequestParam("usergugun")    String usergugun,
                         @RequestParam("userpet")      String userpet,
                         HttpSession session,
                         Model model) throws IOException {

        String uploadDir = "/Users/lsj/Desktop/ggg/green-spring2/src/main/webapp/WEB-INF/resources/img/";

        if (!file.isEmpty()) {

            String filename = file.getOriginalFilename();

            // 확장자 앞에 . 점이 몇번째인지
            int dotCount = filename.length() - filename.replace(".", "").length(); //3
            // .을 기준으로 filename의 [dotCount]번째 = 확장자
            // fileDot = 확장자
            String fileDot = filename.split("\\.")[dotCount]; // jpg
            //d.fg.gh.jpg
            UUID uuid = UUID.randomUUID(); // 랜덤
            String userFilename = uuid + "_" + username + "_profile." + fileDot; // 파일 이름 지정
            //uuid_username_profile.jpg
            String fullPath =  uploadDir + userFilename;
            model.addAttribute("img", fullPath);

            file.transferTo(new File(fullPath));

            ProfileVo profileVo = new ProfileVo(0, userFilename);
            profileService.saveProfileImg(profileVo);

            String selectImg = profileService.selectImg(userFilename);
            System.out.println(selectImg);
            if(selectImg.contains(username)) {
                model.addAttribute("userProfileImg", selectImg);
            }


        }

        HashMap<String, Object> map = new HashMap<>();
        map.put("username", username);
        map.put("usernickname", usernickname);
        map.put("usersido", usersido);
        map.put("usergugun", usergugun);
        map.put("userpet", userpet);

        userService.mypageUsernicknameUpdate(map);
        userService.mypageUsersidoUpdate(map);
        userService.mypageUsergugunUpdate(map);
        userService.mypageUserpetUpdate(map);

        UserVo user = userService.getUserInfo(username);
        session.setAttribute("login", user);



        return "/mypage";
    }

    // 마이페이지 내비밀번호변경창
    @GetMapping("/myPagePasswdForm")
    public String myPagePasswdForm() {
        return "/mypagePasswd";
    }

    // 마이페이지 내비밀번호변경 저장 버튼 눌렀을 때
    @PostMapping("/mypagePasswdUpdate")
    public  String mypagePasswd(@RequestParam("username")     String username,
                                @RequestParam("now_userpassword") String now_userpassword,
                                @RequestParam("userpassword") String userpassword,
                                Model model,
                                HttpSession session) {

        String nowUserPasswd = userService.findNowPasswd(username);

        if(now_userpassword.equals(nowUserPasswd)) {
            HashMap<String, String> map = new HashMap<>();
            map.put("username", username);
            map.put("userpassword", userpassword);
            userService.updateNewPasswd(map);
            UserVo user = userService.getUserInfo(username);
            session.setAttribute("login", user);
            return "/mypage";

        } else {
            model.addAttribute("message", "error");
            return "/mypagePasswd";
        }


    }
    @GetMapping("/leaveUserForm")
    public String leaveUserForm() {
        return "/leaveUser";
    }

    @PostMapping("/leaveUserSuccess")
    public String leaveUser(@RequestParam("username") String username,
                            @RequestParam("userpassword") String userpassword,
                            HttpSession session,
                            Model model) throws Exception {
        // 비밀번호 일치 확인
        String loginCk = userService.loginPasswordCheck(username);
        System.out.println(loginCk);

        String returnURL = "";
        // 일치한다면
        if (userpassword.equals(loginCk)) {

            HashMap<String,String> map = new HashMap<>();
            map.put("username", username);
            map.put("userpassword", userpassword);

            // map으로 userVO를 불러와서 leaveUser에 insert
            UserVo userVo = userService.selectUserInfo(map);
            System.out.println(userVo);
           leaveUserService.insertLeaveUser(userVo);

            // 세션 초기화
            session.removeAttribute("login");
            userService.deleteUser(username);

            System.out.println(session.getAttribute("login"));
            returnURL = "redirect:/";



            // 일치하지 않으면
        } else {
            model.addAttribute("message", "error");
            returnURL = "/leaveUser";
        }
        return returnURL;

    }


}