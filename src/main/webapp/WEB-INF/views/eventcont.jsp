<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이벤트 내용보기</title>
    <link rel="stylesheet" href="/css/message.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
                console.log(writer)


                document.getElementById("time").innerHTML = start_time+'~'+end_time
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
            <h3 id="write_title">이벤트 내용보기</h3>


            <ul class="top_buttons">
                <li><a href="/eventlistform">이벤트 목록</a></li>

            </ul>
            <form action="/eventupdateForm" method ="GET" name = "message_form" id="a">
            <input type="hidden" id ="_id" name="_id">
                <div id="write_msg">
                    <ul>
                        <li>
                            <span class="col1">작성자 : </span>
                            <span class="col2"><div id="writer">${user.username}</div></span>
                        </li>
                        <li>
                            <span class="col1">이벤트 기간 : </span>
                            <span class="col2"><div id="time"></div></span>
                        </li>
                        <li>
                            <span class="col1">제목 : </span>
                            <span class="col2"><input type='text' id="title" readonly></span>
                        </li>
                        <li id="textarea">
                            <span class="col1">내용 : </span>
                            <span class="col2"><textarea name="content" id = "cont" readonly ></textarea></span>
                        </li>
                    </ul>
                    <input type="submit" value="수정(관리자용)" id="adminlist">
                </div>
            </form>
        </div>

    </div>

</section>
<script>
if('${user.role}' != 'ADMIN'){
                $('#adminlist').css('display','none');
                }
</script>

</body>
</html>
