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
        let id = param.get('_id');
        console.log(id);
        window.onload = function(){
            $.ajax({
                url: '/getCommunityRead?_id=1' ,
                method: "get",
                error: function (xhr) {
                    console.log("error html = " + xhr.statusText);
                },
                success: function (data) {
                    console.log(data);
                    let str="";
                    $.each(data, function(index, element)
                    {
                        str +=
                             '제목:' +element.title
                            +'번호:' + element._id
                            +'이름:' +element.username
                            + '내용:' +element.content
                            + '시간 :' +element.time
                            + '조회수:' +element.readcount


                    })
                    document.getElementById('view').innerHTML= str;
                }
            })
        }
    </script>
</head>
<body>
<div id="view">


</div>
</body>

</body>

</html>