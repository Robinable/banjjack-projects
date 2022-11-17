<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <style>
        *     { box-sizing:border-box;  }

        .loginform { width:600px; margin:0 auto; }

        .loginform input {

            border:1px solid grey;
            border-radius:5px;

            padding: 10px;
            margin:5px;

        }

        div  { text-align: center; padding: 0;}

        div:nth-child(n+5):nth-child(-n+7) { display: inline; }

        a { font-size: 13px; }

        #container { width:100% }

        #form1 { width:100%; }

        hr  {  margin-bottom:70px; }

        .loginlabel { margin-top: 50px; }


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
<body>
<div class="loginform">
    <h2 class="loginlabel">로그인</h2>
    <hr />
    <form action="/login/loginCheck" method="POST" id="form1" name="form1">
        <table id="con">
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
                    <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
                </c:if>
            </div>


            <div colspan="2">
                <input type="submit" id="login" name="login" value="로그인"/>
            </div>


            <div><a href="/signup" id="gosignup" name="gosignup">회원가입</a></div>
            <div><a href="/findIdForm" id="findId" name="findId" >아이디 찾기</a></div>
            <div><a href="/findPasswordForm" id="findPasswd" name="findPasswd">비밀번호 찾기</a></div>

        </table>
    </form>
</div>
</body>

</html>