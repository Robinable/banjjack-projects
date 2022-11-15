<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        *     { box-sizing:border-box;  }

        .login-form { width:600px; margin:0 auto; }

        .login-form input {

            border:1px solid grey;
            border-radius:5px;

            padding: 10px;
            margin:5px;

        }

        div  { text-align: center; padding: 0;}

        ul { list-style: none; }

        li:nth-child(n+6):nth-child(-n+7) { display: inline; }

        a { font-size: 13px; }

        #container { width:100% }

        #form1 { width:100%; }

        hr  { width:400px; margin-bottom:70px; }


    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
        window.onload = function() {
            const form = document.querySelector('form');

            form.addEventListener('submit', function(e) {
                const userpassword = document.getElementById('userpassword');
                const re_userpassword = document.getElementById('re_userpassword');

                if(userpassword.value == '') {
                    e.preventDefault();
                    alert('새 비밀번호를 입력해주세요.');
                    userpassword.focus();


                } else if(re_userpassword.value == '') {
                    e.preventDefault();
                    alert('새 비밀번호 확인을 입력해주세요.');
                    re_userpassword.focus();


                } else if(userpassword.value != re_userpassword.value) {
                    e.preventDefault();
                    alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
                    $('#re_userpassword').val('');
                    $('#re_userpassword').focus();

                } else {
                    alert('비밀번호가 정상적으로 변경되었습니다.');
                }

            });

            $('#userpassword').on('change', function() {
                const userpassword = document.getElementById('userpassword').value.length;
                if(userpassword >= 2) {
                    passwordCheck(document.getElementById('userpassword').value)
                } else {
                    $('#pwCheck').text('비밀번호는 2자 이상 20자 이내로 입력해주세요.');
                }
            });




        } // window.load end

    // 비밀번호 확인
    function passwordCheck(userpassword) {
        // 비밀번호 정규식
        // 비밀번호: 영문대소문자/숫자/특수문자 각각 한개 이상 조합
        const pwVaildation = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*[$@$!%*?&*-])[A-Za-z\d$@$!%*?&*-]{8,21}$/g;
        if(!pwVaildation.test(userpassword.trim())) {
            $('#pwCheck').text('비밀번호는 영문 대소문자와 숫자, 특수문자의 조합으로 입력해주세요.');
        } else {
            $('#pwCheck').text('');
        }
    }


    </script>


</head>
<body>
<div class="login-form">
    <form action="/passwdUpdateSuccess" method="POST" id="form1" name="form1">
        <ul id="container">
            <li><label>비밀번호 재설정</label></li>
            <hr />
            <li><label>비밀번호를 변경해주세요.</label></li>
            <li><label>아이디: ${username}</label></li>
            <li><input type="hidden" id="username" name="username" value="${username}"/></li>
            <li>
                <input type="password" id="userpassword" name="userpassword" placeholder="새 비밀번호"/><br>
                <span id="pwCheck"></span>
            </li>
            <li>
                <input type="password" id="repasswd" name="repasswd" placeholder="새 비밀번호 확인"/><br>
                <span id="re_pwCheck"></span>
            </li>

            <li><input type="submit" id="pwOK" name="pwOK" value="확인"/></li>


        </ul>
    </form>
</div>
</body>
</html>