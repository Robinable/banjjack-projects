<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판</title>

    <style>

    </style>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
        let query = window.location.search;
        let param = new URLSearchParams(query);
        let id= param.get('_id');

        window.onload = function(){
            $.ajax({
                url: '/getCommunityRead',
                data: {
                    _id : id
                },
                type: "get",
                error: function (xhr) {
                },
                success: function (data) {
                    let str="";
                    $.each(data, function(index, element)
                    {
                        $('#_id').text(element._id);
                        $('#username').text(element.username);
                        $('#title').text(element.title);
                        $('#time').text(element.time);
                        $('#readcount').text(element.readcount);
                        $('#content').text(element.content);
                    })

                }
            })
        }
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
    </script>
    <%@ include file="header.jsp"%>
</head>
<body>
<div id="view">
    <span id="_id">_id:</span>
    <span id="username">username:</span>
    <span id="title">title:</span>
    <span id="time">time:</span>
    <span id="readcount">readcount:</span>
    <div id="content">content:</div>

</div>
<button id="edit" onClick="fnEdit($('id'))"> 수정 </button>
<button id="delete" onClick="fnDelete($('id'))"> 삭제 </button>
</body>

</body>

</html>