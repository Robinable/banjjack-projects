<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*     { box-sizing:border-box;  }
	
	login-form { width:600px; margin:0 auto; }

	login-form input {
       
       border:1px solid grey;
       border-radius:5px;
       width: 50%;
       padding: 10px;
       margin:5px;
       
    }
    
	div  {
            text-align: center;
       }
    
    li { width:200px; }
    
    #table1 { width:100% }
    
    #form1 { width:100%; }

   
    input[name="signup"]:hover {
    	
    	background-color:#1E90FF;
    
    }
    input[name="signup"]:active {
    	
    	background-color:#4169E1;
    
    }
    
	input[name="signup"] { 
    
    	background-color:#87cefa;
    	border:0px;
    	
     }
    
    input:focus { border-color:#0000CD; outline:none;}
    
    hr          { width:400px; margin-bottom:70px; }
    
    span { font-size:15px; text-align:left; }

</style>
<script>
	

	window.onload = function() {
		const userid     = document.querySelector('[name=userid]');
		const passwd     = document.querySelector('[name=passwd]');
		const repasswd   = document.querySelector('[name=username_chk]');
		const username   = document.querySelector('[name=username]');
		const uidCheck   = document.getElementById('uidCheck');
		const pwCheck    = document.getElementById('pwCheck');
		const re_pwCheck = document.getElementById('re_pwCheck');
		const unameCheck = document.getElementById('unameCheck');
		
	 	// 정규식
	 	// id : 글자 수 제한(2~20), 영문&숫자
	 	// pw : 글자 수 제한(8~16), 영문&숫자,특수문자
		const idVaildation = /^[a-z0-9_-]{2,20}$/g;
		const pwVaildation = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/g;
		const form = document.querySelector('form');

		
		form.addEventListener('submit', function(e) {
		})
	
		// id
		userid.addEventListener('change', function() {
			if(!idVaildation.test(userid.value)) {
				uidCheck.innerHTML = '잘못된 입력입니다';
				userid.focus();
				return false;
			} else {
				uidCheck.innerHTML = '';
			} 
			return true;
		});
		
		passwd.addEventListener('change', function() {
			if(!pwVaildation.test(passwd.value)) {
				pwCheck.innerHTML = ''
			}
		})
	
		
	
	
	
	
	
	}
	


</script>
</head>
<body>
	<div class="sign-upForm">
	<h2>회원가입</h2>
	<hr />
		<form action="sign-upProcess" method="POST" id="form1">
		  <table id="table1">
		  	
			  	<li>
					<input type="text" id="userid" name="userid" placeholder="아이디" maxlength="20"><br>
					<span id="uidCheck"></span>
				</li>
			
			
				<li><input type="password" name="passwd" placeholder="비밀번호" maxlength="20">
					<span id="pwCheck"></span>
				</li>
			
			
				<li><input type="text" name="username_chk" placeholder="비밀번호 확인" maxlength="20">
					<span id="re_pwCheck"></span>
				</li>
			
			
				<li><input type="text" name="username" placeholder="닉네임" maxlength="15">
					<span id="unameCheck"></span>
				</li>
			
			
				<li><input type="submit" name="signup" value="가입하기"></li>
			
		  </table>
		</form>
	</div>
</body>
</html>