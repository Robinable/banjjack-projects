<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  메뉴목록  -->
<link rel="stylesheet" href="/css/header.css">
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
        <div>${user.userpassword}</div>
        <div class="login-button">
            <div class="bell">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
                    <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
                </svg>
                <div class="bell-circle">
                    <svg xmlns="http://www.w3.org/2000/svg" width="8" height="8" fill="currentColor" class="bi bi-circle-fill" viewBox="0 0 16 16">
                        <circle style="fill: red;" cx="8" cy="8" r="8"/>
                    </svg>
                </div>
            </div>
            <button>로그인</button>
        </div>
    </div>
</div>