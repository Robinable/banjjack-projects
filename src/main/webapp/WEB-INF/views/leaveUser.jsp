<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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

    .leaveUserForm { width:600px; margin:0 auto; }

    .leaveUserForm input{

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

    .leaveUserlabel { margin-top: 50px; }

    .error { margin-top: 20px; text-align: center; margin-bottom: 20px;}

    .label1 { margin-bottom: 20px; }


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

            } else if((${user.username}) == username.value && (${user.userpassword}) == userpassword.value) {
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
<div class="leaveUserForm">
<h2 class="leaveUserlabel">회원탈퇴</h2>
<hr />
    <form action="/leaveUserSuccess" method="POST" id="form1" name="form1">
        <div class="con">
            <div class="label1"><label>탈퇴는 신중하게 생각하세요!</label></div>
            <div>
                <input type="text" id="username" name="username" placeholder="아이디"/>
                <input type="password" id="userpassword" name="userpassword" placeholder="비밀번호"/><br>
                <span id="pwCheck"></span>
            </div>

            <div>
                <c:if test="${message == 'error'}">
                    <div class="error" style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
                </c:if>
            </div>

            <div><input type="submit" class="btn btn-primary" id="pwOK" name="pwOK" value="탈퇴하기"/></div>


        </div>
    </form>
</div>
</body>
</html>