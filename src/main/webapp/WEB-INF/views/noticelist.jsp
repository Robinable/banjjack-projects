<%@ page language="java" contentType="text/html; charset=UTF-8"
              pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공지사항</title>

        <link rel="stylesheet" href="/css/messageBox2.css">
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

        <script>


        		   $.ajax( {
        			   url  :  '/getnoticelist'  ,
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
                     var writer = result[i].writer
                     var title = result[i].title
                     var readcount = result[i].readcount
                     var time = result[i].time
                     var num = i

                     console.log(writer)


        			   html         += "<tr>";
        			   html         += '<td>' +(num+1)+ '</td>';
        			   html         += '<td style="text-align: center;">' + writer + '</td>';
        			   html         += '<td style="text-align: center; padding-left:30px;">';
        			   html         += '<div class="cc">';
        			   html         += '<a href ="">'+ title +'</a>';
        			   html         += '</div></td>';
        			   html         += '<td style="width:170px; text-align: center;">'+ time +'</td>';
        			   html         += '<td style="width:200px; text-align: center;">'+ readcount +'</td>';
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
	        <tbody id = "noteList">

	        </tbody>

</table>
<hr>
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