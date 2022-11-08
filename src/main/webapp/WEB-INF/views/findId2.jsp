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

        hr          { width:400px; margin-bottom:70px; }


</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	window.onload = function() {
       const form = document.querySelector('form');

       form.addEventListener('submit', function(e) {
            const useremail = document.getElementById('useremail').value;
            console.log(useremail);
            if(useremail == '') {
                $('#useremailCheck').text('이메일을 입력하세요');
                useremail.focus();
                e.prevenliefault();
            }
       });


	} // window.load end

    function

</script>


</head>
<body>
	<div class="login-form">
		<form action="/loginFindSuccess" method="POST" id="form1" name="form1">
			<ul id="container">
			    <li><label>아이디찾기</label></li>
			    <hr />
			    <li><label>가입하신 이메일을 입력해주세요.</label></li>
                <li>
                    <input type="text" id="useremail" name="useremail"/>
                    <span id="useremailCheck"></span>
                    ${username}

                </li>



                <li><a href="/findPasswordForm" id="findPassword" name="findPassword" >비밀번호찾기</a></li>
                <li><input type="submit" id="findId" name="findId"/></li>


            </ul>
		</form>
	</div>
</body>

</html>