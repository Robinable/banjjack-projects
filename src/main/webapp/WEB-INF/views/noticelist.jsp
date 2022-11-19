<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="header.jsp"%>
    <title>공지사항</title>
    <style>

        h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
        #main_content{width: 90%; height: 80%; margin: 0 auto;}
        li{list-style: none; margin-top: 10px; }
        #message_box {width: 800px; margin: 30px 150px; }
        a { text-decoration-line: none; color: black; }
        .cc {
            width:200px;
            padding:0 5px;
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;}
        #main_content{width: 90%; height: 80%; margin: 0 auto;}
        #message_box h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
        #message_box .buttons {text-align: right; margin: 20px 0 40px 0;}
        #message_box .buttons li {display: inline;}
        th{text-align: center;}
        body { overflow: hidden; }

        .layer            { text-align: center; }
        .layer .content   { display: inline-block; }
    </style>

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
                    html         += '<td style="text-align: center; padding-left:50px;">';
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
<div class="container">

    <section>
        <div id="main_content">
            <div id="message_box">
                <h3>
                    공지사항
                </h3>


                <div>

                    <table class="table" >


                        <thead class="table-light">
                        <tr>
                            <th>No</th>
                            <th>작성자</th>
                            <th>제목</th>
                            <th>날짜</th>
                            <th>조회수</th>
                        </tr>
                        </thead >
                        <tbody id = "noticeList">

                        </tbody>

                    </table>

                    <div class="layer">
  <span class="content">
    <ul class="pagination">
      <li class="page-item">
          <c:if test="${page.prev}">
            <a href="/noticeList?num=${page.startpagenum - 1}" class="page-link">이전
            <span aria-hidden="true"></span>
            </a>
          </c:if>
      </li>
      <c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
          <c:if test="${select != num}">
          <li class="page-item">
            <a href="/noticeList?num=${num}" class="page-link">${num}</a>
          </li>
          </c:if>
          <c:if test="${select == num}">
          <li class="page-item active" aria-current="page">
            <a class="page-link" href="#">${num}</a>
          </li>
          </c:if>
      </c:forEach>
      <c:if test="${page.next}">
        <li class="page-item">
            <a href="/noticeList?num=${page.endpagenum + 1}" class="page-link">다음
            <span aria-hidden="true"></span>
            </a>
        </li>
      </c:if>
    </ul>
  </span>
                    </div>
                    <!-- 쪽지함 이동 버튼들 -->
                    <ul class="buttons">

                        <li><button id="adminlist" class="btn btn-primary" onclick="location.href='/writenoticeForm'">글쓰기 (관리자용)</button></li>
                    </ul>
                </div>

            </div>
        </div>
    </section>
    <script>

        if('${user.role}' != 'ADMIN'){
            $('#adminlist').css('display','none');
        }
    </script>
</div>
</body>
</html>