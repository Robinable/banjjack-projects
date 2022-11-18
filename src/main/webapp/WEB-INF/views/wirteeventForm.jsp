<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>이벤트 작성</title>
    <link rel="stylesheet" href="/css/message.css?aadfs">
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script>

        var cnt = 0;
        $(function(){

            $('#sub').on('click', function(e){

                if( $('[name=content]').val() == ''){
                    alert('내용을 입력하세요');
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
                alert("이벤트 작성함")
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






    </script>

</head>
<body>
<section>
    <div id="main_content">
        <div id="message_box">
            <h3 id="write_title">이벤트 작성</h3>

            <form  action="/writeevent" method="post">

                <div id="write_msg">
                    <ul>

                        <li>
                            <span class="col1">작성자 : </span>
                            <span class="col2" name="writer">${user.username}</span>
                        </li>

                        <li>
                            <span class="col1">이벤트 기한</span>
                            </br>
                            <span class="col2">시작일:<input type="date" name="start_time" style="width:80%;">~</span>
                            <span class="col2">종료일:<input type="date" name="end_time" style="width:80%;"></span>
                        </li>

                        <li>
                            <span class="col1">제목 : </span>
                            <span class="col2"><input type="text" name="title"></span>
                        </li>

                        <li id="textarea">
                            <span class="col1">내용 : </span>
                            <span class="col2"><textarea id="test" name="content"  placeholder="300자 이내로 입력 가능"></textarea><div id="test_cnt">(0 / 300)</div>
                                    </span>
                        </li>
                    </ul>
                    <input type="submit" id ="sub" value="이벤트 작성">
                    <li><a href='/eventlistform'>이벤트 목록</a></li>

                </div>
            </form>
        </div>

    </div>

</section>

</body>
</html>