<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정</title>
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

        .findPasswdForm { width:600px; margin:0 auto; }

        .findPasswdForm input{

            border:1px solid grey;
            border-radius:10px;
            width: 40%;
            padding: 10px;
            margin:5px;

        }

        div  { width: 100%; text-align: center; padding: 0;}

        .con { width:100% }

        #form1 { width:100%; }
        #goPasswdUpdate { width: 15%; margin-top: 20px; border:1px solid;}

        hr  {  margin-bottom:70px; }

        .findPasswdlabel { margin-top: 50px; }

        .error { margin-top: 20px; text-align: center; margin-bottom: 20px;}

        .label1 { margin-bottom: 20px;}


    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
        window.onload = function() {
            const form = document.querySelector('form');

            form.addEventListener('submit', function(e) {
                const username = document.getElementById('username');
                const useremail = document.getElementById('useremail');

                if(username.value == '') {
                    e.preventDefault();
                    alert('아이디를 입력해주세요.');
                    username.focus();

                } else if(useremail.value == '') {
                    e.preventDefault();
                    alert('이메일을 입력해주세요.');
                    useremail.focus();

                }
            })


        } // window.load end




    </script>
</head>
<body>
<main class="form-signin w-100 m-auto">
    <div class="findPasswdForm">
        <h2 class="findPasswdlabel">비밀번호 찾기</h2>
        <hr />
        <form action="/findPasswdSuccess" method="POST" id="form1" name="form1">
            <div class="con">
                <div class="label1"><label>비밀번호를 찾을 아이디와 이메일을 입력해주세요!</label></div>
                <div><input type="text" id="username" name="username" placeholder="아이디"/></div>
                <div><input type="text" id="useremail" name="useremail" placeholder="E-mail"/></div>
                <div>
                    <c:if test="${message == 'error'}">
                        <div class="error" style="color:red;"> 아이디 또는 이메일이 일치하지 않습니다. 다시 입력해주세요.</div>
                    </c:if>
                </div>
                <div><input type="submit" class="btn btn-primary" id="goPasswdUpdate" name="goPasswdUpdate" value="다음"/></div>
            </div>
        </form>
    </div>
</main>
</body>
</html>