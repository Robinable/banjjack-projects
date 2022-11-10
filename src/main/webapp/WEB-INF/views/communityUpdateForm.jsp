<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
        let query = window.location.search;
        let param = new URLSearchParams(query);
        let id = param.get('_id');
        window.onload = function(){
            UpdateSet();

        }
        function UpdateSet() {

            console.log(id);
            $.ajax({
                url: "/getCommunityUpdateForm?id="+id ,
                type: "get",
                data: {'_id' : id},
                dataType:"json",
                async:false,
                error: function (xhr) {
                    console.log("error html = " + xhr.statusText);
                    alert("F");

                },
                success: function (data) {
                    console.log(data);

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
                    console.log("error html = " + xhr.statusText);
                    alert("F");

                },
                success: function (data) {
                    alert("s")
                    console.log(data);
                    var url = "<c:url value="/communityRead"/>";
                    url = url +"?_id="+id;
                    console.log(url);
                    window.location.href = url;

                }
            })
        }


    </script>
</head>

<body>
<div type="hidden" id="username" value='1234' />
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