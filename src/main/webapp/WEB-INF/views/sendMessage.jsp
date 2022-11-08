<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>보낸 쪽지함</title>
 
       
        <link rel="stylesheet" href="/css/messageBox.css">
    </head>
    <body>
        
        
        <section>
            <div id="main_content">
                <div id="message_box">
                    <h3>
                       보낸 쪽지함
                    </h3>
 
               
                    <div>
                           
      <table class="table_box">
	<colgroup><col width="10%">
		<col width="40%">
		<col width="20%">
		<col width="20%">
		<col width="10%">
	</colgroup>
	
	<thead>
		<tr>	
			<th>번호</th>
			<th>내용</th>
			<th>받는사람</th>
			<th>등록일</th>
			<th></th>	
		</tr>
	</thead>
	
			
	<tbody >	    
		<tr>
			<td style="text-align: center;">11</td>
			<td style="text-align: center; padding-left:50px;">
		<div class="cc">
		<a href ="/ReadMessage">ㅇㄴ러나이러ㅏㄴ얼ㄴ이ㅓㄹ나이ㅓㄹ나이ㅓㄹㄴ이런이ㄴ이랑니;랑ㄴ;ㅣㅏ링;나리;ㄴ아리;ㅇ날;니아리;ㄴ아리;ㄴ알;ㅣㅇ나리;ㄴㅇ</a>
		</div>	
			</td>
			<td style="width:170px; padding-left:10px;">능린아ㅓ</td>
			<td style="width:200px; padding-left:20px;">2022-11-01</td>
			<td><a href ="">[삭제]</a></td>
		</tr >				
	</tbody>
	
	<tbody>
		<tr >
			<td style="text-align: center;">22</td>
			<td style="text-align: center; padding-left:50px;">
		<div class="cc">
		<a href ="/ReadMessage">ㅇㄴ러나이러ㅏㄴ얼ㄴ이ㅓㄹ나이ㅓㄹ나이ㅓㄹㄴ이런이ㄴ이랑니;랑ㄴ;ㅣㅏ링;나리;ㄴ아리;ㅇ날;니아리;ㄴ아리;ㄴ알;ㅣㅇ나리;ㄴㅇ </a>
		</div>	
		 	</td>
			<td style="width:170px;">능린아ㅓ린어리ㅏㄴ</td>
			<td style="width:200px; padding-left:20px;">2022-11-01</td>
			<td><a href ="">[삭제]</a></td>
		</tr>		
	</tbody>
</table>
<hr>
                        <!-- 쪽지함 이동 버튼들 -->
                        <ul class="buttons">
                            <li><button onclick="location.href='/RecepMessage'">받은 쪽지함</button></li>                     
                            <li><button onclick="location.href='/WriteMessage'">쪽지 보내기</button></li>
                        </ul>
                    </div>
 
                </div>
            </div>
        </section>
 
    </body>
</html>