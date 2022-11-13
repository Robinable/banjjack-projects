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
                }
            }); // form event end

            // 이미지 업로트 버튼 이벤트
            $('#btnUpload').click(function (e) {
                $('#profile_img').click();
            });

            $('#usernickname').on('change', function() {
                const usernickname = document.getElementById('usernickname').value.length;
                if(usernickname >= 2) {
                    nicknameCheck(document.getElementById('usernickname').value)
                } else {
                    $('#unicknameCheck').text('아이디는 2자 이상 15자 이내로 입력해주세요.');
                }
            });

            $('#selectPet').on('change', function() {
                if($('#selectPet').val() == '반려동물') {
                    $('#userpet').attr('placeholder', '반려동물의 종을 간단히 적으세요. ex) 사랑앵무(x), 사랑앵무(o)');
                } else {
                    $('#userpet').attr('value', re_userpetPrint(selectPet));
                }

            });



        } // window.onload end


        // 프로필 이미지 업로드
        function readURL(input) {
            console.log(input.files[0]);
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


        // userpet 콤보박스 text에 옮겨적기
        function re_userpetPrint(selectPet) {
            let userpetText = selectPet.options[selectPet.selectedIndex].text;
            console.log(userpetText);
            return userpetText;
        }



    </script>
</head>
<body>
<div class="myPageForm">
    <h2>내정보</h2>
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
                    <input type="text" id="username" name="username" placeholder="아이디" value="${sessionScope.login.username}" readonly><br>
                    <span id="unameCheck"></span>
                </li>
                <li>
                    <input type="text" id="usernickname" name="usernickname" placeholder="닉네임" maxlength="15" value="${sessionScope.login.usernickname}"><br>
                    <span id="unicknameCheck"></span>
                </li>
                <li>
                    <input type="text" id="usersido" name="usersido" placeholder="지역(시/도)" value="${sessionScope.login.usersido}"/>
                    <input type="text" id="usergugun" name="usergugun" placeholder="지역(구/군/동/읍/면/리)" value="${sessionScope.login.usergugun}"/>
                    <span id="localCheck"></span>
                </li>
                <li>
                    <select id="selectPet" name="selectPet" >
                        <option value="반려동물" selected>반려동물</option>
                        <option value="고양이">고양이</option>
                        <option value="개">개</option>
                        <option value="기타">기타</option>
                    </select>
                    <input type="text" id="userpet" name="userpet" value="${sessionScope.login.userpet}"/>
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