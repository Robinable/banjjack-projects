<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.green.vo.UserVo" %>
<%@ page session="false" %>
<%
    HttpSession session = request.getSession();
    UserVo userVo = (UserVo) session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<script>
    let hide_username = $('#hide_username').val();
</script>
</head>
<body>

    <input type="hidden" id="hide_username" name="hide_username" value="<%= userVo.getUsername() %>"/>
    <input type="hidden" id="hide_userpassword" name="hide_userpassword" value=""/>
    <input type="hidden" id="hide_usernickname" name="hide_usernickname" value=""/>
    <input type="hidden" id="hide_useremail" name="hide_useremail" value=""/>
    <input type="hidden" id="hide_usersido" name="hide_usersido" value=""/>
    <input type="hidden" id="hide_usergugun" name="hide_usergugun" value=""/>
    <input type="hidden" id="hide_userpet" name="hide_userpet" value=""/>

</body>
</html>