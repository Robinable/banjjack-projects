<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="header.jsp"%>
    <%@ include file="side.jsp"%>
    <title>공지사항 내용보기</title>

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

        $(function(){
            $('[name=update]').on('click',function(e){
                var answer;
                answer = confirm('공지사항을 수정할까요?');
                if(answer == false){
                    alert('취소합니다');
                    e.preventDefault()
                }
                else{
                    alert('수정합니다');
                }
            })
        })


        $.ajax( {
            url  :  '/getnoticecont?_id=${_id}' ,

            method   : "GET",
            dataType:  "json"
        } )
            .done(function( result, textStatus, xhr ) {
                console.log( result );
                var resultStr = JSON.stringify( result ); // JSOn -> string

                var title = result[0].title
                var content = result[0].content
                var writer = result[0].writer
                var time = result[0].time
                var _id = result[0]._id

                document.getElementById("writer").value = writer
                document.getElementById("time").value = time
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
<div class="container">
    <section>
        <div id="main_content">
            <div id="message_box">
                <h3 id="write_title">공지사항 내용보기</h3>

                <form action="/noticeupdateForm" method ="get">
                    <input type="hidden" id="_id" name="_id">


                    <ul class="top_buttons">
                        <a class="btn btn-primary" href="/noticeList">공지사항 목록</a>
                        <input class="btn btn-primary" type="submit" value="수정하기(관리자용)" id="adminlist">
                    </ul>
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
                                    <input type="text" class="form-control" id="time" name="time" readonly>
                                </li>
                            </div>
                            <li>
                                <label for="title" class="form-label">제목</label>
                                <input type="text" class="form-control" name="title" id="title" readonly>
                            </li>
                            <li id="textarea">
                                <label for="cont" class="form-label">내용</label>
                                <textarea class="form-control" name="content" id="cont" rows="14" readonly style="resize: none;"></textarea>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>

        </div>

    </section>
</div>
<script>
    if('${user.role}' != 'ADMIN'){
        $('#adminlist').css('display','none');
    }
</script>
</body>
</html>