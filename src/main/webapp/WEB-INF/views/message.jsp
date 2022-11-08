<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지</title>
    <link rel="stylesheet" href="/css/message.css?aadfs">
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script>
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
                <h3 id="write_title">쪽지 보내기</h3>
 
                
                <ul class="top_buttons">
                    <li><a href="/RecepMessage">받은 쪽지함</a></li>
                    <li><a href="/SendMessage">보낸 쪽지함</a></li>
                </ul>
 
              
               <form action="/RecepMessage" method="post" name="message_form">
                        <div id="write_msg">
                            <ul>
                                <li>
                                    <span class="col1">보내는 사람 : </span>
                                    <span class="col2">보낸사람아이디</span>
                                </li>
                                <li>
                                    <span class="col1">받는 사람 : </span>
                                    <span class="col2"><input type="text" name="user_id"></span>
                                </li>
                                
                                <li id="textarea">
                                    <span class="col1">내용 : </span>
                                    <span class="col2"><textarea id="test" name="content"  placeholder="300자 이내로 입력 가능"></textarea><div id="test_cnt">(0 / 300)</div>
                                    </span>
                                    
                                </li>                                
                            </ul>
                            <input type="submit" value="보내기">
                        </div>
                </form>
            </div>
 
        </div>
 
    </section>
 
    
</body>
</html>