<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <style>
        table             {margin:100px auto;}
        tr:nth-of-type(5) {text-align: right;}
        td                {padding:3px}
        td:nth-of-type(2) {width:50px;}
        td:nth-of-type(3) {width:180px;}
        input[type=text]  {border:1px solid; width:100%; height:30px; border-radius: 8px;}
        textarea          {width:700px; height:400px; resize:none; border-radius: 8px;}
        .rounded-pill     {background:#fdf100;}
        .left             { text-align:left !important;}
        .center           { text-align:center !important;}
        .right            { text-align:right !important;}
        .layer            { text-align: center; }
        .layer .content   { display: inline-block; }

    </style>
    <script>
        let query = window.location.search;
        let param = new URLSearchParams(query);
        let id = param.get('_id');
        window.onload = function(){
            UpdateSet();

        }
        function UpdateSet() {

            $.ajax({
                url: "/getCommunityUpdateForm?id="+id ,
                type: "get",
                data: {'_id' : id},
                dataType:"json",
                async:false,
                error: function (xhr) {

                },
                success: function (data) {

                    $.each(data, function( index, element) {
                        $('#tag').val(element.tag);
                        $('#title').val(element.title);
                        $('#content').val(element.content);
                    })

                }
            });
        }
        function fnWriteClick(){
            $.ajax({
                url: "/communityUpdate",
                type:"post",
                data:{
                    'content' : $('#content').val(),
                    'title' : $('#title').val(),
                    '_id' : id
                },
                dataType: 'json',

                error: function (xhr) {
                    alert("F");

                },
                success: function (data) {
                    var url = "<c:url value="/communityRead"/>";
                    url = url +"?_id="+id;
                    window.location.href = url;

                }
            })
        }
    </script>

</head>

<body>
<div class="container">
<div class="layer">
    <div class="btn-group layer" role="group" aria-label="Basic outlined example">
        <a  href="#" class="btn btn-outline-primary"> 인기글 </a>
        <a  href="/communityList?tag=0" class="btn btn-outline-primary"> 전체 </a>
        <a  href="/communityList?tag=1" class="btn btn-outline-primary"> 자유게시판 </a>
        <a  href="/communityList?tag=2" class="btn btn-outline-primary"> 반려자랑 </a>
        <a  href="/communityList?tag=3" class="btn btn-outline-primary"> 질문게시판 </a>
    </div>
</div>

<div type="hidden" id="username" value='${user.username}' />
<input type="hidden" id="readcount" value="0" />
<table>
    <tr>
        <td class="left" colspan="4">
            <h2>수정</h2>
        </td>
    </tr>
    <tr>
        <td>
            <input type="text"  id="title" maxLength="20" value="" />
        </td>
        <td class="right"> 태그 : </td>
        <td>
            <input type="text" id="tag" maxlength="20" value="">
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <textarea maxlength="500" id="content" value="" > </textarea>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <button class="btn btn-primary" id="writebutton" onClick="fnWriteClick()">수정</button>
        </td>
    </tr>




</table>
</div>
</body>
</html>