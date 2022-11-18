<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이벤트 내용수정</title>
    <link rel="stylesheet" href="/css/message.css">
    <%@ include file="header.jsp"%>
    <script>


        $.ajax( {
            url  :  '/geteventcont?_id=${_id}' ,

            method   : "GET",
            dataType:  "json"
        } )
            .done(function( result, textStatus, xhr ) {
                console.log( result );
                var resultStr = JSON.stringify( result ); // JSOn -> string

                var _id = result[0]._id
                var writer = result[0].writer
                var title = result[0].title
                var content = result[0].content
                var start_time = result[0].start_time
                var end_time = result[0].end_time
                var readcount = result[0].readcount
                var eventimage = result[0].eventimage

                document.getElementById("start_time").value = start_time
                document.getElementById("end_time").value = end_time
                document.getElementById("title").value = title
                document.getElementById("cont").innerHTML = content
                document.getElementById("_id").value = _id
            })
            .fail(function(error, textStatus, errorThrown ) {
                console.log ( error );
                alert('Error:' + error)
            });


    </script>
</head>
<body>
<section>
    <div id="main_content">
        <div id="message_box">
            <h3 id="write_title">이벤트 내용 수정</h3>


            <ul class="top_buttons">
                <li><a href="/eventlistform">이벤트 목록</a></li>

            </ul>
            <form action="/eventupdate" method ="post">
                <input type="hidden" id="_id" name="_id">
                <div id="write_msg">
                    <ul>
                        <li>
                            <span class="col1">작성자 : </span>
                            <span class="col2"><div name="writer" id="writer">${user.username}</div></span>
                        </li>
                        <li>
                            <span class="col1">이벤트 기간 : </span>
                            <span class="col2">시작일:<input type="date" name="start_time" id="start_time" style="width:80%;">~</span>
                            <span class="col2">종료일:<input type="date" name="end_time" id="end_time" style="width:80%;"></span>
                        </li>
                        <li>
                            <span class="col1">제목 : </span>
                            <span class="col2"><input type='text' id="title" name ="title" ></span>
                        </li>
                        <li id="textarea">
                            <span class="col1">내용 : </span>
                            <span class="col2"><textarea name="content" id = "cont" name ="cont" ></textarea></span>
                        </li>
                    </ul>
                    <input type="submit" value="수정하기" id="adminlist">
                </div>
            </form>
        </div>

    </div>

</section>


</body>
</html>