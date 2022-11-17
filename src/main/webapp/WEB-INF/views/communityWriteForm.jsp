<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <style>
        table             {margin:100px auto;}
        tr:nth-of-type(4) {text-align: right;}
        td                {padding:3px}
        td:nth-of-type(1) {width:500px; text-align: right;}
        td:nth-of-type(2) {width:50px;}
        textarea          {width:100%; height:400px; resize:none; border-radius: 8px;}
        input[type=text]  {border:1px solid; width:100%; height:30px; border-radius: 8px;}
        .left             { text-align:left !important;}
        .layer            { text-align: center; }
        .layer .content   { display: inline-block; }
    </style>

  <meta charset="UTF-8">
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
  <script>
    function fnWriteClick() {
      let writeData =
              {
                username: $('#username').val(),
                tag: $('#tag').val(),
                title: $('#title').val(),
                content: $('#content').val(),

              }
      console.log(writeData);
      $.ajax({
        url: "/communityWrite",
        type: "POST",
        data: writeData,
        error: function (xhr) {


        },
        success: function (WriteData) {
          var url = "<c:url value="/communityList"/>";
          window.location.href = url
        }

      });
    }
  </script>
  <%@ include file="header.jsp"%>
</head>

<body style="background-color: white">

<div class="layer">
    <div class="btn-group layer" role="group" aria-label="Basic outlined example">
      <a  href="#" class="btn btn-outline-primary"> 인기글 </a>
      <a  href="/communityList" class="btn btn-outline-primary"> 자유게시판 </a>
      <a  href="#" class="btn btn-outline-primary">반려자랑 </a>
      <a  href="#" class="btn btn-outline-primary"> 질문게시판 </a>
    </div>
</div>

<input type="hidden" id="username" value=${user.username} />
<input type="hidden" id="readcount" value="0" />
<table>
<tr>
  <td class="left" colspan = "4"><h2> 새 글 쓰기 </h2></td>
</tr>
<tr>
  <td>
    <input type="text"  id="title" placeholder="제목"maxLength="20" />
  </td>
  <td >태그 : </td>
  <td>
    <input type="text" id="tag" placeholder="태그" maxlength="20">
  </td>
</tr>
<tr>
  <td colspan="3">
    <textarea maxlength="500" id="content" placeholder="내용" ></textarea>
  </td>
</tr>
<tr>
  <td colspan="3">
    <button id="writebutton" class="btn btn-primary" onClick="fnWriteClick()">작성</button>
    <a href="/communityList" class="btn btn-primary">게시판</a>
  </td>
</tr>
</table>

</body>
</html>