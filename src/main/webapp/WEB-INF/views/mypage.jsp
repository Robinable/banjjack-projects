<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	*     { box-sizing:border-box;  }
	
	.myPageForm { width:600px; margin:0 auto; }

	.myPageForm input {
       
       border:1px solid grey;
       border-radius:5px;

       padding: 10px;
       margin:5px;
       
    }

	div  { text-align: center; padding: 0;}

    ul { list-style: none; }

    #container { width:100% }

    #form1 { width:100%; }

    hr          { width:400px; margin-bottom:70px; }

    #preview { width: 128px; height: 128px; }




</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
    window.onload = function() {
        const form = document.querySelector('form');
        form.addEventListener('submit', function(e) {

        });

        $('#btnUpload').click(function (e) {
            $('#profile_img').click();
        });


} // window.onload end


    //
    function readURL(input) {
        if(input.files && input.files[0]) {
            let reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    }


</script>
</head>
<body>
	<div class="myPageForm">
	<h2>회원가입</h2>
	<hr />
		<form action="/myPageSuccess" method="POST" id="form1">
		  <div id="container">
            <ul>
                <li>
                    <input type='file' id="profile_img" accept=".jpg, .png, .jpeg" name="profile_img" onchange="readURL(this);"
                            style="display: none;"/></li><br>
                    <button type="button" id="btnUpload">업로드</button>
                    <img id="preview" />
                </li>
                <li>
                    <input type="text" id="username" name="username" placeholder="아이디" maxlength="20" readonly><br>
                    <span id="unameCheck"></span>
                </li>
                <li>
                    <input type="text" id="usernickname" name="usernickname" placeholder="닉네임" maxlength="15"><br>
                    <span id="unicknameCheck"></span>
                </li>

                <li>
                    <input type="text" id="useremail" name="useremail" placeholder="E-mail"><br>
                    <span id="emailCheck"></span>
                </li>
                <li>
                    <input type="text" id="usersido" name="usersido" placeholder="지역(시/도)"/>
                    <input type="text" id="usergugun" name="usergugun" placeholder="지역(구/군/동/읍/면/리)"/>
                    <span id="localCheck"></span>
                </li>
                <li>
                    <select id="selectPet" name="selectPet">
                        <option value="반려동물" selected>반려동물</option>
                        <option value="고양이">고양이</option>
                        <option value="개">개</option>
                        <option value="기타">기타</option>
                    </select>
                    <input type="text" id="userpet" name="userpet" value=""/>
                    <span id="petCheck"></span>
                </li>

                <li><input type="submit" id="signup" name="signup" value="수정"/></li>
                <li><a href="/" id="cancleUpdate" name="cancleUpdate"/>취소</a></li>
            </ul>
         </div>
		</form>

	</div>
</body>
</html>