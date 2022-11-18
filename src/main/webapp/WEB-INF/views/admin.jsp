<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>관리자 페이지</title>


    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- sockJS -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1>관리자 페이지</h1>
            </div>
            <div class="col-6">
                    <div class="form-label">받는사람 아이디</div>
                    <input id="responusername" type="text" class="form-control">
            </div>
            <div class="col-6 pb-3">
                <div class="form-label">내용</div>
                <input id="responcontentvalue" type="text" class="form-control">
            </div>
            <button id="msgBtn" type="button" class="btn btn-secondary justify-content-center">보내기</button>
        </div>
    </div>

    <script>
        let socket  = null;
        window.onload = function(){
            sock = new SockJS("http://localhost:8080/ws/");
            socket = sock;

            $('#msgBtn').click(function(){
                let responUserName = document.getElementById('responusername').value;
                let responContent = document.getElementById('responcontentvalue').value;

                // 데이터 보내기
                sockSend(responUserName,responContent);
            })

        
                // 웹소켓 연결
                
            }

        function sockSend(username, content){
            let type='message';
            socket.send(type + ',' + username + ',' + content);
        }
    </script>
</body>
</html>