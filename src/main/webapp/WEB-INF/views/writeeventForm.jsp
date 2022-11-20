<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>이벤트 작성</title>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="side.jsp"%>


    <style>

        a                 { text-decoration-line: none; color: black; }
        .left             { text-align:left !important;}
        .center           { text-align:center !important;}
        .right            { text-align:right !important;}
        .layer            { text-align: center; width:100%; }
        .layer .content   { display: inline-block; }
        textarea          {width:100%; height:400px; resize:none; border-radius: 8px;}
        input[type=text]  {border:1px solid; width:100%; height:30px; border-radius: 8px;}
        ul                { list-style: none; width:800px;}
        li                { margin:10px;}

    </style>

    <script>

        var cnt = 0;
        $(function(){

            $('#sub').on('click', function(e){

                if( $('[name=content]').val() == ''){
                    alert('내용을 입력하세요');
                    e.preventDefault();
                    e.stopPropagation();
                }
                else if( $('[name=title]').val() == ''){
                    alert('제목을 입력하세요');
                    e.preventDefault();
                    e.stopPropagation();

                }
                else if( $('[name=start_time]').val() == '' || $('[name=end_time]').val() == '' ) {
                    alert('이벤트기한을 입력하세요');
                    e.preventDefault();
                    e.stopPropagation();
                }
                else if( $('[name=start_time]').val() > $('[name=end_time]').val()  ) {
                    alert('이벤트기한을 다시 확인해주세요.');
                    e.preventDefault();
                    e.stopPropagation();}

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
<div class="container">
    <section>

        <div id="main_content" class="layer">


            <form  action="/writeevent" method="post">
                <input type="hidden" name="writer"  value=${user.username} />

                <div class="content">
                    <ul class="content">
                        <h3 class="left">이벤트 작성</h3>
                        <li class="left">
                            <span>작성자 : </span>
                            <span style="bottom-line: 1px;">${user.username}</span>
                        </li>
                        <li class="left">
                            <span>시작일 : <input type="date" name="start_time">&nbsp</span>
                            <span>종료일 : <input type="date" name="end_time" ></span>
                        </li>

                        <li class="left">
                            <span><input type="text" name="title" placeholder="제목"></span>
                        </li>

                        <li class="left">
              <span class="col2"><textarea id="test" name="content"  placeholder="300자 이내로 입력 가능"></textarea><div id="test_cnt"></div>
                                    </span>
                        </li>
                        <li class="right">
                            <input type="submit" value="이벤트 작성" name="sub" id="sub" class="btn btn-primary">
                            <a href='/eventlistform' class="btn btn-primary">이벤트 목록</a>
                        </li>
                    </ul>



                </div>
            </form>
        </div>




    </section>
</div>
</body>
</html>