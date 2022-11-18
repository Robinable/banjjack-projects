<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String username = request.getParameter("username"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>작성글</title>

    <style>

        td                {padding:2px}
        td:nth-of-type(1) {width:75px;}
        td:nth-of-type(2) {width:70px;}
        #content          {height:500px; width:700px;  text-align:left; vertical-align:top; padding: 10px;}
        .left             { text-align:left !important;}
        .center           { text-align:center !important;}
        .right            { text-align:right !important;}
        .rounded-pill     {background:#fdf100;}
        .title            {border-bottom: 1pt solid black;}

        .layer            { text-align: center; }
        .layer .content   { display: inline-block; }

    </style>


    <%@ include file="/WEB-INF/views/header.jsp" %>
</head>

<body>

<div class="layer">
    <div class="btn-group layer" role="group" aria-label="Basic outlined example">
        <a  href="/list?category=1&num=1&menu_id=2" class="btn btn-outline-primary"> 개 </a>
        <a  href="/list?category=2&num=1&menu_id=2" class="btn btn-outline-primary"> 고양이 </a>
        <a  href="/list?category=3&num=1&menu_id=2" class="btn btn-outline-primary"> 기타 </a>
        <a  href="/list?category=&num=1&menu_id=2" class="btn btn-outline-primary"> 전체 </a>
    </div>
</div>

<div><br></div>

<div class="layer" id="div2">
</div>

<c:import url="/comment" >
    <c:param name="content_id" value="${_id}"/>
    <c:param name="menu_id" value="0"/>
</c:import>

<script>
    let loginUsername = "${user.username}"

    $.ajax( {
        url  :  '/getview?_id=' + ${_id} ,
        data :  {
            _id : $('#_id').val() ,
            title : $('#title').val(),
            content : $('#content').val(),
            username : $('#username').val(),
            category : $('#category').val(),
            time : $('time').val(),
            readcount : $('#readcount').val(),
            filename : $('#filename').val(),
            filepath : $('#filepath').val(),
            bnum : $('#bnum').val(),
            lvl : $('#lvl').val(),
            step : $('#step').val(),

        },
        method   : "GET",
        dataType:  "json"
    } )
        .done(function( result, textStatus, xhr ) {
            var resultStr = JSON.stringify( result ); // JSOn -> string
            var html= "";

            for(var i = 0; i < result.length; i++  ){
                var _id = result[i]._id
                var title = result[i].title
                var content = result[i].content
                var username = result[i].username
                var category = result[i].category
                var time = result[i].time
                var readcount = result[i].readcount
                var filename = result[i].filename
                var filepath = result[i].filepath
                var bnum = result[i].bnum
                var lvl = result[i].lvl
                var step = result[i].step

                html += '<table class="content">';
                html += '<tr>';
                if(category == '1'){
                    html += '<td class="rounded-pill center" >강아지</td>';
                }
                else if(category =='2') {
                    html += '<td class="rounded-pill center">고양이</td>';
                }
                else if(category =='3') {
                    html += '<td class="rounded-pill center">기타</td>';
                }
                html += '<td colspan="4"></td>';
                html += '</tr>';
                html += '<tr class="bottom-border">';
                html += '<td colspan="6" class="left border-bottom"><h2>' + title + '<h2></td>';
                html += '<tr/>';
                html += '<tr>';
                html += '<td class="left border-bottom bg">작성자 :</td>';
                html += '<td class="left border-bottom bg">' + username + '</td>';
                html += '<td class="border-bottom bg">조회수 :</td>';
                html += '<td class="left border-bottom bg">' + readcount   + '</td>';
                html += '<td class="border-bottom bg">작성일 :</td>';
                html += '<td class="left border-bottom bg">' + time   + '</td>';
                html += '</tr>';
                html += '<tr>';
                html += '<td colspan="6" class="border-bottom" id="content">' +  content ;
                if(filepath != null){
                    html += '<br><img src="' + filepath + '" style="width:50%; height:60%;">'
                }
                html += '</td>';
                html += '</tr>';
                html += '<tr>';
                html += '<td  class="right" colspan="6">'
                html += '<div class="btn-group" role="group" aria-label="Basic outlined example"><a href="/list?category=' + category + '&num=1&menu_id=2" class="btn btn-outline-primary"> 게시판 </a>'
                console.log("글쓴이" + username );
                console.log("로그인유저" + loginUsername );
                //console.log("로그인유저" + ${user.username} );

                if(loginUsername != ""){
                    console.log("1번");
                    html += '<a href="/writeform?username=${user.username}&_id='+_id+'&bnum='+ bnum +'&lvl='+ lvl +'&step='+ step +'" class="btn btn-outline-primary" >답글쓰기</a>'
                    if(username === loginUsername) {
                        console.log("2번");
                        html +=  '<a href="/updateForm?_id=' + _id + '&menu_id=2" id="update" class="btn btn-outline-primary"> 수정 </a>'
                        html +=  '<a href="/delete?_id=' + _id + '&category=' + category + '" class="btn btn-outline-primary"> 삭제 </a>'
                    }
                }
                html += '</div>'
                html += '</td>'
                html += '</tr>'
                html += '</table>'
            };

            $('#div2').html(html);
        })
        .fail(function( error ) {
            console.log( error );
        });

</script>
</body>
</html>