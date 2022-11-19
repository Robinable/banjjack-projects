<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="header.jsp"%>
    <title>1:1 문의함(관리자용)</title>
    <style>
        a { text-decoration-line: none; color: black; }
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

        #message_box h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
        #message_box .buttons {text-align: right; margin: 20px 0 40px 0;}
        #message_box .buttons li {display: inline;}
        th{text-align: center;}
        body { overflow: hidden; }
        .form-select{margin: 10px; width: 200px;}

        .layer .content   { display: inline-block; }
        .layer            { text-align: center; width:100%; }


    </style>

    <script>
        alllist()
        function alllist(){
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
                        html         += '<td style="text-align: center; color:gray;">' + cat + '</td>';
                        html         += '<td style="text-align: center; padding-left:30px;">';
                        html         += '<div class="cc">';
                        html         += '<a href ="/inquirycont?_id='+_id +'">'+ title +'</a>';
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

        function caselist(){
            $.ajax( {
                url  :  '/caselist?num=${num}' ,
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
                        html         += '<td style="text-align: center; color:gray;">' + cat + '</td>';
                        html         += '<td style="text-align: center; padding-left:30px;">';
                        html         += '<div class="cc">';
                        html         += '<a href ="/inquirycont?_id='+_id +'">'+ title +'</a>';
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
                const category = $('#category > option:selected').val();
                switch(category){
                    case 'all':
                        alllist();
                        break;
                    case '1':
                        caselist();
                        break;
                    case '2':
                        caselist()
                        break;
                    case '3':
                        caselist()
                        break;
                }

            })

        })


    </script>
</head>
<body>
<div class="container">

    <section>
        <div id="main_content" class="layer">
            <div id="message_box">
                <h3>
                    1:1 문의함(관리자용)
                </h3>

                <div>

                    <select class="form-select" id="category" name="category">
                        <option value="all" selected="selected">전체</option>
                        <option value="1">아이디 정보/보안</option>
                        <option value="2">이벤트</option>
                        <option value="3">기타</option>
                    </select>

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
            <a href="/inquirymylist?num=${page.startpagenum - 1}" class="page-link">이전
            <span aria-hidden="true"></span>
            </a>
          </c:if>
      </li>
      <c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
          <c:if test="${select != num}">
          <li class="page-item">
            <a href="/inquirymylist?num=${num}" class="page-link">${num}</a>
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
            <a href="/inquirymylist?num=${page.endpagenum + 1}" class="page-link">다음
            <span aria-hidden="true"></span>
            </a>
        </li>
      </c:if>
    </ul>
  </span>
                    </div>
                </div>

            </div>
        </div>
    </section>
</div>
</body>
</html>