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
textarea          {width:100%; height:400px; resize:none; border-radius: 8px;}
input[type=text]  {border:1px solid; width:100%; height:30px; border-radius: 8px;}
</style>

<script>


   window.onload = function() {
   	  var formEl = document.getElementById('form');
   	  formEl.addEventListener('submit', function(e) {
   		  // 필수 입력 제목, 내용
   		  const  titleEl = document.querySelector('[name=title]');
   		  const  contentEl = document.querySelector('[name=content]');
   		  const  categoryEl = document.querySelector('[name=category]');

   		  if(  titleEl.value.trim() == ''  ) {
   			  alert('제목을 입력하세요');
   			  e.preventDefault();   // 기본이벤트 제거
   		  	  e.stopPropagation();  // 이벤트 버블링 방지 - 다른 이벤트에 영향을 주지 못함
   		  }

   		  if( categoryEl.value.trim() == '0') {
                        alert('카테고리를 선택하세요');
                        e.preventDefault();   // 기본이벤트 제거
                        e.stopPropagation();  // 이베늩 버블링 방지 - 다른 이벤트에 영향을 주지 못함
          }

   		  if( contentEl.value.trim() == '') {
   			  alert('내용을 입력하세요');
   			  e.preventDefault();   // 기본이벤트 제거
   		  	  e.stopPropagation();  // 이베늩 버블링 방지 - 다른 이벤트에 영향을 주지 못함
   		  }


   	  } );
     }
</script>

</head>
<body>
<form action="/write_insert" id="form" method="GET" onsubmit="return submitCheck();">
<input type="hidden" name="username" value=${username} />
<input type="hidden" name="_id" value="10" />
<input type="hidden" name="readcount" value="0" />
<table>
<tr>
  <td>제목 :</td>
  <td>
    <input type="text" name="title" maxLength="20" >
  </td>
</tr>

<tr>
  <td>애완동물 :</td>
  <td>
    <select size="1" name="category" >
	  <option name="info" value="0">선택하세요.</option>
	  <option name="info" value="1">개</option>
	  <option name="info" value="2">고양이</option>
	  <option name="info" value="3">기타</option>
	</select>
  </td>
</tr>

<tr>
  <td> </td>
  <td>
    <textarea maxLength="500" name= "content" placeholder="내용을 입력하세요" value="content"></textarea>
  </td>
</tr>
<tr>
  <td colspan="2">
    <input type="submit" id="submit" onclick="GoEx()" value="저장" />
    <a href="/insertWrite" class="btn btn-primary">등록</a>
    <a href="/writejson?category=1" class="btn btn-primary">게시판</a>
    <a class="btn btn-primary">삭제</a>
  </td>
</tr>
</table>

</body>
</html>