<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="header.jsp"%>
    <title>내가 쓴 1대1문의</title>

    <%--  <link rel="stylesheet" href="/css/messageBox2.css">--%>

    <style>

        h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
        #main_content{width: 90%; height: 80%; margin: 0 auto;}
        li{list-style: none; margin-top: 10px; }
        #message_box {width: 800px; margin: 30px 150px; }
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
            url  :  '/inquirymylist?send=${user.username}&num=${num}'  ,
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
                    var bnum = result[i].bnum
                    var lvl = result[i].lvl
                    var step = result[i].step
                    var _num = 1;
                    if(category == 1){ cat = "아이디 정보/보안"}
                    if(category == 2){ cat = "이벤트" }
                    if(category == 3){ cat = "기타" }

                    html         += "<tr>";
                    html         += '<td style="text-align: center;">' + _id + '</td>';
                    html         += '<td style="text-align: center;">' + cat + '</td>';
                    html         += '<td style="text-align: center; padding-left:30px;">';
                    html         += '<div class="cc">';
                    if(lvl > 1){
                        html         += '<a href ="/inquirycont?_id='+_id +'">'+ title +'</a>';
                    } else {
                        html         += '<a href ="/inquirycont?_id='+_id +'">'+ title +'</a>';
                    }
                    html         += '</div></td>';
                    html         += '<td style="width:170px; text-align: center;">'+ send +'</td>';
                    html         += '<td style="width:200px; text-align: center;">'+ time +'</td>';
                    html         += "</tr>";
                }

                $('#noteList').html( html );
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
            <h3>
                내가 쓴 1대1문의
            </h3>
            <div id="message_box">


                <div>


                    <table class="table" >

                        <thead class="table-light">
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
                    <div class="layer">
  <span class="content">
    <ul class="pagination">
      <li class="page-item">
          <c:if test="${page.prev}">
            <a href="/inquirymylistForm?num=${page.startpagenum - 1}" class="page-link">이전
            <span aria-hidden="true"></span>
            </a>
          </c:if>
      </li>
      <c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
          <c:if test="${select != num}">
          <li class="page-item">
            <a href="/inquirymylistForm?num=${num}" class="page-link">${num}</a>
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
            <a href="/inquirymylistForm?num=${page.endpagenum + 1}" class="page-link">다음
            <span aria-hidden="true"></span>
            </a>
        </li>
      </c:if>
    </ul>
  </span>
                    </div>
                    <!-- 쪽지함 이동 버튼들 -->
                    <ul class="buttons">
                        <li><a class="btn btn-primary btn-sm" href='/writeinquiryForm?&bnum=0&lvl=0&step=0'>1대1문의</a></li>

                    </ul>
                </div>

            </div>
        </div>
    </section>
</div>
</body>
</html>