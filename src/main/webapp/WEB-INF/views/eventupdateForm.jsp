<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이벤트 내용수정</title>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="side.jsp"%>

    <style>

        a                 { text-decoration-line: none; color: black; }
        .left             { text-align:left !important;}
        .center           { text-align:center !important;}
        .right            { text-align:right !important;}
        .layer            { text-align: center; width:100%; height: 700px; }
        .layer .content   { display: inline-block; height:500px;}
        .textarea         { height:400px; width:100%; resize:none; border-radius: 8px;}
        input[type=text]  {border:1px solid; width:100%; height:30px; border-radius: 8px;}
        ul                { list-style: none;}
        li                { margin:5px;}
        .flex-container{
            width: 800px;
            display: inline-flex;
        }
        .flex-item{
            margin: 4px;
            text-align: center;
        }
        li div.flex-item:nth-child(2) {
            width: 180px;
        }
        li div.flex-item:nth-child(4) {
            width: 200px;
        }



    </style>

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
                result = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');

                document.getElementById("start_time").value = start_time
                document.getElementById("end_time").value = end_time
                document.getElementById("title").value = title
                document.getElementById("cont").innerHTML = result
                document.getElementById("_id").value = _id
            })
            .fail(function(error, textStatus, errorThrown ) {
                console.log ( error );
                alert('Error:' + error)
            });


    </script>
</head>
<body>
<div class="container">
    <section>
        <div>
            <div>
                <h3 class="center">이벤트 내용 수정</h3>

                <form action="/eventupdate" method ="post">
                    <input type="hidden" id="_id" name="_id">
                    <div class="layer">
                        <ul class="content">
                            <li class="left flex-container border-bottom border-top">
                                <div class="flex-item left">작성자 : </div>
                                <div class="flex-item left" name="writer" id="writer">${user.username}</div>
                            </li><br>
                            <li class="left flex-container">
                                <div class="flex-item left">시작일</div>
                                <div class="flex-item left"><input type="date" name="start_time" id="start_time" style="width:80%;"></div>
                                <div class="flex-item left">종료일</div>
                                <div class="flex-item left"><input type="date" name="end_time" id="end_time" style="width:80%;"></div>
                            </li>
                            <li>
                                <div><input type='text' id="title" name ="title" ></div>
                            </li>
                            <li>
                                <div ><textarea name="content" id = "cont" name ="cont" class="textarea" ></textarea></div>
                            </li>
                            <li class="right">
                                <a href="/eventlistform" class="btn btn-primary">이벤트 목록</a>
                                <input type="submit" value="수정하기" id="adminlist" class="btn btn-primary">
                            </li>
                        </ul>
                    </div>
                </form>
            </div>

        </div>

    </section>

</div>
</body>
</html>