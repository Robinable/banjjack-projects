<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <style>
        table             {margin:100px auto;}
        tr:nth-of-type(1) {width:100%; text-align:center;}
        td                {padding:3px}
        td:nth-of-type(1) {width:90px; text-align: center;}
        td:nth-of-type(2) {width:700px; text-align: left;}
        textarea          {width:100%; height:400px; resize:none; border-radius: 8px;}
        input[type=text]  {border:1px solid; width:100%; height:30px; border-radius: 8px;}
        a                 { text-decoration-line: none; color: black; }
        .left             { text-align:left !important;}
        .center           { text-align:center !important;}
        .right            { text-align:right !important;}
        .layer            { text-align: center; }
        .layer .content   { display: inline-block; }



    </style>
    <script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>

<%@ include file="/WEB-INF/views/header.jsp" %>
</head>
<body>

<div class="layer">
    <div class="btn-group layer" role="group" aria-label="Basic outlined example">
      <a  href="/list?category=1&num=1&menu_id=${menu_id}" class="btn btn-outline-primary"> 개 </a>
      <a  href="/list?category=2&num=1&menu_id=${menu_id}" class="btn btn-outline-primary"> 고양이 </a>
      <a  href="/list?category=3&num=1&menu_id=${menu_id}" class="btn btn-outline-primary"> 기타 </a>
      <a  href="/list?category=&num=1&menu_id=${menu_id}" class="btn btn-outline-primary"> 전체 </a>
    </div>
</div>

<table class="table" id="div1">
</table>
<div class="layer">
  <span class="content">
    <ul class="pagination">
      <li class="page-item">
          <c:if test="${page.prev}">
            <a href="/list?category=${category}&num=${page.startpagenum - 1}&menu_id=${menu_id}" class="page-link">이전
            <span aria-hidden="true"></span>
            </a>
          </c:if>
      </li>
      <c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
        <c:if test="${select != num}">
          <li class="page-item">
            <a href="/list?category=${category}&num=${num}&menu_id=${menu_id}" class="page-link">${num}</a>
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
            <a href="/list?category=${category}&num=${page.endpagenum + 1}&menu_id=${menu_id}" class="page-link">다음
            <span aria-hidden="true"></span>
            </a>
        </li>
      </c:if>
    </ul>
  </span>
</div>

<script>
        let loginUsername = "${user.username}"

        function header() {
            let header = '<thead>';
            header    += '<tr>';
            header    += '<th scope="col">번호</th>';
            header    += '<th scope="col">제목</th>';
            header    += '<th scope="col">글쓴이</th>';
            header    += '<th scope="col">카테고리</th>';
            header    += '<th scope="col">날짜</th>';
            header    += '<th scope="col">조회수</th>';
            header    += '</tr>';
            header    += '</thead>';
            header    += '<tbody class="table-group-divider">';
            return header;
        }

        $.ajax( {
            url  :  '/getlist?num=${num}&category=${category}&menu_id=${menu_id}' ,
            data :  {
                _id : $('#_id').val() ,
                title : $('#title').val(),
                username : $('#username').val(),
                category : $('#category').val(),
                time : $('time').val(),
                readcount : $('#readcount').val(),
                bnum : $('#bnum').val(),
                lvl : $('#lvl').val(),
                step : $('#step').val(),
                replycnt : $('#replycnt').val(),
            },
            method   : "GET",
            dataType:  "json"
        })
            .done(function( result, textStatus, xhr ) {
                console.log($('.category').val() );
                var resultStr = JSON.stringify( result ); // JSOn -> string
                var html= "";

                html     += header();
                for(var i = 0; i < result.length; i++  ){
                    var _id = result[i]._id
                    var title = result[i].title
                    var username = result[i].username
                    var category = result[i].category
                    var time = result[i].time
                    var readcount = result[i].readcount
                    var bnum = result[i].bnum
                    var lvl = result[i].lvl
                    var step = result[i].step
                    var replycnt = result[i].replycnt


                    html += '<tr>';
                    html += '<td>' + _id   + '</td>';
                        if(lvl > 1){
                            var space = lvl * 20
                            html += '<td> <a href="/viewform?_id=' + _id + '&category=' + category + '" style="padding-left:'+space+'px">[답글]' + title;
                                if(replycnt >0) {
                                  html += '<b>&nbsp('+replycnt+')</b>';
                                }
                            html += '</a> </td>';
                        } else {
                            html += '<td> <a href="/viewform?_id=' + _id + '&category=' + category + '">' +  title  ;
                                if(replycnt >0) {
                                  html += '<b>&nbsp('+replycnt+')</b>';
                                }
                            html += '</a> </td>';
                        }
                    html += '<td>' + username + '</td>';
                        if(category == '1'){
                            html += '<td> 강아지 </td>'; }
                        else if(category =='2') {
                            html += '<td> 고양이 </td>'; }
                        else if(category =='3') {
                            html += '<td> 기타 </td>';   }
                    html += '<td>' + time   + '</td>';
                    html += '<td>' + readcount  + '</td>';
                    html += '</tr>';
                    html += '</tbody>';
                };
                if( loginUsername != "") {
                    html += '<td class="right" colspan="6"><a href="/writeform?username=${user.username}&_id=0&bnum=0&lvl=0&step=0" class="btn btn-primary">새 글 쓰기</a></td>'
                    }
                html += '</table>'
                $('#div1').html(html);
            })
            .fail(function( error ) {
                console.log( error );
            });
    </script>
</body>
</html>