<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 비밀번호 변경</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <style>
        *     { box-sizing:border-box;  }

        body  { text-align: center;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;}

        main {
            display: block;
        }

        .mypagePasswdForm { width:600px; margin:0 auto; }

        .mypagePasswdForm input{

            border:1px solid grey;
            border-radius:10px;
            width: 40%;
            padding: 10px;
            margin:5px;

        }

        div  { width: 100%; text-align: center; padding: 0;}

        a { font-size: 13px; }

        .con { width:100% }

        #form1 { width:100%; }

        #pwOK { width: 15%; margin-top: 20px; border:1px solid;}

        hr  {  margin-bottom:70px; }

        .mypagePasswdlabel { margin-top: 50px; }

        .error { margin-top: 20px; text-align: center; margin-bottom: 20px;}



    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
        window.onload = function() {
            const form = document.querySelector('form');

            form.addEventListener('submit', function(e) {
                const now_userpassword = document.getElementById('now_userpassword');
                const userpassword     = document.getElementById('userpassword');
                const re_userpassword  = document.getElementById('re_userpassword');

                if(now_userpassword.value == '') {
                    e.preventDefault();
                    alert('현재 비밀번호를 입력해주세요.');
                    now_userpassword.value = '';

                } else if(userpassword.value == '') {
                    e.preventDefault();
                    alert('새 비밀번호를 입력해주세요.');
                    userpassword.value = '';

                } else if(repasswd.value == '') {
                    e.preventDefault();
                    alert('새 비밀번호 확인을 입력해주세요.');
                    repasswd.value = '';

                } else if(userpassword.value != repasswd.value) {
                    e.preventDefault();
                    alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
                    $('#repasswd').val('');
                    $('#repasswd').focus();

                } else if($('#pwCheck').text() != '') {
                    e.preventDefault()
                    alert('비밀번호 형식이 올바르지 않습니다.');
                    $('#userpassword').val('');
                    $('#repasswd').val('');
                    $('#userpassword').focus();

                } else if((${user.userpassword}) == now_userpassword.value) {
                    alert('비밀번호가 정상적으로 변경되었습니다.');
                }

            });

            // 비밀번호 확인
            $('#userpassword').on('change keydown', function() {
                const userpassword = document.getElementById('userpassword').value.length;
                if(userpassword >= 2) {
                    passwordCheck(document.getElementById('userpassword').value)
                } else if(userpassword < 2 && userpassword > 0) {
                    $('#pwCheck').text('비밀번호는 2자 이상 20자 이내로 입력해주세요.').css('color', 'red').css('font-size', '14px');
                } else if(userpassword == 0) {
                    $('#pwCheck').text('');
                }
            });


        } // window.load end



    // 비밀번호 유효성 검사
    function passwordCheck(userpassword) {
        // 비밀번호 정규식
        // 비밀번호: 영문대소문자/숫자/특수문자 각각 한개 이상 조합
        const pwVaildation = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*[$@$!%*?&*-])[A-Za-z\d$@$!%*?&*-]{8,21}$/g;
        if(!pwVaildation.test(userpassword.trim())) {
            $('#pwCheck').text('비밀번호는 영문 대소문자와 숫자, 특수문자의 조합으로 입력해주세요.').css('color', 'red').css('font-size', '14px');
        } else {
            $('#pwCheck').text('');
        }
    }


</script>
</head>
<body>
<div class="mypagePasswdForm">
<h2 class="mypagePasswdlabel">비밀번호 변경</h2>
<hr />
    <form action="/mypagePasswdUpdate" method="POST" id="form1" name="form1">
        <div class="con">
            <div><input type="hidden" id="username" name="username" value="${user.username}"/></div>
            <div><input type="password" id="now_userpassword" name="now_userpassword" placeholder="현재 비밀번호"/></div>
            <div>
                <input type="password" id="userpassword" name="userpassword" placeholder="새 비밀번호"/><br>
                <span id="pwCheck"></span>
            </div>
            <div>
                <input type="password" id="repasswd" name="repasswd" placeholder="새 비밀번호 확인"/><br>
                <span id="re_pwCheck"></span>
            </div>
            <div>
                <c:if test="${message == 'error'}">
                    <div class="error" style="color:red;">잘못된 비밀번호입니다. 다시 입력해주세요.</div>
                </c:if>
            </div>
            <div><input type="submit" class="btn btn-primary" id="pwOK" name="pwOK" value="변경"/></div>

        </div>
    </form>
</div>
</body>
</html>