<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String username = request.getParameter("username"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
    table {margin:100px auto;}
    tr:nth-of-type(4) {text-align: right;}
    td                {padding:3px}
    td:nth-of-type(1) {width:90px; text-align: right;}
    td:nth-of-type(2) {width:700px;}
    tr:ntn-of-type(4) {height:400px;}
    input[type=text]  {border:1px solid; width:100%; height:30px; border-radius: 8px;}
    textarea {width:100%; height:400px; resize:none; border-radius: 8px;}
    .left    { text-align:left !important;}
    .center  { text-align:center !important;}
    .right   { text-align:right !important;}
    table, th, td {
          border : 1px solid  #c0c0c0;
          border-collapse : collapse;
       }
</style>

<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<%@ include file="/WEB-INF/views/header.jsp" %>
</head>
<body>
<form action="/update" id="update" encType = "multipart/form-data" method="post">
    <div id="div2"></div>
<input type="submit" id="submit" class="btn btn-primary" value="수정"  />
<a href="/list?category=&num=1" class="btn btn-primary">게시판</a>
<a href="/delete?_id=${_id}&category=${category}" class="btn btn-primary">삭제</a>
</form>

<script>

     $.ajax( {
               url  :  '/viewupdate?_id=' + ${_id} ,
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

                 html += '<tr>';
                 html += '<td> 번호 </td>';
                 html += '<td>' + _id   + '</td>';
                 html += '<td> 조회수 </td>';
                 html += '<td>' + readcount   + '</td>';
                 html += '</tr>';
                 html += '<tr>';
                 html += '<td> 작성일 </td>';
                 html += '<td>' + time   + '</td>';
                 html += '<td> 작성자 </td>';
                 html += '<td>' + username + '</td>';
                 html += '</tr>';
                 html += '<tr>';
                 html += '<td> 제목 </td>';
                 html += '<td><input type="text" name="title" maxLength="20" value="' + title + '" ></td>';
                 html += '<td> 카테고리 </td>';
                 if(category == '1'){
                    html += '<td> 강아지 </td>';
                    }
                 else if(category =='2') {
                    html += '<td> 고양이 </td>';
                    }
                 else if(category =='3') {
                    html += '<td> 기타 </td>';
                    }
                 html += '</tr>';
                 html += '<tr>';
                 html += '<td> 내용 </td>';
                 html += '<td colspan="3" class="left">' +  '<textarea maxLength="500" name= "content" >' + content + '</textarea>'  + '</td>';
                 html += '</tr>';
                 html += '<tr>';
                 if(filepath == null){
                    html += '<td colspan="4"> <label class="w-80" style="cursor:pointer;"> <span>';
                    html += '<input type="file" id="chooseFile" name="file" class="form-control" accept="image/*" onchange="loadFile(this)">';
                    html += '</span> </label> </td>';
                 } else{
                    html += '<td colspan="4"> <input type="file" name="file" style="display:none;"> </td>';
                    }
                 console.log("파일이름:"+filename)
                 console.log("파일경로:"+filepath)
                 html += '</tr>';
                 html += '<input type="hidden" name="_id" value="' + _id + '" />'
                 html += '<input type="hidden" name="category" value="' + category + '" />'
             };

    			 $('#div2').html(html);

    		 })
    		 .fail(function( error ) {
    			 console.log( error );
    		 });

     cnt = 0
         $(function(){
             $('form').on('submit', function(e){
                 if( $('[name=title]').val() == ''){
                     alert('제목을 입력하세요');

                     e.preventDefault();
                     e.stopPropagation();
                 }

                 if( $('[name=content]').val() == ''){
                     alert('내용을 입력하세요');

                     e.preventDefault();
                     e.stopPropagation();
                 }
             });
             $('#form').on('submit', function(e) {
                     cnt++
                     if(cnt > 1) {
                        e.preventDefault(); // 먼저수행하고 기능 구현
                        e.stopPropagation();
                        }
             });

         });


</script>
</body>
</html>

