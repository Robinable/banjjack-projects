<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>받은 쪽지 내용 보기 </title>
    <%--    <link rel="stylesheet" href="/css/message.css">--%>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <style>
        h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
        #main_content{width: 90%; height: 80%; margin: 0 auto;}
        li{list-style: none;margin-top: 10px;}

        #delete{margin-left: 450px; }
        #message_box .top_buttons{text-align: left; margin: 15px 0px -10px;}
        input[type="text"]{width:70%; margin-bottom: 10px; }

    </style>

    <script>

        $(function(){
            $('[name=delete]').on('click',function(e){
                var answer;
                answer = confirm('쪽지를 삭제할까요?');
                if(answer == false){
                    e.preventDefault()
                }
                else{
                }
            })
        })


        $.ajax( {
            url  :  '/getcontNote?_id=${_id}' ,
            data :  {
                recept : $('#recept').val(),
                content : $('#content').val(),
                send : $('#send').val() ,
                time : $('#time').val() ,
            },
            method   : "GET",
            dataType:  "json"
        } )
            .done(function( result, textStatus, xhr ) {
                console.log( result );
                var resultStr = JSON.stringify( result ); // JSOn -> string

                var recept = result[0].recept
                var content = result[0].content
                var send = result[0].send
                var time = result[0].time




                document.getElementById("send").value = send
                document.getElementById("cont").innerHTML = content
                document.getElementById("time").value = time

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
            <h3 id="write_title">받은 쪽지 내용 보기</h3>


            <ul class="top_buttons">
                <a class="btn btn-primary btn-sm" href="/receptNote?recept=${user.username}">받은 쪽지함</a>
                <a class="btn btn-primary btn-sm" href="/sendNote?send=${user.username}">보낸 쪽지함</a>
                <a class="btn btn-primary btn-sm" id="delete" name="delete" href="/deleteNote?_id=${_id}&recept=${user.username}" >쪽지 삭제</a>
            </ul>
            <form action="/writeNoteForm?reply=${reply}" method="post" name="message_form">
                <div id="write_msg">
                    <ul>
                        <div style=" float: left; width: 60%;">
                            <li>
                                <label for="send" class="form-label">보낸 사람</label>
                                <input type="text" class="form-control" name="send" id="send" readonly>
                            </li>
                        </div>
                        <div style=" float: left; width: 40%;">
                            <li>
                                <label for="time" class="form-label">시간</label>
                                <input type="text" class="form-control" name="time" id="time" readonly>
                            </li>
                        </div>

                        <li id="textarea">
                            <label for="cont" class="form-label">내용</label>
                            <textarea class="form-control" name="content" id="cont" rows="13" style="resize: none;" readonly></textarea>
                        </li>
                    </ul>
                    <input type="submit" class="btn btn-primary" value="답장 보내기" >
                </div>
            </form>
        </div>

    </div>

</section>


</body>
</html>