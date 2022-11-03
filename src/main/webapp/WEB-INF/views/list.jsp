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
</head>
<body>
<div>
 <h2>게시판</h2>
<table>
<tr>
<a  href="/list?category=1" > 개 </a>
<a  href="/list?category=2" > 고양이 </a>
</tr>
 <tr>
    <th>번호</th>
    <th>제목</th>
    <th>글쓴이</th>
    <th>카테고리</th>
    <th>날짜</th>
    <th>조회수</th>
 </tr>
 <c:forEach  var="board" items="${ boardList }">
       <tr>
         <td>${ board._id }</td>
         <td>
            ${ board.title  }
         </td>
         <td>${ board.username    }</td>
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

         <td>${ board.time   }</td>
         <td>${ board.readcount }</td>
       </tr>
      </c:forEach>

<tr><a href="/writeform?username=1234">새 글 쓰기</a></tr>

</table>
</div>
</body>
</html>