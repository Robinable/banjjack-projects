<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판</title>

    <style>
    .buttons{width:60px;height:30px}
    </style>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
        let readquery = window.location.search;
        let readparam = new URLSearchParams(readquery);
        let id= readparam.get('_id');
        let uname= "이리오너라아아아아아";
        $(document).ready(function(){
            $.ajax({
                url: '/getCommunityRead',
                data: {
                    _id : id
                },
                type: "get",
                error: function (xhr) {
                },
                success: function (data) {
                    $.each(data, function(index, element)
                    {
                        $('#_id').text(element._id);
                        $('#username').text(element.username);
                        $('#title').text(element.title);
                        $('#time').text(element.time);
                        $('#readcount').text(element.readcount);
                        $('#content').text(element.content);
                        uname = element.username
                        fnUDButtonshow()
                    })
                }
            })
        })
        function fnEdit(){
            var url = "<c:url value="/communityUpdateForm"/>";
            url = url +"?_id="+id;
            window.location.href = url;
        }

        function fnDelete(){
            $.ajax({
                url:'/communityDelete',
                type:'post',
                dataType:'json',
                data:{
                    '_id' : id
                },
                error: function (xhr) {


                },
                success: function (data) {

                    location.href = "/communityList"
                }


            })
        }
        function fnUDButtonshow(){
            let   str2=""
            if (uname==="${user.username}") {
                str2=str2
                    +"<button class =\"buttons\" id=\"edit\" onClick=\"fnEdit($('id'))\"> 수정 </button>"
                    +"<button class = \"buttons\" id=\"delete\" onClick=\"fnDelete($('id'))\"> 삭제 </button>"
            }
            document.getElementById("UDButton").innerHTML += str2;
        }
    </script>
    <%@ include file="header.jsp"%>
</head>
<body style="background-color: white">
<div id="view">
    <span id="_id">_id:</span>
    <span id="username">username:</span>
    <span id="title">title:</span>
    <span id="time">time:</span>
    <span id="readcount">readcount:</span>
    <div id="content">content:</div>

</div>
<div id="UDButton"></div>
<button class=\"buttons"\ id="goList" onClick="location.href='/communityList'" >목록</button>
</body>

<c:import url="/comment" >
    <c:param name="content_id" value="${id}"/>
    <c:param name="menu_id" value="1"/>
</c:import>
</body>

</html>