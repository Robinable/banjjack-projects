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
            const username = document.getElementById('username');
            const userpassword = document.getElementById('userpassword');

            if(username.value == '') {
                e.preventDefault();
                alert('아이디를 입력해주세요.');
                username.focus();


            } else if(userpassword.value == '') {
                e.preventDefault();
                alert('비밀번호를 입력해주세요.');
                userpassword.focus();

            } else {
                let result = confirm('탈퇴하시겠습니까?');
                if(result == true) {
                    alert('탈퇴가 정상적으로 처리되었습니다');
                } else {
                    location.reload();
                }
            }




        });



    } // window.load end

    </script>


</head>
<body>
<div class="login-form">
    <form action="/leaveUserSuccess" method="POST" id="form1" name="form1">
        <ul id="container">
            <li><label>회원탈퇴</label></li>
            <hr />
            <li><label>탈퇴는 신중하게 생각하세요!</label></li>
            <li>
                <input type="text" id="username" name="username" placeholder="아이디"/>
                <input type="password" id="userpassword" name="userpassword" placeholder="비밀번호"/><br>
                <span id="pwCheck"></span>
            </li>

            <li><span id="dataCheck"></span></li>

            <li>
                <c:if test="${message == 'error'}">
                    <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
                </c:if>
            </li>

            <li><input type="submit" id="pwOK" name="pwOK" value="탈퇴하기"/></li>


        </ul>
    </form>
</div>
</body>
</html>