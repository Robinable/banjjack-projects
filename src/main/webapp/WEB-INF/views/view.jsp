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

<script>

</script>

</head>
<body>

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
        ${board.title}
      </td>
      <td>애완동물 :</td>
      <td>
        ${board.category}
    </td>
    </tr>

    <tr>
      <td>내용</td>
      <td colspan="3">
        ${board.content}
      </td>
    </tr>
    <tr>
      <td colspan="4">
        <input type="submit" value="저장" />
        <a href="/insertWrite" class="btn btn-primary">등록</a>
        <a href="/list?category=1" class="btn btn-primary">수정(게시판)</a>
        <a class="btn btn-primary">삭제</a>
      </td>
    </tr>
</table>

</body>
</html>