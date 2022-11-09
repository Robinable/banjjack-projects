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
            const now_userpassword = document.getElementById('now_userpassword');
            const userpassword     = document.getElementById('userpassword');
            const re_userpassword  = document.getElementById('re_userpassword');

            if(now_userpassword.value == '') {
                alert('현재 비밀번호를 입력해주세요.');
                e.preventDefault();
                now_userpassword.value = '';

            } else if(userpassword.value == '') {
                alert('새 비밀번호를 입력해주세요.');
                e.preventDefault();
                userpassword.value = '';

            } else if(re_userpassword.value == '') {
                alert('새 비밀번호 확인을 입력해주세요.');
                e.preventDefault();
                re_userpassword.value = '';

            } else if(userpassword.value != re_userpassword.value) {
                e.preventDefault();
                $('#dataCheck').html('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
                $('#re_userpassword').val('');
                $('#re_userpassword').focus();
            }

            alert('비밀번호가 정상적으로 변경되었습니다.');
       })



	} // window.load end



</script>


</head>
<body>
	<div class="/mypagePasswd">
		<form action="/mypagePasswdUpdate" method="POST" id="form1" name="form1">
			<ul id="container">
			    <li><label>비밀번호 변경</label></li>
			    <hr />
                <li><input type="password" id="now_userpassword" name="now_userpassword" placeholder="현재 비밀번호"/></li>
                <li><input type="password" id="userpassword" name="userpassword" placeholder="새 비밀번호"/></li>
                <li><input type="password" id="re_userpassword" name="re_userpassword" placeholder="새 비밀번호 확인"/></li>
                <li><span id="dataCheck"></span></li>

                <li><input type="submit" id="pwOK" name="pwOK" value="변경"/></li>

           </ul>
		</form>
	</div>
</body>
</html>