<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <style>
        table             {margin:100px auto;}
        tr:nth-of-type(4) {text-align: right;}
        td                {padding:3px}
        td:nth-of-type(1) {width:500px; text-align: right;}
        td:nth-of-type(2) {width:80px;}
        textarea          {width:100%; height:400px; resize:none; border-radius: 8px;}
        input[type=text]  {border:1px solid; width:100%; height:30px; border-radius: 8px;}
        .left             { text-align:left !important;}
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

<!-- ( get방식에는 enctype이 없기때문에 null을 반환한다 ) -->
<form action="/write_insert" id="form" encType = "multipart/form-data" method="post" >
    <input type="hidden" name="username"  value=${username} />
    <input type="hidden" name="_id"       value=${_id} />
    <input type="hidden" name="bnum"      value=${ bnum } />
    <input type="hidden" name="lvl"       value=${ lvl  } />
    <input type="hidden" name="step"      value=${ step } />
    <input type="hidden" name="readcount" value="0" />

    <table>

        <c:choose>
        <c:when test="${ lvl eq 0 }" >
        <tr>
            <td class="left" colspan = "4"><h2> 새 글 쓰기 </h2></td>
        </tr>
        <tr>
            <td>
                <input type="text" name="title" placeholder="제목을 입력하세요" maxLength="20" >
            </td>
            <td>카테고리 :</td>
            <td>
                <select class="form-select" size="1" name="category" >
                    <option name="info" value="0">선택하세요.</option>
                    <option name="info" value="1">강아지</option>
                    <option name="info" value="2">고양이</option>
                    <option name="info" value="3">기타</option>
                </select>
            </td>
        </tr>

        <tr>
            <td colspan="3">
                <textarea maxLength="500" name= "content" placeholder="내용을 입력하세요" value="content"></textarea>
            </td>
        </tr>
        </c:when>

        <c:otherwise>
        <tr id="reply"></tr>
        </c:otherwise>
        </c:choose>

        <tr>
        <td colspan="3">
            <div class="container">
                <div class="image-upload" id="image-upload">
                    <label class="w-80" style="cursor:pointer;">
                      <span>
                        <input type="file" id="chooseFile" name="file" class="form-control" accept="image/*" onchange="loadFile(this)">
                      </span>
                    </label>
                    <div class="fileContainer">
                        <div class="fileInput">
                            <p id="fileName"></p>
                        </div>
                        <div class="buttonContainer"></div>
                    </div>
                </div>
                <div class="image-show" id="image-show"></div>
            </div>
        </td>
        </tr>
</form>
<tr>
    <td colspan="3">
        <input type="submit" id="submit" class="btn btn-primary" value="저장"  />
        <a href="/list?category=&num=1&menu_id=2" class="btn btn-primary">게시판</a>
        <a class="btn btn-primary">삭제</a>
    </td>
</tr>
</table>

<script>
        cnt = 0

        $.ajax( {
            url  :  '/viewupdate?_id=' + ${_id} ,
            data :  {
                _id : $('#_id').val() ,
                title : $('#title').val(),
                content : $('#content').val(),
                username : $('#username').val(),
                category : $('#category').val(),
                bnum : $('#bnum').val(),
                lvl : $('#lvl').val(),
                step : $('#step').val(),
            },
            method   : "GET",
            dataType:  "json"
        })
            .done(function( result, textStatus, xhr ) {
                var resultStr = JSON.stringify( result ); // JSOn -> string
                var html= "";

                for(var i = 0; i < result.length; i++  ){
                    var _id = result[i]._id
                    var title = result[i].title
                    var content = result[i].content
                    var username = result[i].username
                    var category = result[i].category
                    var bnum = result[i].bnum
                    var lvl = result[i].lvl
                    var step = result[i].step

                    html += '<tr>';
                    html += '<td class="left"  colspan = "4"><h2> 답 글 쓰기 </h2></td>';
                    html += '</tr>';
                    html += '<tr>';
                    html += '<td><input type="text" name="title" maxLength="20" value="'+title+'" ></td>';
                    html += '<td> 카테고리: </td>';
                     if(category == '1'){
                        html += '<td> 강아지 </td>';
                        html += '<input type="hidden" name="category" value="1" />';
                        }
                     else if(category =='2') {
                        html += '<td> 고양이 </td>';
                        html += '<input type="hidden" name="category" value="2" />';
                        }
                     else if(category =='3') {
                        html += '<td> 기타 </td>';
                        html += '<input type="hidden" name="category" value="3" />';
                        }
                    html += '</tr>';
                    html += '<tr>';
                    html += '<td colspan="3"><textarea maxLength="500" name= "content" >'+ content + '\n====================\n</textarea></td>';
                    html += '</td>';
                    html += '</tr>';
                };

                $('#reply').html(html);
            })
            .fail(function( error ) {
                console.log( error );
            });


        $(function(){
                    $('form').on('submit', function(e){
                        if( $('[name=title]').val() == ''){
                            alert('제목을 입력하세요');

                            e.preventDefault();
                            e.stopPropagation();
                            return start;
                        }
                        if( $('[name=category]').val() == '0'){
                            alert('카테고리를 선택하세요');

                            e.preventDefault();
                            e.stopPropagation();
                            return start;
                        }
                        if( $('[name=content]').val() == ''){
                            alert('내용을 입력하세요');
                            e.preventDefault();
                            e.stopPropagation();
                            return start;
                        }
                    });

                    $('#form').on('submit', function(e) {
                            cnt++
                            if(cnt > 1) {
                               e.preventDefault(); // 먼저수행하고 기능 구현
                               e.stopPropagation();
                               }
                    });
                });


        function loadFile(input) {
            var file = input.files[0];

            var newImage = document.createElement("img");
            newImage.setAttribute("class", 'img');

            newImage.src = URL.createObjectURL(file);

            newImage.style.width = "30%";
            newImage.style.height = "30%";
            newImage.style.objectFit = "contain";

            var container = document.getElementById('image-show');
            container.appendChild(newImage);
        };

</script>

</body>
</html>