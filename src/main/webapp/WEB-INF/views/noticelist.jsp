<%@ page language="java" contentType="text/html; charset=UTF-8"
              pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공지사항</title>

        <link rel="stylesheet" href="/css/messageBox2.css">
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

        <script>


        		   $.ajax( {
        			   url  :  '/getnoticelist?num=${num}'  ,
        			   data :  {
        				   writer : $('#writer').val() ,
        				   title : $('#title').val(),
        				   readcount : $('#readcount').val() ,
        				   time : $('#time').val() ,
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
                     var readcount = result[i].readcount
                     var time = result[i].time
                     var _num = i

                     console.log(writer)


        			   html         += "<tr>";
        			   html         += '<td style="text-align: center;">' +(_num+1)+ '</td>';
        			   html         += '<td style="text-align: center;">' + writer + '</td>';
        			   html         += '<td style="text-align: center; padding-left:30px;">';
        			   html         += '<div class="cc">';
        			   html         += '<a href ="/noticecontform?_id='+_id +'" style="text-align: center;">'+ title +'</a>';
        			   html         += '</div></td>';
        			   html         += '<td style="width:170px; text-align: center;">'+ time +'</td>';
        			   html         += '<td style="width:200px; text-align: center;">'+ readcount +'</td>';
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
                       공지사항
                    </h3>


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
		    <th>글쓴이</th>
		    <th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead >
	        <tbody id = "noticeList">

	        </tbody>

</table>

<div style="text-align: center;">
<c:if test="${page.prev}">
 <span>[ <a href="/noticeList?num=${page.startpagenum - 1}">이전</a> ]</span>
</c:if>

<c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
  <span>
   <c:if test="${select != num}">
      <a href="/noticeList?num=${num}">${num}</a>
     </c:if>

     <c:if test="${select == num}">
      <b>${num}</b>
     </c:if>
 </span>
</c:forEach>

<c:if test="${page.next}">
 <span>[ <a href="/noticeList?num=${page.endpagenum + 1}">다음</a> ]</span>
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