<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>받은 쪽지함</title>

        <link rel="stylesheet" href="/css/messageBox.css">
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

        <script>


        		   $.ajax( {
        			   url  :  '/getsendnote?send=1234&num=${num}'  ,
        			   data :  {
        				   _id : $('#_id').val() ,
        				   content : $('#content').val(),
        				   recept : $('#recept').val() ,
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
                     var content = result[i].content
                     var recept = result[i].recept
                     var time = 1234

                     console.log(recept + "i = " + result[i].content)


        			   html         += "<tr>";
        			   html         += '<td></td>';
        			   html         += '<td style="text-align: center;">' + _id + '</td>';
        			   html         += '<td style="text-align: center; padding-left:30px;">';
        			   html         += '<div class="cc">';
        			   html         += '<a href ="/readNote?_id='+_id +'">'+ content +'</a>';
        			   html         += '</div></td>';
        			   html         += '<td style="width:170px; text-align: center;">'+ recept +'</td>';
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





        </script>
    </head>
    <body>


        <section>
            <div id="main_content">
                <div id="message_box">
                    <h3>
                       보낸 쪽지함
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
		<tr>
		    <th></th>
		    <th>번호</th>
		    <th>내용</th>
			<th>받는사람</th>
			<th>등록일</th>

		</tr>
	</thead >
	        <tbody id = "noteList">

	        </tbody>

</table>
<div style="text-align: center;">
<c:if test="${page.prev}">
 <span>[ <a href="/sendNote?send=1234&num=${page.startpagenum-1}">이전</a> ]</span>
</c:if>

<c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
  <span>
   <c:if test="${select != num}">
         <a href="/sendNote?send=1234&num=${num}">${num}</a>
        </c:if>

        <c:if test="${select == num}">
         <b>${num}</b>
        </c:if>
 </span>
</c:forEach>

<c:if test="${page.next}">
 <span>[ <a href="/sendNote?send=1234&num=${page.endpagenum + 1}">다음</a> ]</span>
</c:if>
</div>

                        <!-- 쪽지함 이동 버튼들 -->
                        <ul class="buttons">
                            <li><button onclick="location.href='/SendMessage?send=1234&num=1'">삭제</button></li>
                            <li><button onclick="location.href='/receptNote?recept=1234&num=1'">받은 쪽지함</button></li>
                            <li><button onclick="location.href='/writeNoteForm'">쪽지 보내기</button></li>
                        </ul>
                    </div>

                </div>
            </div>
        </section>

    </body>
</html>