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

</style>
</head>
<body>
<div>
 <h2>게시판</h2>
<table>
 <tr>
    <th>번호</th>
    <th>제목</th>
    <th>글쓴이</th>
    <th>카테고리</th>
    <th>날짜</th>
    <th>조회수</th>
 </tr>
<tr>
  <td>_id</td>
  <td>title</td>
  <td>username</td>
  <td>categoey</td>
  <td>time</td>
  <td>readcount</td>
</tr>
<tr><a href="/writeform?username=1234">새 글 쓰기</a></tr>

</table>
</div>
</body>
</html>