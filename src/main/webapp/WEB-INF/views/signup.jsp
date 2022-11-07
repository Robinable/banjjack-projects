<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*     { box-sizing:border-box;  }
	
	.sign-upForm { width:600px; margin:0 auto; }

	.sign-upForm input {
       
       border:1px solid grey;
       border-radius:5px;

       padding: 10px;
       margin:5px;
       
    }

	div  { text-align: center; }
    
    td { width:200px; }
    
    #container { width:100% }
    
    #form1 { width:100%; }
    
    hr          { width:400px; margin-bottom:70px; }

     #uploadImage {
          width: 128px;
          height: 128px;
          background-color: grey;
        }
    


</style>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
    window.onload = function() {
        const form = document.querySelector('form');
        // 회원가입 유효성 검사
        form.addEventListener('submit', function(e) {
            if(username.value == '') {
                checkError.innerHTML = '아이디를 입력하세요';
                username.focus();
                e.preventDefault();

            } else if (userpassword.value == '') {
                checkError.innerHTML = '비밀번호를 입력하세요';
                userpassword.focus();
                e.preventDefault();

            } else if (repasswd.value == '') {
                checkError.innerHTML = '비밀번호 확인을 입력하세요';
                repasswd.focus();
                e.preventDefault();

            } else if (usernickname.value == '') {
                checkError.innerHTML = '닉네임을 입력하세요';
                usernickname.focus();
                e.preventDefault();
            }

        });


        //id에 길이가 1이상이고
        //비활성화 되어 있다면
        //id체크로직을 한번 돌린다

        $('#username').on('change', function() {
        const username = document.getElementById('username').value.length;
        if(username >= 2) {
            idCheck(document.getElementById('username').value)
        } else {
             $('#unameCheck').text('아이디는 2자 이상 20자 이내로 입력해주세요');
        }
        });

        $('#usernickname').on('change', function() {
        const usernickname = document.getElementById('usernickname').value.length;
        if(usernickname >= 2) {
           nicknameCheck(document.getElementById('usernickname').value)
        } else {
            $('#unicknameCheck').text('아이디는 2자 이상 15자 이내로 입력해주세요');
        }
        });

        $('#userpassword').on('change', function() {
        const userpassword = document.getElementById('userpassword').value.length;
        if(userpassword >= 2) {
            passwordCheck(document.getElementById('userpassword').value)
        } else {
            $('#pwCheck').text('비밀번호는 2자 이상 20자 이내로 입력해주세요.');
        }
        });

        $('#repasswd').on('change', function() {
        const repasswd     = document.getElementById('repasswd').value;
        if(repasswd == $('#userpassword').val()) {
            $('#re_pwCheck').text('비밀번호가 일치합니다');
        } else {
            $('#re_pwCheck').text('비밀번호가 일치하지 않습니다.');
        }
        })


        const profile_img = document.getElementById('profile_img');
        const uploadImage = document.getElementById('uploadImage');

        uploadImage.addEventListener('click', () => profile_img.click());
        profile_img.addEventListener('change', getImageFiles);

} // window.onload end

	// 아이디 중복확인 ajax
    function idCheck(username) {
        //아이디체크 ajax 해보자 아장자ㅏ!
        $.ajax({
            url: '/getUser?username=' + username, // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            method: 'GET'                        // HTTP 요청 메소드(GET, POST 등)
        })
        // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
        .done(function(count) {
            if(count==0){
                const nameVaildation = /^[a-z0-9_-]{2,21}$/g;   // 아이디: 영문과 숫자 조합으로만
                if(nameVaildation.test(username.trim())) {
                    $('#unameCheck').text('사용가능한 아이디입니다.');
                } else {
                    $('#unameCheck').text('아이디는 영문 소문자와 숫자의 조합으로 입력해주세요');
                }
            }else{
                $('#unameCheck').text('이미 존재하는 아이디입니다.');
            }
        })
        // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
        .fail(function(xhr, status, errorThrown) {
            $('#unicknameCheck').text('입력이 실패하였습니다. 다시 시도해주세요.');
        });
    }
	
    // 닉네임 중복확인 ajax
    function nicknameCheck(usernickname) {
        $.ajax({
            url: '/getNickname?usernickname=' + usernickname,
            method: 'GET'
        })
        .done(function(count) {
            console.log(count);
            if(count==0) {
                const nicknameVaildation = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/g;        // 닉네임: 영문/숫자/한글 조합으로만
                if(nicknameVaildation.test(usernickname.trim())) {
                    $('#unicknameCheck').text('사용가능한 닉네임입니다.');
                } else {
                    $('#unicknameCheck').text('닉네임은 한글과 영문, 숫자의 조합으로 입력해주세요.');
                }
            } else {
                $('#unicknameCheck').text('이미 존재하는 닉네임입니다.');
            }
        })
        .fail(function(xhr, status, errorThrown) {
            $('#unicknameCheck').text('입력이 실패하였습니다. 다시 시도해주세요.');
        });
    }

    // 비밀번호 확인
    function passwordCheck(userpassword) {
        // 비밀번호 정규식
        // 비밀번호: 영문대소문자/숫자/특수문자 각각 한개 이상 조합
        const pwVaildation = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*[$@$!%*?&*-])[A-Za-z\d$@$!%*?&*-]{8,21}$/g;
        if(!pwVaildation.test(userpassword.trim())) {
            $('#pwCheck').text('비밀번호는 영문 대소문자와 숫자, 특수문자의 조합으로 입력해주세요.');
        } else {
            $('#pwCheck').text('');
        }
    }

     function getImageFiles(e) {
          const files = e.currentTarget.files;
          console.log(typeof files, files);
    }



</script>
</head>
<body>
	<div class="sign-upForm">
	<h2>회원가입</h2>
	<hr />
		<form action="/signup/register" method="POST" id="form1">
		  <table id="container">
		  	<tr>
                <td colspan="2">
                    <input type="text" id="username" name="username" placeholder="아이디" maxlength="20"><br>
                    <span id="unameCheck"></span>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="password" id="userpassword" name="userpassword" placeholder="비밀번호" maxlength="20"><br>
                    <span id="pwCheck"></span>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="password" id="repasswd" name="repasswd" placeholder="비밀번호 확인" maxlength="20"><br>
                    <span id="re_pwCheck"></span>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="text" id="usernickname" name="usernickname" placeholder="닉네임" maxlength="15"><br>
                    <span id="unicknameCheck"></span>
                </td>
            <tr>
                <td>
                    <input type="text" id="usersido" name="usersido" placeholder="지역(시/도)"/>
                    <input type="text" id="usergugun" name="usergugun" placeholder="지역(구/군/동/읍/면/리)"/>
                </td>
            </tr>
            <tr>
                <td>
                    <select id="userpet" name="userpet">
                        <option value="00">종류</option>
                        <option value="01">고양이</option>
                        <option value="02">개</option>
                        <option value="etc">기타</option>


                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type='file' id="profile_img" style="display:none;" accept='image/jpg,impge/png,image/jpeg' name='profile_img'/></td><br>
                    <div id="uploadImage"></div>
                </td>
            </tr>
            <tr>
                <td><span id="checkError"></span></td>
            </tr>
            <tr>
                <td><input type="submit" name="signup" value="가입하기"/></td>
            </tr>
		  </table>
		</form>

	</div>
</body>
</html>