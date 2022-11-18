<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
        *     { box-sizing:border-box;  }

        body  { text-align: center;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;}

        main {
            display: block;
        }

        .signupForm { width:600px; margin:0 auto; }

        .signupForm input, select {

            border:1px solid grey;
            border-radius:10px;

            padding: 10px;
            margin:5px;

        }

        div  { width: 100%; text-align: center; padding: 0;}


        .con { width:100% }

        #form1 { width:100%; }
        #signup { width: 30%; margin-top: 20px; border:1px solid;}

        hr  {  margin-bottom:70px; }

        .signuplabel { margin-top: 50px; }


</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
    window.onload = function() {
        const form = document.querySelector('form');
        // 회원가입 유효성 검사
        form.addEventListener('submit', function(e) {
            if(username.value == '') {
                e.preventDefault();
                alert('아이디를 입력해주세요.');
                username.focus();


            } else if (userpassword.value == '') {
                e.preventDefault();
                alert('비밀번호를 입력해주세요.');
                userpassword.focus();


            } else if (repasswd.value == '') {
                e.preventDefault();
                alert('비밀번호 확인을 입력해주세요.');
                repasswd.focus();


            } else if (usernickname.value == '') {
                e.preventDefault();
                alert('닉네임을 입력해주세요.');
                usernickname.focus();


            } else if(useremail.value == '') {
                e.preventDefault();
                alert('이메일을 입력해주세요.');
                useremail.focus();


            } else if(usersido.value == '') {
                e.preventDefault();
                alert('지역(시/도)를 입력해주세요.');
                usersido.focus();


            } else if(usergugun.value == '') {
                e.preventDefault();
                alert('지역(구/군/동/읍/면/리)를 입력해주세요.');
                usergugun.focus();

            } else if(userpet.value == '') {
                e.preventDefault();
                alert('반려동물을 입력해주세요.');
                selectPet.focus();

            } else if($('unameCheck').text() != '사용가능한 아이디입니다.') {
                e.preventDefault();
                alert('아이디 형식이 올바르지 않습니다.');
                $('#username').val('');
                username.focus();

            }else if($('unicknameCheck').text() != '사용가능한 닉네임입니다.') {
                e.preventDefault();
                alert('닉네임 형식 올바르지 않습니다.');
                $('#usernickname').val('');
                usernickname.focus();

            } else if($('pwCheck').text() != '') {
                e.preventDefault();
                alert('비밀번호 형식이 올바르지 않습니다.');
                $('#userpassword').val('');
                $('#repasswd').val('');
                userpassword.focus();

            } else if($('emailCheck').text() != '') {
                e.preventDefault();
                alert('이메일 형식이 올바르지 않습니다.');
                $('#useremail').val('');
                useremail.focus();

            } else {
                alert($('#usernickname').val() + '님 환영합니다!');
            }



        });


        $('#username').on('change keydown', function() {
            const username = document.getElementById('username').value.length;
            if(username >= 2) {
                idCheck(document.getElementById('username').value)
            } else if(username < 2 && username > 0) {
                $('#unameCheck').text('아이디는 2자 이상 20자 이내로 입력해주세요.').css('color', 'red').css('font-size', '14px');
            } else if(username == 0) {
                $('#unameCheck').text('');
            }
        });

        $('#usernickname').on('change keydown', function() {
            const usernickname = document.getElementById('usernickname').value.length;
            if(usernickname >= 2) {
                nicknameCheck(document.getElementById('usernickname').value)
            } else if(usernickname < 2 && usernickname > 0) {
                $('#unicknameCheck').text('아이디는 2자 이상 15자 이내로 입력해주세요.').css('color', 'red').css('font-size', '14px');
            } else if(usernickname == 0) {
                $('#unicknameCheck').text('');
            }
        });

        $('#userpassword').on('change keydown', function() {
            const userpassword = document.getElementById('userpassword').value.length;
            if(userpassword >= 2) {
                passwordCheck(document.getElementById('userpassword').value)
            } else if(userpassword < 2 && userpassword > 0) {
                $('#pwCheck').text('비밀번호는 2자 이상 20자 이내로 입력해주세요.').css('color', 'red').css('font-size', '14px');
            } else if(userpassword == 0) {
                $('#pwCheck').text('');
            }
        });



        $('#repasswd').on('change keydown', function() {
            const repasswd  = document.getElementById('repasswd').value;
            if(repasswd == $('#userpassword').val()) {
                $('#re_pwCheck').text('비밀번호가 일치합니다.').css('color', 'blue').css('font-size', '14px');
            } else {
                $('#re_pwCheck').text('비밀번호가 일치하지 않습니다.').css('color', 'red').css('font-size', '14px');
                $('#repasswd').val('');
                $('#repasswd').focus();
            }
        });

        $('#useremail').on('change keydown', function() {
            const useremail = document.getElementById('useremail').value.length;
            if(useremail >= 2) {
                emailCK(document.getElementById('useremail').value)
            } else if(useremail < 2 && useremail > 0) {
                $('#emailCheck').text('올바르지 않은 입력입니다. 다시 입력해주세요.').css('color', 'red').css('font-size', '14px');
            } else if(useremail == 0) {
                $('#emailCheck').text('');
            }
        });

        $('#userpet').attr('disabled', 'disabled');
        $('#userpet').attr('placeholder', 'ex) 사랑앵무(x), 앵무새(o)');

        // 콤보박스 > input text박스
        $('#selectPet').on('change', function(e) {

            if($('#selectPet').val() == '기타') {
                $('#userpet').attr('value', '');
                $('#userpet').removeAttr('disabled');
                $('#userpet').attr('placeholder', 'ex) 사랑앵무(x), 앵무새(o)');
            }

            if($('#selectPet').val() == '반려동물') {
                $('#userpet').attr('value', '');
                $('#userpet').attr('disabled', 'disabled');
                $('#userpet').attr('placeholder', 'ex) 사랑앵무(x), 앵무새(o)');
            }

            if($('#selectPet').val() == '개' || $('#selectPet').val() == '고양이') {
                $('#userpet').attr('placeholder', '');
                $('#userpet').removeAttr('disabled');
                $('#userpet').attr('value', $('#selectPet').val());

            }




        });

} // window.onload end

    // 아이디 중복확인 ajax
    function idCheck(username) {
        $.ajax({
            url: '/getUser?username=' + username, // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            method: 'GET'                        // HTTP 요청 메소드(GET, POST 등)
        })
            // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
            .done(function(count) {
                if(count==0){
                    const nameVaildation = /^[a-z0-9_-]{2,21}$/g;   // 아이디: 영문과 숫자 조합으로만
                    if(nameVaildation.test(username.trim())) {
                        $('#unameCheck').text('사용가능한 아이디입니다.').css('color', 'blue').css('font-size', '14px');
                    } else {
                        $('#unameCheck').text('아이디는 영문 소문자와 숫자의 조합으로 입력해주세요.').css('color', 'red').css('font-size', '14px');
                    }
                }else{
                    $('#unameCheck').text('이미 존재하는 아이디입니다.').css('color', 'red').css('font-size', '14px');
                }
            })
            // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
            .fail(function(xhr, status, errorThrown) {
                $('#unameCheck').text('입력이 실패하였습니다. 다시 시도해주세요.').css('color', 'red').css('font-size', '14px');
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
                        $('#unicknameCheck').text('사용가능한 닉네임입니다.').css('color', 'blue').css('font-size', '14px');
                    } else {
                        $('#unicknameCheck').text('닉네임은 한글과 영문, 숫자의 조합으로 입력해주세요.').css('color', 'red').css('font-size', '14px');
                    }
                } else {
                    $('#unicknameCheck').text('이미 존재하는 닉네임입니다.').css('color', 'red').css('font-size', '14px');
                }
            })
            .fail(function(xhr, status, errorThrown) {
                $('#unicknameCheck').text('입력이 실패하였습니다. 다시 시도해주세요.').css('color', 'red').css('font-size', '14px');
            });
    }

    // 비밀번호 확인
    function passwordCheck(userpassword) {
        // 비밀번호 정규식
        // 비밀번호: 영문대소문자/숫자/특수문자 각각 한개 이상 조합
        const pwVaildation = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*[$@$!%*?&*-])[A-Za-z\d$@$!%*?&*-]{8,21}$/g;
        if(!pwVaildation.test(userpassword.trim())) {
            $('#pwCheck').text('비밀번호는 영문 대소문자와 숫자, 특수문자의 조합으로 입력해주세요.').css('color', 'red').css('font-size', '14px');
        } else {
            $('#pwCheck').text('');
        }
    }

    // 이메일 확인
    function emailCK(useremail) {
        // 이메일 정규식
        const emailVaildation = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/g;
        if(!emailVaildation.test(useremail.trim())) {
            $('#emailCheck').text('잘못된 이메일 주소입니다. 다시 작성해주세요.').css('color', 'red').css('font-size', '14px');
        } else {
            $('#emailCheck').text('');
        }
    }

    // userpet 콤보박스 text에 옮겨적기
    function re_userpetPrint(selectPet) {
        let userpetText = selectPet.options[selectPet.selectedIndex].text;
        return userpetText;
    }



