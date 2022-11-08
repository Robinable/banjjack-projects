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
            const username = document.getElementById('username').value;
            const useremail = document.getElementById('useremail').value;

            if(username == '') {
                $('#dataCheck').text('아이디를 입력하세요.');
                username.focus();
                e.preventDefault();
            } else if(useremail == '') {
                $('#dataCheck').text('이메일을 입력하세요.');
                useremail.focus();
                e.preventDefault();
            }
       })


	} // window.load end


</script>


</head>
<body>
	<div class="login-form">
		<form action="/findPasswdUpdate" method="POST" id="form1" name="form1">
			<ul id="container">
			    <li><label>비밀번호 찾기</label></li>
			    <hr />
			    <li><label>비밀번호를 찾을 아이디와 이메일을 입력해주세요.</label></li>
                <li><input type="text" id="username" name="username" placeholder="아이디"/></li>
                <li><input type="text" id="useremail" name="useremail" placeholder="E-mail"/></li>
                <li><span id="dataCheck"></span></li>
                <li><input type="submit" id="goPasswdUpdate" name="goPasswdUpdate" value="다음"/></li>
           </ul>
		</form>
	</div>
</body>
</html>