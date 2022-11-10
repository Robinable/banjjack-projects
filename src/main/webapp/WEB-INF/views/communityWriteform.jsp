<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script>
        function fnWriteClick() {
            console.log("버튼테스트");
            let writeData =
                {
                    username: $('username').val(),
                    tag: $('tag').val(),
                    title: $('title').val(),
                    content: $('title').val(),

                }
            $.ajax({
                url: "/comunityWrite",
                type: "post",
                data: writeData,
                error: function (xhr) {
                    console.log("error html = " + xhr.statusText);
                    alert(F);

                },
                success: function (WriteData) {
                    console.log(WriteData)
                    alert(S);
                }

            });
        }

    </script>
</head>

<body>
<input type="hidden" name="username" value=1234 />
<input type="hidden" name="readcount" value="0" />
<input type="text" id="tag" placeholder="태그" maxlength="20">
<br>
<input type="text"  id="title" placeholder="제목"maxLength="20" />
<br>
<textarea maxlength="500" id="content" placeholder="내용" ></textarea>
<button id="writebutton" onClick="fnWriteClick">작성</button>
</body>
</html>