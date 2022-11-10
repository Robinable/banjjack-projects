<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>1:1 문의함(관리자용)</title>

        <link rel="stylesheet" href="/css/messageBox2.css">
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

        <script>


        		   $.ajax( {
        			   url  :  '/alllist?num=${num}'  ,
        			   data :  {
        				   title : $('#title').val() ,
        				   content : $('#content').val(),
        				   category : $('#category').val() ,
        				   send : $('#send').val() ,
        				   time : $('#time').val() ,
        				   _id : $('#_id').val() ,
        		       },
        		       method   : "GET",
        		       dataType:  "json"
        		   } )
        		   .done(function( result, textStatus, xhr ) {
        			   console.log( result );
        			   var resultStr = JSON.stringify( result ); // JSOn -> string
                        var cat;
                        var html= "";
        			  for(var i = 0; i < result.length; i++ ) {
                     var title = result[i].title
                     var content = result[i].content
                     var category = result[i].category
                     var send = result[i].send
                     var time = result[i].time
                     var _id = result[i]._id
                     var _num = 1;
                     if(category == 1){ cat = "아이디 정보/보안"}
                     if(category == 2){ cat = "이벤트" }
                     if(category == 3){ cat = "기타" }

        			   html         += "<tr>";
        			   html         += '<td style="text-align: center;">' + _id + '</td>';
        			   html         += '<td style="text-align: center;">' + cat + '</td>';
        			   html         += '<td style="text-align: center; padding-left:30px;">';
        			   html         += '<div class="cc">';
        			   html         += '<a href ="/readNote?_id='+_id +'">'+ title +'</a>';
        			   html         += '</div></td>';
        			   html         += '<td style="width:170px; text-align: center;">'+ send +'</td>';
        			   html         += '<td style="width:200px; text-align: center;">'+ time +'</td>';
        			   html         += "</tr>";
                      }
                      console.log(html);
                        $('#noteList').html( html );
        		   })
        		   .fail(function(error, textStatus, errorThrown ) {
        			   console.log ( error );
        			   alert('Error:' + error)
        		   });

function caselist(a){

  $.ajax( {
        			   url  :  '/caselist?category=a&num=${num}'  ,
        			   data :  {
        				   title : $('#title').val() ,
        				   content : $('#content').val(),
        				   category : $('#category').val() ,
        				   send : $('#send').val() ,
        				   time : $('#time').val() ,
        				   _id : $('#_id').val() ,
        		       },
        		       method   : "GET",
        		       dataType:  "json"
        		   } )
        		   .done(function( result, textStatus, xhr ) {
        			   console.log( result );
        			   var resultStr = JSON.stringify( result ); // JSOn -> string
                        var cat;
                        var html= "";
        			  for(var i = 0; i < result.length; i++ ) {
                     var title = result[i].title
                     var content = result[i].content
                     var category = result[i].category
                     var send = result[i].send
                     var time = result[i].time
                     var _id = result[i]._id
                     var _num = 1;
                     if(category == 1){ cat = "아이디 정보/보안"}
                     if(category == 2){ cat = "이벤트" }
                     if(category == 3){ cat = "기타" }

        			   html         += "<tr>";
        			   html         += '<td style="text-align: center;">' + _id + '</td>';
        			   html         += '<td style="text-align: center;">' + cat + '</td>';
        			   html         += '<td style="text-align: center; padding-left:30px;">';
        			   html         += '<div class="cc">';
        			   html         += '<a href ="/readNote?_id='+_id +'">'+ title +'</a>';
        			   html         += '</div></td>';
        			   html         += '<td style="width:170px; text-align: center;">'+ send +'</td>';
        			   html         += '<td style="width:200px; text-align: center;">'+ time +'</td>';
        			   html         += "</tr>";
                      }
                      console.log(html);
                        $('#noteList').html( html );
        		   })
        		   .fail(function(error, textStatus, errorThrown ) {
        			   console.log ( error );
        			   alert('Error:' + error)
        		   });
}

$(function(){
          $("#category").change(function(e){
              	  console.log(e);
              		  const search = $('#search > option:selected').val();
              	         switch(search){
              	         case 'all':
              	        	 caselist();
              	        	 break;
              	         case '1':
              	        	 caselist(1);
              	        	 break;
              	         case '2':
              	        	 caselist(2)
              	        	 break;
              	         case '3':
                               caselist(3)
                               break;
              	         }

                })

})

        </script>
    </head>
    <body>


        <section>
            <div id="main_content">
                <div id="message_box">
                    <h3>
                       1:1 문의함(관리자용)
                    </h3>


                    <div>
                                        <select id = "category" name="category">
                                            <option selected="selected" value="all">전체</option>
                                            <option value="1">아이디 정보/보안</option>
                                            <option value="2">이벤트</option>
                                            <option value="3">기타</option>
                                        </select></span>


      <table class="table_box" >
	<colgroup><col width="10%">
		<col width="20%">
		<col width="30%">
		<col width="20%">
		<col width="20%">
	</colgroup>

	<thead>
		<tr>
		    <th>번호</th>
		    <th>카테고리</th>
		    <th>제목</th>
			<th>보낸사람</th>
			<th>등록일</th>

		</tr>
	</thead >
	        <tbody id = "noteList">

	        </tbody>

</table>
<div style="text-align: center;">
<c:if test="${page.prev}">
 <span>[ <a href="/inquirylistForm?num=${page.startpagenum-1}">이전</a> ]</span>
</c:if>

<c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
  <span>
   <c:if test="${select != num}">
         <a href="/inquirylistForm?num=${num}">${num}</a>
        </c:if>

        <c:if test="${select == num}">
         <b>${num}</b>
        </c:if>
 </span>
</c:forEach>

<c:if test="${page.next}">
 <span>[ <a href="inquirylistForm?num=${page.endpagenum + 1}">다음</a> ]</span>
</c:if>
</div>

                        <!-- 쪽지함 이동 버튼들 -->
                        <ul class="buttons">
                            <li><button onclick="location.href='/SendMessage?send=1234&num=1'">삭제</button></li>

                        </ul>
                    </div>

                </div>
            </div>
        </section>

    </body>
</html>