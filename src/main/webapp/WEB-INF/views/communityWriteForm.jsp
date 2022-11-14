<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
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

<body>
<input type="hidden" id="username" value='1234' />
<input type="hidden" id="readcount" value="0" />
<input type="text" id="tag" placeholder="태그" maxlength="20">
<br>
<input type="text"  id="title" placeholder="제목"maxLength="20" />
<br>
<textarea maxlength="500" id="content" placeholder="내용" ></textarea>
<button id="writebutton" onClick="fnWriteClick()">작성</button>

</body>
</html>