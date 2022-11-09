<%@ page language="java" contentType="text/html; charset=UTF-8"
              pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>지난 이벤트 게시판</title>

        <link rel="stylesheet" href="/css/messageBox2.css">
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

        <script>


        		   $.ajax( {
        			   url  :  '/getpasteventlist?num=${num}'  ,
        			   data :  {
                           _id : $('#_id').val() ,
        				   writer : $('#writer').val() ,
        				   title : $('#title').val(),
        				   time : $('#time').val() ,
        				   start_time : $('#start_time').val() ,
        				   end_time : $('#end_time').val() ,
        		       },
        		       method   : "GET",
        		       dataType:  "json"
        		   } )
        		   .done(function( result, textStatus, xhr ) {
        			   console.log( result );
        			   var resultStr = JSON.stringify( result ); // JSOn -> string

                        var html= "";
        			  for(var i = 0; i < result.length; i++ ) {
        			 var _id = result[i]._id
                     var writer = result[i].writer
                     var title = result[i].title
                     var start_time = result[i].start_time
                     var end_time = result[i].end_time

                     var _num = i

                     console.log(writer)


        			   html         += "<tr>";
        			   html         += '<td style="text-align: center;">' +(_num+1)+ '</td>';
        			   html         += '<td style="text-align: center;">이미지들어갈곳</td>';
        			   html         += '<td style="text-align: center; padding-left:30px;">';
        			   html         += '<div class="cc">';
        			   html         += '<a href ="/noticecontform?_id='+_id +'" style="text-align: center;">'+ title +'</a>';
        			   html         += '</div></td>';
        			   html         += '<td style="width:200px; text-align: center;">'+start_time+'~'+end_time +'</td>';
        			   html         += '<td style="width:170px; text-align: center;">'+ writer +'</td>';
        			   html         += "</tr>";
                      }
                      console.log(html);
                        $('#noticeList').html( html );
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
                    <h3>
                      종료된 이벤트
                    </h3>

                            <li><button onclick="location.href='/eventlistform?num=1'">전체 이벤트</button></li>
                            <li><button onclick="location.href='/noweventlist?num=1'">진행중인 이벤트</button></li>
                    <div>

      <table class="table_box" >
	<colgroup><col width="5%">
		<col width="20%">
		<col width="40%">
		<col width="25%">
		<col width="20%">
	</colgroup>

	<thead>
		<tr>
		    <th>No</th>
		    <th>이미지</th>
		    <th>제목</th>
			<th>이벤트 기간</th>
			<th>작성자</th>
		</tr>
	</thead >
	        <tbody id = "noticeList">

	        </tbody>

</table>

<div style="text-align: center;">
<c:if test="${page.prev}">
 <span>[ <a href="/eventlist?num=${page.startpagenum - 1}">이전</a> ]</span>
</c:if>

<c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
  <span>
   <c:if test="${select != num}">
      <a href="/eventlist?num=${num}">${num}</a>
     </c:if>

     <c:if test="${select == num}">
      <b>${num}</b>
     </c:if>
 </span>
</c:forEach>

<c:if test="${page.next}">
 <span>[ <a href="/eventlist?num=${page.endpagenum + 1}">다음</a> ]</span>
</c:if>
</div>

                        <!-- 쪽지함 이동 버튼들 -->
                        <ul class="buttons">


                            <li><button onclick="">글쓰기</button></li>
                        </ul>
                    </div>

                </div>
            </div>
        </section>

    </body>
</html>