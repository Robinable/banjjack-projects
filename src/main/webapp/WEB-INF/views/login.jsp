<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
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

        .loginform { width:600px; margin:0 auto; }

        .loginform input {

            border:1px solid grey;
            border-radius:10px;

            padding: 10px;
            margin:5px;

        }

        div  { width: 100%; text-align: center; padding: 0;}


        a { text-decoration: none; font-size: 16px; }

        .con { width:100% }

        #form1 { width:100%; }
        #login { width: 20%; border:1px solid;}

        hr  {  margin-bottom:70px; }

        .loginlabel { margin-top: 50px; }

        .a-tag { margin-top: 30px; }

        .btn-login { margin-top: 20px; }

        .error { margin-top: 20px; text-align: center; }

    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
        window.onload = function() {
            const form = document.querySelector('form');

            form.addEventListener('submit', function(e) {
                const username = document.getElementById('username');
                console.log(username);
                if($('#username').val() == '') {
                    e.preventDefault();
                    alert('아이디를 입력해주세요.');
                    username.focus();


                } else if (userpassword.value == '') {
                    e.preventDefault();
                    alert('비밀번호를 입력해주세요.');
                    userpassword.focus();

                }

            });


        } // window.load end




    </script>


</head>
<body class="box-align">
<main class="form-login w-100 m-auto">
    <div class="loginform">
        <h2 class="loginlabel">로그인</h2>
        <hr />
        <form action="/login/loginCheck" method="POST" id="form1" name="form1">
            <div class="con">
                <div>
                    <input type="text" id="username" name="username" placeholder="아이디" maxlength="20"><br>
                    <span id="unameCheck"></span>
                </div>

                <div>
                    <input type="password" id="userpassword" name="userpassword" placeholder="비밀번호" maxlength="20"><br>
                    <span id="pwCheck"></span>
                </div>

                <div>
                    <c:if test="${message == 'error'}">
                        <div class="error" style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
                    </c:if>
                </div>


                <div class="btn-login">
                    <input type="submit" class="btn btn-primary" id="login" name="login" value="로그인"/>
                </div>



                <div class="a-tag">
                    <a href="/signup" id="gosignup">회원가입</a>
                    <span>⏐</span>
                    <a href="/findIdForm" id="findId">아이디 찾기</a>
                    <span>⏐</span>
                    <a href="/findPasswordForm" id="findPasswd">비밀번호 찾기</a>
                </div>
            </div>
        </form>
    </div>
</main>
</body>

</html>