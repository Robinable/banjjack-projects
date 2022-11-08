<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
table {margin:100px auto;}
tr:nth-of-type(1) {width:100%;}
tr:nth-of-type(4) {text-align: right;}
td                {padding:3px}
td:nth-of-type(1) {width:90px; text-align: right;}
td:nth-of-type(2) {width:700px;}
textarea          {width:100%; height:400px; resize:none; border-radius: 8px;}
input[type=text]  {border:1px solid; width:100%; height:30px; border-radius: 8px;}

   table, th, td {
      border : 1px solid  #c0c0c0;
      border-collapse : collapse;
   }
a { text-decoration-line: none; }
</style>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
 function header() {
	 let header = '<tr>';
	 header    += '<th>번호</th>';
	 header    += '<th>제목</th>';
	 header    += '<th>글쓴이</th>';
	 header    += '<th>카테고리</th>';
	 header    += '<th>날짜</th>';
	 header    += '<th>조회수</th>';
	 header    += '</tr>';
	 return header;
 }

     $.ajax( {
               url  :  '/getlist?category=' + ${category} ,
               data :  {
                   _id : $('#_id').val() ,
                   title : $('#title').val(),
                   username : $('#username').val(),
                   category : $('#category').val(),
                   time : $('time').val(),
                   readcount : $('#readcount').val(),
               },
               method   : "GET",
               dataType:  "json"
           } )
    		 .done(function( result, textStatus, xhr ) {
    		      console.log($('.category').val() );
                  var resultStr = JSON.stringify( result ); // JSOn -> string
                  var html= "";

    			 html     += header();
    			 for(var i = 0; i < result.length; i++  ){
    				 var _id = result[i]._id
                     var title = result[i].title
                     var username = result[i].username
                     var category = result[i].category
                     var time = result[i].time
                     var readcount = result[i].readcount

    				 html += '<tr>';
    				 html += '<td>' + _id   + '</td>';
    				 html += '<td>' + '<a href="/viewform?_id=' + _id + '&category=' + category + '">' +  title  + '</a>' + '</td>';
    				 html += '<td>' + username + '</td>';
    				 if(category == '1'){
    				    html += '<td>' + '강아지' + '</td>';
    				    }
    				 else if(category =='2') {
    				    html += '<td>' + '고양이' + '</td>';
    				    }
    				 else if(category =='3') {
    				    html += '<td>' + '기타' + '</td>';
    				    }
    				 html += '<td>' + time   + '</td>';
    				 html += '<td>' + readcount  + '</td>';
    				 html += '</tr>';
    			 };
    			 html += '</table>'
    			 $('#div1').html(html);
    		 })
    		 .fail(function( error ) {
    			 console.log( error );
    		 });

</script>

</head>
<body>


<a  href="/list?category=1" > 개 </a>
<a  href="/list?category=2" > 고양이 </a>
<a  href="/list?category=3" > 기타 </a>
<a  href="/list?category=''" > 전체 </a>

<div id="div1"></div>



<a href="/writeform?username=1234">새 글 쓰기</a>
</body>
</html>