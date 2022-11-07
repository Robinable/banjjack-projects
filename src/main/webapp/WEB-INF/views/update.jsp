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

     $('form').on('submit', function() {
     $.ajax( {
               alert('button click');
               let url  :  '/update?_id=' + ${_id} ,
               location.href  =  url;
               data :  {
                   _id : $('#_id').val() ,
                   title : $('#title').val(),
                   content : $('#content').val(),
                   username : $('#username').val(),
                   category : $('#category').val(),
                   time : $('time').val(),
                   readcount : $('#readcount').val(),
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

                 html += '<tr>';
                 html += '<td>' + '번호'   + '</td>';
                 html += '<td>' + _id   + '</td>';
                 html += '<td>' + '조회수'   + '</td>';
                 html += '<td>' + readcount   + '</td>';
                 html += '</tr>';
                 html += '<tr>';
                 html += '<td>' + '작성일'   + '</td>';
                 html += '<td>' + time   + '</td>';
                 html += '<td>' + '작성자' + '</td>';
                 html += '<td>' + username + '</td>';
                 html += '</tr>';
                 html += '<tr>';
                 html += '<td>' +  '제목'  + '</td>';
                 html += '<td>' +  title  + '</td>';
                 html += '<td>' +  '카테고리'  + '</td>';
                 if(category == '1'){
                    html += '<td>' + '강아지' + '</td>';
                    }
                 else if(category =='2') {
                    html += '<td>' + '고양이' + '</td>';
                    }
                 else if(category =='3') {
                    html += '<td>' + '기타' + '</td>';
                    }
                 html += '</tr>';
                 html += '<tr>';
                 html += '<td>' +  '내용'  + '</td>';
                 html += '<td colspan="3">' +  content  + '</td>';
                 html += '</tr>';
             };
    			 html += '</table>'
    			 $('#div2').html(html);
    		 })
    		 .fail(function( error ) {
    			 console.log( error );
    		 });
    		  } )

</script>

</head>
<body>
<form action="/update" method="GET">

<!--
<input type="hidden" name="_id" value="${board._id}" />
<input type="hidden" name="category" value="${board.category}" />
<table>
    <tr>
      <td>번호</td>
      <td>${board._id}</td>
      <td>조회수</td>
      <td>${board.readcount}</td>
    </tr>
    <tr>
      <td>작성일</td>
      <td>${board.time}</td>
      <td>작성자</td>
      <td>${board.username}</td>
    </tr>
    <tr>
      <td>제목 :</td>
      <td>
        <input type="text" name="title" maxLength="20" value="${board.title}" >
      </td>
      <td>애완동물 :</td>
      <c:choose>
        <c:when test="${ board.category eq 1 }">
         <td>강아지</td>
        </c:when>
        <c:when test="${ board.category eq 2 }">
           <td>고양이</td>
        </c:when>
        <c:otherwise>
            <td>기타</td>
        </c:otherwise>
      </c:choose>
    </tr>

    <tr>
      <td>내용</td>
      <td colspan="5">
        <textarea maxLength="500" name= "content" >${board.content}</textarea>
      </td>
    </tr>
    <tr>
      <td colspan="4">
        <input type="submit" value="수정" />
        <a href="/writejson?category=${board.category}" class="btn btn-primary">게시판</a>
        <a class="btn btn-primary">삭제</a>
      </td>
    </tr>
</table>
-->

<input type="submit" value="수정" />
        <a href="/writejson?category=${board.category}" class="btn btn-primary">게시판</a>
        <a class="btn btn-primary">삭제</a>
</form>

</body>
</html>