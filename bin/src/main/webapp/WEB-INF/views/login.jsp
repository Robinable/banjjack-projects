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
       
    #form1 { width:100%; }
        
    input{
       
       border:1px solid grey;
       border-radius:5px;
       width: 95%;
       padding: 10px;
       margin:5px;
       
    }
    
    input[name="login"]:hover {
    	
    	background-color:#1E90FF;
    
    }
    input[name="login"]:active {
    	
    	background-color:#4169E1;
    
    }
    
    input[name="login"] { 
    
    	background-color:#87cefa;
    	border:0px;
    	
     }
    input:focus { border-color:#0000CD; outline:none;}
    
    hr { margin-bottom:70px; }
    
     
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	window.onload = function() {
		const form = document.querySelector('form');
		form.addEventListener('submit', function(e) {
			const userid = document.querySelector('[name=userid]');
			const passwd = document.querySelector('[name=passwd]');
			if(userid.value == '') {
				alert('아이디를 입력하세요');
				e.prevenliefault();
				e.stopPropagation();
			}
			else if(passwd.value == '') {
				alert('비밀번호를 입력하세요');
				e.prevenliefault();
				e.stopPropagation();
			}
		})
	}
		
		
		
	



</script>


</head>
<body>
	<div class="login-form">
	<h2>로그인 페이지</h2>
	<hr />
		<form action="loginProcess" method="POST" id="form1">
			<input type="text" name="userid" placeholder="아이디"/>
			<span id="uid"></span>
			<input type="password" name="passwd" placeholder="비밀번호"/>
			<input type="submit" name="login" value="로그인"/>
		</form>
	</div>
</body>
</html>