<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>받은 쪽지함</title>
 
       
        <link rel="stylesheet" href="/css/messageBox.css">
    </head>
    <body>
        
        
        <section>
            <div id="main_content">
                <div id="message_box">
                    <h3>
                       받은 쪽지함
                    </h3>
 
               
                    <div>
                           
      <table class="table_box" >
	<colgroup><col width="5%">
		<col width="10%">
		<col width="40%">
		<col width="25%">
		<col width="20%">
	</colgroup>
	
	<thead>
		
		    <th></th>	
		    <th>번호</th>
		    <th>내용</th>
			<th>보낸사람</th>
			<th>등록일</th>
				
		
	</thead>
			
	<tbody >	    
		
		    <li><input type ="checkbox" name = "chk_list"></li>
			<li style="text-align: center;">11</li>
			<li style="text-align: center; padding-left:30px;">
		<div class="cc">
		<a href ="/ReadMessage">ㅇㄴ러나이러ㅏㄴ얼ㄴ이ㅓㄹ나이ㅓㄹ나이ㅓㄹㄴ이런이ㄴ이랑니;랑ㄴ;ㅣㅏ링;나리;ㄴ아리;ㅇ날;니아리;ㄴ아리;ㄴ알;ㅣㅇ나리;ㄴㅇ</a>
		</div>	
			</li>
			<li style="width:170px; text-align: center;">능린아ㅓ</li>
			<li style="width:200px; text-align: center;">2022-11-01</li>
			
		</tr >				
	</tbody>
	
	<tbody>
		<tr >
		    <li><input type ="checkbox" name = "chk_list"></li>
			<li style="text-align: center;">22</li>
			<li style="text-align: center; padding-left:30px;">
		<div class="cc">
		<a href ="/ReadMessage">ㅇㄴ러나이러ㅏㄴ얼ㄴ이ㅓㄹ나이ㅓㄹ나이ㅓㄹㄴ이런이ㄴ이랑니;랑ㄴ;ㅣㅏ링;나리;ㄴ아리;ㅇ날;니아리;ㄴ아리;ㄴ알;ㅣㅇ나리;ㄴㅇ </a>
		</div>	
		 	</li>
			<li style="width:170px; text-align: center;">능린아d</li>
			<li style="width:200px; text-align: center;">2022-11-01</li>
				
	</tbody>
</table>
<hr>
                        <!-- 쪽지함 이동 버튼들 -->
                        <ul class="buttons">
                            <li><button onclick="location.href='/SendMessage'">삭제</button></li>
                            <li><button onclick="location.href='/SendMessage'">보낸 쪽지함</button></li>                     
                            <li><button onclick="location.href='/WriteMessage'">쪽지 보내기</button></li>
                        </ul>
                    </div>
 
                </div>
            </div>
        </section>
 
    </body>
</html>