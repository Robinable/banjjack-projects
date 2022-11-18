<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이벤트 내용보기</title>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <style>

        a                 { text-decoration-line: none; color: black; }
        .left             { text-align:left !important;}
        .center           { text-align:center !important;}
        .right            { text-align:right !important;}
        .layer            { text-align: center; width:100%; height: 700px; }
        .layer .content   { display: inline-block; height:500px;}
        .textarea         { height:300px; resize:none; border-radius: 8px;}
        ul                { list-style: none;}
        li                { margin:10px;}
        .flex-container{

            display: inline-flex;
        }
        .flex-item{
            margin: 4px;

            text-align: center;
        }

        li div.flex-item:nth-child(2) {
           width: 300px;
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
                console.log(writer)


                document.getElementById("time").innerHTML = start_time+' ~ '+end_time
                document.getElementById("title").value = title
                document.getElementById("title").innerHTML = title
                document.getElementById("content").value = content
                document.getElementById("content").innerHTML = content
                document.getElementById("_id").value = _id
                document.getElementById("writer").value = writer
                document.getElementById("writer").innerHTML = writer
            })
            .fail(function(error, textStatus, errorThrown ) {
                console.log ( error );
                alert('Error:' + error)
            });


    </script>
</head>
<body>
<section>
    <div>
        <div>
            <h3 class="center">이벤트 내용보기</h3>
            <form action="/eventupdateForm" method ="GET" name = "message_form" id="a">
            <input type="hidden" id ="_id" name="_id">
                <div class="layer">
                    <ul class="content">
                        <li>
                            <h2 id="title" class="left"></h2>
                        </li>
                        <li class="left flex-container border-bottom border-top">
                            <div class="flex-item left">작성자 :</div>
                            <div class="flex-item left" id="writer"></div>
                            <div class="flex-item right">이벤트 기간 : </div>
                            <div class="flex-item left" id="time"></div>
                        </li>
                        <li class="left textarea border-bottom">
                            <div id="content"></div>
                        </li>
                        <li class="right"> <input type="submit" value="수정(관리자용)" id="adminlist" class="btn btn-primary"> <a href="/eventlistform" class="btn btn-primary">이벤트 목록</a></li>
                    </ul>
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