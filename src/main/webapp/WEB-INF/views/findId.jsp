<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
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

        .findIdForm { width:600px; margin:0 auto; }

        .findIdForm input{

            border:1px solid grey;
            border-radius:10px;
            width: 40%;
            padding: 10px;
            margin:5px;

        }

        div  { width: 100%; text-align: center; padding: 0;}

        a { text-decoration: none; font-size: 16px; }

        .con { width:100% }

        #form1 { width:100%; }
        #searchID { width: 15%; margin-top: 20px; border:1px solid; margin-bottom: 20px;}

        hr  {  margin-bottom:70px; }

        .findIdlabel { margin-top: 50px; }

        .error { margin-top: 20px; text-align: center; margin-bottom: 20px;}

        .span1 { margin-top: 15px; margin-bottom: 15px;}


    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
        window.onload = function() {
            const form = document.querySelector('form');

            form.addEventListener('submit', function(e) {
                const useremail = document.getElementById('useremail');

                if(useremail.value == '') {
                    e.preventDefault();
                    alert('이메일을 입력해주세요.');
                    useremail.focus();
                }

            });


            $('#useremailCheck').html('아이디: ${username}').css('font-size', '18px');


    } // window.load end

</script>


</head>
<body>
<main class="form-signin w-100 m-auto">
<div class="findIdForm">
    <h2 class="findIdlabel">아이디 찾기</h2>
    <hr />
    <form action="/findIdSuccess" method="POST" id="form1" name="form1">
        <div class="con">
            <div><label>가입하신 이메일을 입력해주세요!</label></div>
            <div class="span1"><span id="useremailCheck"></span></div>
            <div><input type="text" id="useremail" name="useremail"/></div>
            <div><input type="submit" class="btn btn-primary" id="searchID" name="searchID" value="검색"/></div>
            <div>
                <c:if test="${message == 'error'}">
                    <div class="error" style="color:red;">잘못된 입력입니다. 다시 입력해주세요.</div>
                </c:if>
            </div>
            <div>
                <a href="/findPasswordForm" id="findPassword">비밀번호찾기</a>
                <a href="/login" id="goLogin">로그인</a>
            </div>

        </div>
    </form>
</div>
</main>
</body>
</html>