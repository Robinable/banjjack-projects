<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="header.jsp"%>
    <title>1대1문의 내용 </title>


    <style>

        h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
        #main_content{width: 90%; height: 80%; margin: 0 auto;}
        li{list-style: none; margin-top: 10px; }
        #message_box {width: 800px; margin: 30px 150px; }
        input[type="text"]{width:70%; margin-bottom: 10px;}

    </style>

    <script>


        $.ajax( {
            url  :  '/getinquirycont?_id=${_id}' ,

            method   : "GET",
            dataType:  "json"
        } )
            .done(function( result, textStatus, xhr ) {
                console.log( result );
                var resultStr = JSON.stringify( result ); // JSOn -> string

                var _id   = result[0]._id
                var title = result[0].title
                var category = result[0].category
                var content = result[0].content
                var send = result[0].send
                var time = result[0].time
                var bnum = result[0].bnum
                var lvl = result[0].lvl
                var step = result[0].step
                var cat ="";

                document.getElementById("send").value = send
                document.getElementById("cont").innerHTML = content
                document.getElementById("_id").value = _id
                document.getElementById("title").value = title
                document.getElementById("time").value = time

                if(category == 1){ category = "아이디 정보/보안"}
                if(category == 2){ category = "이벤트" }
                if(category == 3){ category = "기타" }
                document.getElementById("category").value = category

                $("#a").attr("action", "/replyinquiryForm");
                $("#bnum").attr("value", bnum);
                $("#lvl").attr("value", lvl);
                $("#step").attr("value", step);

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
                <h3 id="write_title">1대1문의 내용</h3>


                <ul class="top_buttons">
                    <li><a class="btn btn-primary" href="/inquirymylistForm?send=${user.username}">내가 쓴 1대1문의 목록</a></li>

                </ul>
                <div>
                    <form action="" method ="GET" name = "message_form" id="a">
                        <input type="hidden" id="_id" name="_id" >
                        <input type="hidden" id="bnum" name="bnum" >
                        <input type="hidden" id="lvl" name="lvl" >
                        <input type="hidden" id="step" name="step" >

                        <div id="write_msg">
                            <ul>
                                <div style=" float: left; width: 60%;">
                                    <li>
                                        <label for="category" class="form-label">분류</label>
                                        <input type="text" class="form-control" id="category" name="category" readonly>
                                    </li>
                                </div>
                                <div style=" float: left; width: 40%;">
                                    <li>
                                        <label for="time" class="form-label">문의 일 시</label>
                                        <input type="text" class="form-control" id="time" name="time" readonly>
                                    </li>
                                </div>
                                <li>
                                    <label for="send" class="form-label">보내는 사람</label>
                                    <input type="text" class="form-control" name="send" id="send" readonly>
                                </li>
                                <li>
                                    <label for="title" class="form-label">제목</label>
                                    <input type="text" class="form-control" name="title" id="title" readonly>
                                </li>

                                <li id="textarea">
                                    <label for="cont" class="form-label">내용</label>
                                    <textarea class="form-control" name="content" id="cont" rows="14" readonly style="resize: none;"></textarea>
                                </li>
                            </ul>

                            <input class="btn btn-primary" type="submit" value="1대1문의 답장 보내기(관리자용)" id="sub">
                        </div>
                    </form>
                </div>

            </div>

        </div>

    </section>
    <script>
        if('${user.role}' != 'ADMIN'){
            $('#sub').attr('type','hidden');
        }
    </script>
</div>
</body>
</html>