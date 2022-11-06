<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	*     { box-sizing:border-box;  }

	.login-form { width:400px; margin:0 auto; }

	div   {
            text-align: center;
       }
       
    #container { width:100%; }
    #form1     { width:100%; }
        
    .login-form input{
       
       border:1px solid grey;
       border-radius:5px;
       width: 70%;
       padding: 10px;
       margin:5px;
       
    }
    
    input[name="login"]:hover { background-color:#1E90FF; }
    input[name="login"]:active { background-color:#4169E1; }
	input[name="login"] { background-color:#87CEFA; border:0px; }

    input:focus { border-color:#0000CD; outline:none;}
    
    hr { margin-bottom:70px; width:400px;}
    
     
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	window.onload = function() {

		form.addEventListener('submit', function(e) {
            const form = document.querySelector('form');
            const username = document.getElementById('username').value;
            const userpassword = document.getElementById('userpassword').value;
			if(username.value == '') {
				checkError.innerHTML = '아이디를 입력하세요';
				username.focus();
				e.preventDefault();
			}
			else if(userpassword.value == '') {
				checkError.innerHTML = '비밀번호를 입력하세요';
				userpassword.focus();
				e.preventDefault();
			}

			loginCheck(username, userpassword);

		})

	} // window.load end

    function loginCheck(username, userpassword) {
        let username     = $('#username').val();
        let userpassword = $('#userpassword').val();
        $.ajax({
            url: '/login/loginCheck?username=' + username + '&userpassword=' + userpassword,
            method: 'POST',
            data:{ username:username, userpassword:userpassword }
        })
        .done({
            function(result) {
                if(result == '성공') {
                    alert('환영합니다');
                }else {
                    alert('다시 시도해주십시오');
                }
            }
        });
    }

		
		
	



</script>


</head>
<body>
	<div class="login-form">
	<h2>로그인 페이지</h2>
	<hr />
		<form action="/login/loginCheck" method="POST" id="form1">
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
                    <td><input type="submit" name="login" value="로그인"/></td>
                </tr>
            </table>
		</form>
	</div>
</body>
</html>