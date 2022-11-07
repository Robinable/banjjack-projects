<!-- <%@ include file="/WEB-INF/include/menus.jsp" %>--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="/resources/css/header.css">
    <script src="/resources/js/header.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>타이틀</title>

    <script type="text/javascript">
        window.onload = function(){
            $(".bell").click(function(){
            $('.bell > .notice > ul > li').toggle();
        });
        }
        
    </script>
</head>
<body>
<!--  메뉴목록  -->
<div class="menubar">
    <div class="logo">
        <img src="/resources/img/iconmonstr-cat-7-240.png">
        <div class="logo-font">반짝</div>
    </div>
    <div class="menu-list">
        <div>새소식</div>
        <div>반짝찾기</div>
        <div>커뮤니티</div>
        <div>정보</div>
        <div>고객센터</div>
        <div class="bell">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
            </svg>
            <div class="bell-circle">
                <svg xmlns="http://www.w3.org/2000/svg" width="8" height="8" fill="currentColor" class="bi bi-circle-fill" viewBox="0 0 16 16">
                    <circle style="fill: red;" cx="8" cy="8" r="8"/>
                </svg>
            </div>
            <div class="notice">
                <ul>
                    <li><a href="http://naver.com">네이버</a></li>
                    <li>2번</li>
                    <li>3번</li>
                    <li>4번</li>
                    <li>5번</li>
                </ul>
            </div>
        </div>
        <div class="login-button">
            <button onclick="location.href='/login'">로그인</button>
        </div>
        
    </div>
</div>

</body>
</html>