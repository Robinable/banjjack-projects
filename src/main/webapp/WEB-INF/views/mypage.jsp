<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <%@ include file="/WEB-INF/views/header.jsp"%>

    <style>
        *     { box-sizing:border-box;  }

        body  { text-align: center;
            align-items: center;
            padding-bottom: 40px;
            background-color: #f5f5f5;}

        main {
            display: block;
        }

        .myPageForm { width:600px; margin:0 auto; }

        .img { margin-bottom: 3px; }

        button {

            font-size: 14px;
            border: 1px solid grey;
            border-radius: 5px;
            padding: 5px;
            margin-top: -1px;
            margin-bottom: 10px;


        }

        .myPageForm select {
            border: 1px solid grey;
            border-radius: 5px;
            padding: 5px;
            margin: 5px;
        }

        .myPageForm input {

            border: 1px solid grey;
            border-radius: 5px;

            padding: 10px;
            margin: 5px;

        }


        div  { width: 100%; text-align: center; padding: 0;}


        a { text-decoration: none; font-size: 16px; }

        div:nth-child(n+10):nth-child(-n+14) { display: inline; }

        .con { width:100% }

        #form1 { width:100%; }
        input { width: 50%; }

        #btnUpdate { border: 1px solid; margin-top: 20px; margin-bottom: 30px; width: 20%; }

        hr  { margin-bottom:70px;  }


        .mypagelabel { margin-top: 20px; }


        #preview { width: 150px; height: 150px; border-radius: 40px;}

        .myPageForm label { margin: 0 auto; text-align: center; padding: 10px; }

        .myPageForm #usergugun { margin-left: 57px; }

        .myPageForm #username { margin-left: 20px; }

        .myPageForm #userpet { margin-left: -10px; width: 300px; margin-right: 41px; }

        .myPageForm #selectPet { height: 46px; }

        .myPageForm .idlavel { margin-left: 8px; margin-right: -10px;}




    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>

        window.onload = function() {
            const form = document.querySelector('form');
            const text = $('unicknameCheck').text('');
            form.addEventListener('submit', function(e) {
                if(usernickname.value == '') {
                    e.preventDefault();
                    alert('닉네임을 입력해주세요.');
                    usernickname.focus();

                }else if(usersido.value == '') {
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
                    userpet.focus();

                } else if($('#unicknameCheck').text() != '사용가능한 닉네임입니다.' && $('#unicknameCheck').text().length != 0 && usernickname.value > 2) {
                    console.log( $('#unicknameCheck').text().length);
                    e.preventDefault();
                    alert('닉네임 형식이 올바르지 않습니다.');
                    usernickname.value = '';
                    usernickname.focus();

                } else {
                    let result = confirm('회원정보를 수정하시겠습니까?');
                    if(result == true) {
                        alert('회원수정이 완료되었습니다.');
                    } else {
                        e.preventDefault();
                        location.reload();
                    }

                }


            }) // form event end


            // 이미지 업로드 버튼 이벤트 (이미지 미리보기)
            $('#btnUpload').click(function (e) {
                $('#profile_img').click();
            });


            $('usernickname').on('')

            $('#usernickname').on('change keyup', function() {
                const usernickname = document.getElementById('usernickname').value.length;
                if(usernickname >= 2) {
                    nicknameCheck(document.getElementById('usernickname').value)
                } else if(usernickname < 2 && usernickname > 0) {
                    $('#unicknameCheck').text('아이디는 2자 이상 15자 이내로 입력해주세요.').css('color', 'red').css('font-size', '14px');
                } else if(usernickname == 0) {
                    $('#unicknameCheck').text('');
                }
            });


            $('#userpet').attr('readonly', 'readonly');
            $('#userpet').attr('placeholder', 'ex) 사랑앵무(x), 앵무새(o)');

            // 콤보박스 > input text박스
            $('#selectPet').on('change', function(e) {

                if($('#selectPet').val() == '기타') {
                    $('#userpet').attr('value', '');
                    $('#userpet').removeAttr('readonly');
                    $('#userpet').attr('placeholder', 'ex) 사랑앵무(x), 앵무새(o)');
                }

                if($('#selectPet').val() == '반려동물') {
                    $('#userpet').attr('value', '${user.userpet}');
                    $('#userpet').attr('readonly', 'readonly');
                    $('#userpet').attr('placeholder', 'ex) 사랑앵무(x), 앵무새(o)');
                }

                if($('#selectPet').val() == '개' || $('#selectPet').val() == '고양이') {
                    $('#userpet').attr('placeholder', '');
                    $('#userpet').removeAttr('readonly');
                    $('#userpet').attr('value', $('#selectPet').val());

                }


            })
        }// window.onload end


        function nicknameCheck(usernickname) {
            $.ajax({
                url: '/getNickname?usernickname=' + usernickname,
                method: 'GET'
            })
                .done(function(count) {
                    console.log(count);
                    if(count==0) {
                        const nicknameVaildation = /^(?=.*[A-Za-z0-9가-힣])[A-Za-z0-9가-힣]{2,16}$/g;        // 닉네임: 영문/숫자/한글 조합으로만
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


        // userpet 콤보박스 text에 옮겨적기
        function re_userpetPrint(selectPet) {
            let userpetText = selectPet.options[selectPet.selectedIndex].text;
            console.log(userpetText);
            return userpetText;
        }

        function readURL(input) {
            let fileName;
            let fileSrc;
            console.log(input.files[0]);

            if(input.files && input.files[0]) {
                let reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('preview').src = e.target.result;
                    fileName = input.files[0].name;
                    fileSrc  = e.target.result;
                    convertContent(fileName, fileSrc);

                };

                reader.readAsDataURL(input.files[0]);

            } else {
                document.getElementById('preview').src = "";
            }
        }
        function convertContent(name, content){
            let imgcount = content.split('data:image/').length -1;
            let str = content.split(";base64,");
            let imgjson = new Object();
            imgjson.extension = str[0].split("image/")[1];
            imgjson.base64 = str[1];
            imgjson.name = name;

            return sendFile(JSON.stringify(imgjson));
        }

        function sendFile(imgjson){
            $.ajax({
                type: "post",
                url: "/uploadimg",
                data: imgjson,
                async: false,
                headers: {
                    'Accept': '*/*',
                    'Content-Type': 'application/json'
                },
                success : function (data){
                    //console.log(data);
                    result = data;
                    console.log("결과 = " + result);
                    return result;

                },
                error : function(e){
                    console.log("post.js오류!!" + e);
                }
            });
        }


        $.ajax({
            method: "get",
            url:  "/userprofileImg?username=${user.username}",
            success : function (data){
                result = data;
                console.log("결과 = " + result);
                let html = "";
                if(result == '') {
                    html = '<img id="preview" src="/img/icon_unknownUser.png"/>'
                    $('#test').html(html);
                } else {
                    html = '<img id="preview" src="http://donipop.com:8000/img/' + result + '"/>'
                    $('#test').html(html);
                }
            },
            error : function(e){
                //이미지가 없어서 에러가 떳으니 기본 이미지로 대체
                let html = '<img id="preview" src="/img/icon_unknownUser.png"/>'
                $('#test').html(html);
                console.log("post.js오류!!333" + e)
            }
        });


    </script>
</head>
<body>
<main class="form-signin w-100 m-auto">
    <div class="myPageForm">
        <h2 class="mypagelabel">마이페이지</h2>
        <hr />
        <form action="/myPageSuccess" method="POST" id="form1" enctype="multipart/form-data" attribute>
            <div class="con">
                <span id="test"></span>
                <div>
                    <input type='file' class="img" id="profile_img" accept=".jpg, .png, .jpeg" name="profile_img" onchange="readURL(this);"
                           style="display: none;"/></div><br>
                <button type="button" id="btnUpload">업로드</button>
                <div>
                    <label class="idlavel">ID</label>
                    <input type="text" id="username" name="username" placeholder="아이디" value="${user.username}" readonly><br>
                    <span id="unameCheck"></span>
                </div>
                <div>
                    <label>이름</label>
                    <input type="text" id="usernickname" name="usernickname" placeholder="닉네임" maxlength="15" value="${user.usernickname}"><br>
                    <span id="unicknameCheck"></span>
                </div>
                <div>
                    <label>지역</label>
                    <input type="text" id="usersido" name="usersido" placeholder="지역(시/도)" value="${user.usersido}"/>
                    <input type="text" id="usergugun" name="usergugun" placeholder="지역(구/군/동/읍/면/리)" value="${user.usergugun}"/>
                    <span id="localCheck"></span>
                </div>
                <div>
                    <select id="selectPet" name="selectPet" >
                        <option value="반려동물" selected>반려동물</option>
                        <option value="고양이">고양이</option>
                        <option value="개">개</option>
                        <option value="기타">기타</option>
                    </select>
                    <input type="text" id="userpet" name="userpet" value="${user.userpet}" placeholder=""/>
                    <span id="petCheck"></span>
                </div>

                <div><input type="submit"  class="btn btn-primary" id="btnUpdate" name="btnUpdate" value="수정"/></div>
                <div><a href="/" id="cancleUpdate">취소</a></div>
                <div><span>⏐</span></div>
                <div><a href="/myPagePasswdForm" id="goMyPagePasswd">비밀번호변경</a></div>
                <div><span>⏐</span></div>
                <div><a href="/leaveUserForm" id="goLeave">회원탈퇴</a></div>
            </div>
        </form>
    </div>
</main>
</body>
</html>