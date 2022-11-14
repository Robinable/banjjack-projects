<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String username = request.getParameter("username"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        table {margin:100px auto;}
        tr:nth-of-type(4) {text-align: right;}
        td                {padding:3px}
        td:nth-of-type(1) {width:90px; text-align: right;}
        td:nth-of-type(2) {width:700px;}
        tr:ntn-of-type(4) {height:400px;}
        table, th, td {
            border : 1px solid  #c0c0c0;
            border-collapse : collapse;
        }
    </style>

    <script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>

        $.ajax( {
            url  :  '/getview?_id=' + ${_id} ,
            data :  {
                _id : $('#_id').val() ,
                title : $('#title').val(),
                content : $('#content').val(),
                username : $('#username').val(),
                category : $('#category').val(),
                time : $('time').val(),
                readcount : $('#readcount').val(),
                filename : $('#filename').val(),
                filepath : $('#filepath').val(),
                bnum : $('#bnum').val(),
                lvl : $('#lvl').val(),
                step : $('#step').val(),
            },
            method   : "GET",
            dataType:  "json"
        } )
            .done(function( result, textStatus, xhr ) {
                var resultStr = JSON.stringify( result ); // JSOn -> string
                var html= "";

                for(var i = 0; i < result.length; i++  ){
                    var _id = result[i]._id
                    var title = result[i].title
                    var content = result[i].content
                    var username = result[i].username
                    var category = result[i].category
                    var time = result[i].time
                    var readcount = result[i].readcount
                    var filename = result[i].filename
                    var filepath = result[i].filepath
                    var bnum = result[i].bnum
                    var lvl = result[i].lvl
                    var step = result[i].step

                    html += '<tr>';
                    html += '<td>번호</td>';
                    html += '<td>' + _id   + '</td>';
                    html += '<td>조회수</td>';
                    html += '<td>' + readcount   + '</td>';
                    html += '</tr>';
                    html += '<tr>';
                    html += '<td>작성일</td>';
                    html += '<td>' + time   + '</td>';
                    html += '<td>작성자</td>';
                    html += '<td>' + username + '</td>';
                    html += '</tr>';
                    html += '<tr>';
                    html += '<td>제목</td>';
                    html += '<td>' +  title  + '</td>';
                    html += '<td>카테고리</td>';
                    if(category == '1'){
                        html += '<td>강아지</td>';
                    }
                    else if(category =='2') {
                        html += '<td>고양이</td>';
                    }
                    else if(category =='3') {
                        html += '<td>기타</td>';
                    }
                    html += '</tr>';
                    html += '<tr>';
                    html += '<td>내용</td>';
                    html += '<td colspan="3">' +  content ;
                    if(filepath != null){
                        html += '<br><img src="' + filepath + '" style="width:200px; height:200px;">'
                    }
                    html += '</td>';
                    html += '</tr>';

                    html += '<td colspan="3"><a href="/writeform?username=1234&_id='+_id+'&bnum='+ bnum +'&lvl='+ lvl +'&step='+ step +'">답글쓰기</a>'
                    html +=  '<a href="/updateForm?_id=' + _id + '"> 수정 </a>'
                    html +=  '<a href="/list?category=' + category + '&num=1" class="btn btn-primary"> 게시판 </a>'
                    html +=  '<a href="/delete?_id=' + _id + '&category=' + category + '" class="btn btn-primary"> 삭제 </a>'
                    html += '</td>'

                };

                $('#div2').html(html);
            })
            .fail(function( error ) {
                console.log( error );
            });

    </script>

</head>
<body>
<div id="div2"></div>
<%@ include file="/WEB-INF/views/commentListPage.jsp" %>
</body>
</html>