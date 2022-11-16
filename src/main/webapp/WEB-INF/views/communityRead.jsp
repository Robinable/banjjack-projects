<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


    <style>
       table, th, td {
          border : 1px solid  #c0c0c0;
          border-collapse : collapse;
       }
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
                        $('#tag').text(element.tag);
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
<table>
  <tr>
    <td id="tag">tag:</td>
  </tr>
  <tr>
    <td> 제목 </td>
    <td colspan="5"> <span id="title">title:</span> </td>
  </tr>
  <tr>
    <td> 작성자 </td>
    <td> <span id="username">username:</span> </td>
    <td> 조회수 </td>
    <td> <span id="readcount">readcount:</span> </td>
    <td> 작성일 </td>
    <td> <span id="time">time:</span> </td>
  </tr>
  <tr>
    <td> 내용 </td>
    <td colspan="5"> <div id="content">content:</div> </td>
  </tr>
</table>

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