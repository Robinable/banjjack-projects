<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
                    alert("s")
                    var url = "<c:url value="/communityRead"/>";
                    url = url +"?_id="+id;
                    window.location.href = url;

                }
            })
        }
    </script>
    <%@ include file="header.jsp"%>
</head>

<body>
<div type="hidden" id="username" value='${user.username}' />
<input type="hidden" id="readcount" value="0" />
<input type="text" id="tag" placeholder="태그" maxlength="20" value="">
<br>
<input type="text"  id="title" placeholder="제목"maxLength="20" value="" />
<br>
<textarea maxlength="500" id="content" placeholder="내용" value="" > </textarea>
<button id="writebutton" onClick="fnWriteClick()">수정</button>
</div>
</body>
</html>