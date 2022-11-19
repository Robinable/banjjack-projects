<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="header.jsp"%>
    <title>공지사항 작성</title>
    <style>
        h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
        #main_content{width: 90%; height: 80%; margin: 0 auto;}
        li{list-style: none; margin-top: 10px; }
        #adminlist{margin-left: 300px; }
        #message_box {width: 800px; margin: 30px 150px; }

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
                if( $('[name=title]').val() == ''){
                    alert('제목을 입력하세요');
                    e.preventDefault();
                    e.stopPropagation();
                }

            })

            $('form').on('submit', function(e){
                cnt ++;
                alert("공지사항 작성함")
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
        <div id="main_content">
            <div id="message_box">
                <h3 id="write_title">공지사항 작성</h3>

                <form  action="/writenotice" method="post">

                    <div id="write_msg">
                        <ul>

                            <li>
                            <li>
                                <label for="writer" class="form-label">작성자</label>
                                <input type="text" class="form-control" name="writer" id="writer" value="${user.usernickname}" readonly>
                            </li>
                            <li>
                                <label for="exampleFormControlInput3" class="form-label">제목</label>
                                <input type="text" class="form-control" name="title" id="exampleFormControlInput3" >
                            </li>


                            <li id="textarea">
                                <label for="test" class="form-label">내용</label>
                                <textarea class="form-control" name="content" id="test" rows="13" placeholder="300자 이내로 입력 가능" style="resize: none;"></textarea>
                                <div id="test_cnt">(0 / 300)</div>
                            </li>
                            </li>
                        </ul>
                        <input class="btn btn-primary" type="submit" id ="sub" value="공지사항 올리기">
                        <li><a class="btn btn-primary" href='/noticeList'>공지사항 목록</a></li>

                    </div>
                </form>
            </div>

        </div>
    </section>
</div>
</body>
</html>