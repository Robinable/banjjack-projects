<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="header.jsp"%>
    <title>1대1 문의</title>

    <style>

        h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
        #main_content{width: 90%; height: 80%; margin: 0 auto;}
        li{list-style: none; margin-top: 10px; }
        #message_box {width: 800px; margin: 30px 150px; }
        input[type="text"]{width:70%; margin-bottom: 10px;}
    </style>

    <script>


        var cnt = 0;
        $(function(){



            $('#sub').on('click', function(e){

                if( $('[name=content]').val() == ''){
                    alert('답변 내용을 입력하세요');
                    e.preventDefault();
                    e.stopPropagation();
                }
                if( $('[name=title]').val() == ''){
                    alert('제목을 입력하세요');
                    e.preventDefault();
                    e.stopPropagation();
                }

            })

            $('form').on('submit', function(e){
                cnt ++;
                alert("1대1문의 답변 보냄")
                if(cnt>1){
                    e.preventDefault();
                    e.stopPropagation();
                }
            })

        });




        $(document).ready(function() {
            $('#test').on('keyup', function() {
                $('#test_cnt').html("("+$(this).val().length+" / 300)");

                if($(this).val().length > 300) {
                    $(this).val($(this).val().substring(0, 300));
                    $('#test_cnt').html("(300 / 300)");
                    alert("300자 이내로 입력 가능")
                }

            });
        });

        $.ajax( {
            url  :  '/replyinquiry?_id=${_id}' ,

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


                document.getElementById("recept").value = send

                document.getElementById("title").value = '[답변]'+title
                document.getElementById("time").value = time

                if(category == 1){ cat = "아이디 정보/보안"}
                if(category == 2){ cat = "이벤트" }
                if(category == 3){ cat = "기타" }
                document.getElementById("cat").value = cat
                document.getElementById("category").value = category

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
            <h3 id="write_title">1대1 문의 답변</h3>
            <div id="message_box">
                <ul class="top_buttons">
                    <li><a class="btn btn-primary" id='adminlist' href='/inquirylistForm?num=1' style="">받은 1대1 문의함(관리자용)</a></li>
                </ul>

                <form  action="/writeinquiry" method="post">
                    <input type="hidden" id="category" name="category" >
                    <input type="hidden" name="send" value = "${user.role}">
                    <input type="hidden" name="bnum" value =  ${ bnum } />
                    <input type="hidden" name="lvl"  value =  ${ lvl  } />
                    <input type="hidden" name="step" value =  ${ step } />
                    <div id="write_msg">
                        <ul>
                            <div style=" float: left; width: 60%;">
                                <li>
                                    <label for="cat" class="form-label">분류</label>
                                    <input type="text" class="form-control" id="cat" name="cat" readonly>
                                </li>
                            </div>
                            <div style=" float: left; width: 40%;">
                                <li>
                                    <label for="time" class="form-label">문의 일 시</label>
                                    <input type="text" class="form-control" id="time" name="time" readonly>
                                </li>
                            </div>
                            <div style=" float: left; width: 60%;">
                                <li>
                                    <label for="send" class="form-label">보내는 사람</label>
                                    <input type="text" class="form-control" name="send" id="send" value="${user.role}" readonly>
                                </li>
                            </div>
                            <div style=" float: left; width: 40%;">
                                <li>
                                    <label for="recept" class="form-label">받는 사람</label>
                                    <input type="text" class="form-control" name="recept" id="recept" readonly>
                                </li>
                            </div>
                            <li>
                                <label for="title" class="form-label">제목</label>
                                <input type="text" class="form-control" name="title" id="title" readonly>
                            </li>

                            <li id="textarea">
                                <label for="test" class="form-label">내용</label>
                                <textarea class="form-control" name="content" id="test" rows="13" placeholder="300자 이내로 입력 가능" style="resize: none;"></textarea>
                                <div id="test_cnt">(0 / 300)</div>
                            </li>
                        </ul>
                        <input class="btn btn-primary" type="submit" id ="sub" value="답변 보내기">

                    </div>
                </form>
            </div>

        </div>

    </section>
</div>
</body>
</html>