<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지</title>
    <link rel="stylesheet" href="/css/message.css?sdfsd">
</head>
<body>
    <section>
        <div id="main_content">
            <div id="message_box">
                <h3 id="write_title">받은 쪽지</h3>
 
                
                <ul class="top_buttons">
                    <li><a href="/RecepMessage">받은 쪽지함</a></li>
                    <li><a href="/SendMessage">보낸 쪽지함</a></li>
                </ul>               
               <form action="" method="post" name="message_form">
                        <div id="write_msg">
                            <ul>
                                <li>
                                    <span class="col1">보낸 사람 : </span>
                                    <span class="col2">보낸사람아이디</span>
                                </li>
                                
                                <li id="textarea">
                                    <span class="col1">내용 : </span>
                                    <span class="col2"><textarea name="content"></textarea></span>
                                </li>                                
                            </ul>
                            <input type="submit" value="답장하기">
                        </div>
                </form>
            </div>
 
        </div>
 
    </section>
 
    
</body>
</html>