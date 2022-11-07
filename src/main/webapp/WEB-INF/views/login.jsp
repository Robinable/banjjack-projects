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


        div  {
                text-align: center;
           }

        td { width:100%; }

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
			<table id="container">
                <tr>
                    <td>
                        <input type="text" id="username" name="username" placeholder="아이디" maxlength="20"><br>
                        <span id="unameCheck"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="password" id="userpassword" name="userpassword" placeholder="비밀번호" maxlength="20"><br>
                        <span id="pwCheck"></span>
                    </td>
                </tr>
                <tr>
                    <td><span id="checkError"></span></td>
                </tr>
                <tr>
                    <td>
                        <c:if test="${message == 'error'}">
                        <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
                        </c:if>
                        <c:if test="${message == 'logout'}">
                        <div style="color:red;">로그아웃 되었습니다.</div>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" id="login" name="login" value="로그인"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><a href="/signup" id="gosignup" name="gosignup" font-size="13">회원가입</a></td>
                </tr>
            </table>
		</form>
	</div>
</body>

</html>