</script>
</head>
<body>
<main class="form-signin w-100 m-auto">
<div class="signupForm">
    <h2 class="signuplabel">회원가입</h2>
    <hr />
    <form action="/signup/register" method="POST" id="form1">
        <div class="con">
            <div>
                <div>
                    <input type="text" id="username" name="username" placeholder="아이디" maxlength="20"><br>
                    <span id="unameCheck"></span>
                </div>

                <div>
                    <input type="password" id="userpassword" name="userpassword" placeholder="비밀번호" maxlength="20"><br>
                    <span id="pwCheck"></span>
                </div>

                <div>
                    <input type="password" id="repasswd" name="repasswd" placeholder="비밀번호 확인" maxlength="20"><br>
                    <span id="re_pwCheck"></span>
                </div>

                <div>
                    <input type="text" id="usernickname" name="usernickname" placeholder="닉네임" maxlength="15"><br>
                    <span id="unicknameCheck"></span>
                </div>

                <div>
                    <input type="text" id="useremail" name="useremail" placeholder="E-mail"><br>
                    <span id="emailCheck"></span>
                </div>

                <div>
                    <input type="text" id="usersido" name="usersido" placeholder="지역(시/도)"/>
                    <input type="text" id="usergugun" name="usergugun" placeholder="지역(구/군/동/읍/면/리)"/>
                    <span id="localCheck"></span>
                </div>

                <div>
                    <select class="select" id="selectPet" name="selectPet">
                        <option value="반려동물" selected>반려동물</option>
                        <option value="고양이">고양이</option>
                        <option value="개">개</option>
                        <option value="기타">기타</option>
                    </select>
                    <input type="text" id="userpet" name="userpet" style="width:350px;" />
                    <span id="petCheck"></span>
                </div>

                <div><input type="submit" id="signup" name="signup" class="btn btn-primary" value="가입하기"/></div>
            </div>
        </div>
    </form>

</div>
</main>
</body>
</html>