<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
  <%@ include file="/WEB-INF/views/header.jsp" %>
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
  <script>
    function fnWriteClick() {
      var tag = document.getElementById('tag');

      if( $('[id=title]').val() == ''){
        alert('제목을 입력하세요');

        e.preventDefault();
        e.stopPropagation();
        return start;
      }
      if( $('[id=tag]').val() == '0'){
        alert('태그를 선택하세요');

        e.preventDefault();
        e.stopPropagation();
        return start;
      }
      if( $('[id=content]').val() == ''){
        alert('내용을 입력하세요');
        e.preventDefault();
        e.stopPropagation();
        return start;
      }
      
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
          console.log(tag)
          var url = "<c:url value="/communityList?tag=0"/>";
          window.location.href = url
        }

      });
    }
  </script>
</head>

<body style="background-color: white">
<div class="container">
  <div class="layer">
    <div class="btn-group layer" role="group" aria-label="Basic outlined example">
      <a  href="/communityList?tag=100" class="btn btn-outline-primary"> 인기글 </a>
      <a  href="/communityList?tag=0" class="btn btn-outline-primary"> 전체 </a>
      <a  href="/communityList?tag=1" class="btn btn-outline-primary"> 자유게시판 </a>
      <a  href="/communityList?tag=2" class="btn btn-outline-primary">반려자랑 </a>
      <a  href="/communityList?tag=3" class="btn btn-outline-primary"> 질문게시판 </a>
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
        <select class="form-select" size="1" name="tag" id="tag">
          <option name="info" value="0">선택하세요.</option>
          <option name="info" value="1">자유게시판</option>
          <option name="info" value="2">반려자랑</option>
          <option name="info" value="3">질문게시판</option>
        </select>
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
</div>
</body>
</html>