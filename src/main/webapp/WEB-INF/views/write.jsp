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
   var name_by_id = document.getElementById("category").getAttribute('name');
</script>

</head>
<body>
<form action="/write_insert" id="form" method="GET">
<input type="hidden" name="username" value="1234" />
<input type="hidden" name="_id" value="1" />
<input type="hidden" name="time" value="0" />
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
    <select size="1" name="category" onchange="changeFn()">
	  <option name="city" value="0">선택하세요.</option>
	  <option name="city" value="1">개</option>
	  <option name="city" value="2">고양이</option>
	  <option name="city" value="3">기타</option>
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
    <input type="submit" value="저장" />
    <a href="/insertWrite" class="btn btn-primary">등록</a>
    <a href="/list?category=1" class="btn btn-primary">수정(게시판)</a>
    <a class="btn btn-primary">삭제</a>
  </td>
</tr>
</table>

</body>
</html>