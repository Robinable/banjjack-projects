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

        li:nth-child(n+6):nth-child(-n+8) { display: inline; }

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
            console.log(username);
            if($('#username').val() == '') {
                $('#checkError').text('아이디를 입력하세요');
                username.focus();
                e.preventDefault();

            } else if (userpassword.value == '') {
                $('#checkError').text('비밀번호를 입력하세요');
                userpassword.focus();
                e.preventDefault();
            }

       });


	} // window.load end




</script>


</head>
<body>
	<div class="login-form">
	<h2>로그인 페이지</h2>
	<hr />
		<form action="/login/loginCheck" method="POST" id="form1" name="form1">
			<ul id="container">

                <li>
                    <input type="text" id="username" name="username" placeholder="아이디" maxlength="20"><br>
                    <span id="unameCheck"></span>
                </li>


                <li>
                    <input type="password" id="userpassword" name="userpassword" placeholder="비밀번호" maxlength="20"><br>
                    <span id="pwCheck"></span>
                </li>


                <li><span id="checkError"></span></li>


                <li>
                    <c:if test="${message == 'error'}">
                    <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
                    </c:if>
                    <c:if test="${message == 'logout'}">
                    <div style="color:red;">로그아웃 되었습니다.</div>
                    </c:if>
                </li>


                <li colspan="2">
                    <input type="submit" id="login" name="login" value="로그인"/>
                </li>


                <li><a href="/signup" id="gosignup" name="gosignup">회원가입</a></li>
                <li><a href="/findIdForm" id="findId" name="findId" >아이디 찾기</a></li>
                <li><a href="/findPasswordForm" id="findPasswd" name="findPasswd">비밀번호 찾기</a></li>

            </ul>
		</form>
	</div>
</body>

</html>