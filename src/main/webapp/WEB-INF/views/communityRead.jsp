<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판</title>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <style>

        td                {padding:2px}
        td:nth-of-type(1) {width:75px;}
        td:nth-of-type(2) {width:70px;}
        #content          {height:500px; width:700px;  text-align:left; vertical-align:top; padding: 10px;}
        .left             { text-align:left !important;}
        .center           { text-align:center !important;}
        .right            { text-align:right !important;}
        .rounded-pill     {background:#fdf100;}
        .title            {border-bottom: 1pt solid black;}

        .layer            { text-align: center; }
        .layer .content   { display: inline-block; }

        .buttons{width:60px;height:30px}
    </style>

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
                    console.log(xhr);
                },
                success: function (data) {
                    console.log(data);
                    $.each(data, function(index, element)
                    {
                        $('#_id').text(element._id);
                        $('#tag').text(element.tag);
                        $('#usernickname').text(element.usernickname);
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
                    +"<button class =\"buttons btn btn-primary btn-sm\" id=\"edit\" onClick=\"fnEdit($('id'))\"> 수정 </button>"
                    +"<button class = \"buttons btn btn-primary btn-sm\" id=\"delete\" onClick=\"fnDelete($('id'))\"> 삭제 </button>"
            }
            document.getElementById("UDButton").innerHTML += str2;
        }
    </script>
</head>
<body style="background-color: white">
<div class="container">
    <div class="layer">
        <div class="btn-group layer" role="group" aria-label="Basic outlined example">
            <a  href="#" class="btn btn-outline-primary"> 인기글 </a>
            <a  href="/communityList?tag=0" class="btn btn-outline-primary"> 전체 </a>
            <a  href="/communityList?tag=1" class="btn btn-outline-primary"> 자유게시판 </a>
            <a  href="/communityList?tag=2" class="btn btn-outline-primary">반려자랑 </a>
            <a  href="/communityList?tag=3" class="btn btn-outline-primary"> 질문게시판 </a>
        </div>
    </div>

    <div id="view" class="layer">
        <table class="content">
            <tr>
                <td id="tag" class="rounded-pill center">tag:</td>
            </tr>
            <tr>
                <td colspan="6" class="left border-bottom"> <h2> <span id="title" >title:</span> </h2> </td>
            </tr>
            <tr>
                <td class="right border-bottom bg"> 작성자 : </td>
                <td class="left border-bottom bg"> <span id="usernickname">usernickname:</span> </td>
                <td class="right border-bottom bg"> 조회수 : </td>
                <td class="left border-bottom bg"> <span id="readcount">readcount:</span> </td>
                <td class="right border-bottom bg"> 작성일 : </td>
                <td class="left border-bottom bg"> <span id="time">time:</span> </td>
            </tr>
            <tr>
                <td colspan="6" class="border-bottom"> <div id="content">content:</div> </td>
            </tr>
            <tr>
                <td colspan="6" class="right">
                    <span id="UDButton"></span>
                    <button class="btn btn-primary btn-sm" id="goList" onClick="location.href='/communityList'"  >목록</button>
                </td>
            </tr>
        </table>

    </div>
</body>

<c:import url="/comment" >
    <c:param name="content_id" value="${id}"/>
    <c:param name="menu_id" value="1"/>
</c:import>
</div>
</body>

</html>