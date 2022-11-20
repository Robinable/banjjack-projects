<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="header.jsp"%>
    <%@ include file="side.jsp"%>
    <title>공지사항 수정</title>
    <style>
        h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
        h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
        #main_content{width: 90%; height: 80%; margin: 0 auto;}
        li{list-style: none; margin-top: 10px; }
        #message_box {width: 800px; margin: 30px 150px; }
        input[type="text"]{width:70%; margin-bottom: 10px;}
        #adminlist{margin-left: 300px; }

    </style>
    <script>


        $.ajax( {
            url  :  '/getnoticecont?_id=${_id}' ,

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
                var time = result[0].time

                document.getElementById("title").value = title
                document.getElementById("content").innerHTML = content
                document.getElementById("_id").value = _id
                document.getElementById("writer").value = writer
                document.getElementById("time").value = time
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
        <div id="main_content">
            <div id="message_box">
                <h3 id="write_title">이벤트 내용 수정</h3>


                <ul class="top_buttons">
                    <li><a href="/noticeList">공지사항 목록</a></li>

                </ul>
                <form action="/noticeupdate" method ="post">
                    <input type="hidden" id="_id" name="_id">
                    <div id="write_msg">
                        <ul>
                            <div style=" float: left; width: 60%;">
                                <li>
                                    <label for="writer" class="form-label">작성자</label>
                                    <input type="text" class="form-control" id="writer" name="writer" readonly>
                                </li>
                            </div>
                            <div style=" float: left; width: 40%;">
                                <li>
                                    <label for="time" class="form-label">공지 일 시</label>
                                    <input type="text" class="form-control" id="time" readonly>
                                </li>
                            </div>
                            <li>
                                <label for="title" class="form-label">제목</label>
                                <input type="text" class="form-control" name="title" id="title" >
                            </li>
                            <li id="textarea">
                                <label for="cont" class="form-label">내용</label>
                                <textarea class="form-control" name="content" id="content" rows="14" style="resize: none;"></textarea>
                            </li>
                        </ul>
                        <input class="btn btn-primary" type="submit" value="수정하기" id="adminlist">
                    </div>
                </form>
            </div>

        </div>

    </section>

</div>
</body>
</html>