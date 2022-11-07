<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/index.css">
<meta charset="UTF-8">
<title>안녕</title>
</head>
<body>
유저정보는 <%= request.getAttribute("userVo") %>
</body>
</html>