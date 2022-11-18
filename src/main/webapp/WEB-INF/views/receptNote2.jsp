<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>받은 쪽지함</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <%--        <link rel="stylesheet" href="/css/messageBox.css">--%>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <style>
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
            url  :  '/getreceptnote?recept=${user.username}&num=${num}'  ,
            data :  {
                _id : $('#_id').val(),
                content : $('#content').val(),
                send : $('#send').val(),
                time : $('#time').val(),
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
                    var send = result[i].send
                    var time = result[i].time
                    var readchk = result[i].readchk
                    var chk = '[읽지않음]'
                    if(readchk == 1){
                        chk='[읽음]'
                    }

                    console.log(send)
                    html         += "<tr>";
                    html         += '<td><input class="form-check-input" type ="checkbox" name = "RowCheck" value ="'+_id+'"</td>';
                    if(readchk == 1){
                        html         += '<td style="text-align: center; color:yellowgreen;" >[읽음]</td>';}
                    else{
                        html         += '<td style="text-align: center; color:gray;" >[읽지않음]</td>';}
                    html         += '<td style="text-align: center; padding-left:60px;">';
                    html         += '<div class="cc">';
                    html         += '<a href ="/readreceptNote?_id='+_id +'&send='+send+'">'+ content +'</a>';
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
        $(function(){
            var chkObj = document.getElementsByName("RowCheck");
            var rowCnt = chkObj.length;
            $("input[name = 'allCheck']").click(function(){
                var chk_listArr = $("input[name='RowCheck']");
                for (var i =0; i<chk_listArr.length; i++){
                    chk_listArr[i].checked = this.checked;
                }
            });
            $("input[name='RowCheck']").click(function(){
                if($("input[name='RowCheck']:checked").length == rowCnt){
                    $("input[name='allCheck']")[0].checked = true;
                }
                else{
                    $("input[name='allCheck']")[0].checked = false;
                }
            });
        });
        function deleteNote(){
            var valueArr = new Array();
            var list = $("input[name='RowCheck']");
            for(var i=0; i<list.length; i++){
                if(list[i].checked){
                    valueArr.push(list[i].value);
                }
            }  console.log(valueArr);
            if(valueArr.length ==0){
                alert("선택된 항목이 없습니다");
            }
            else{
                confirm("선택된 쪽지를 삭제하시겠습니까?");
                $.ajax({
                    url : '/selectDeleteNote',
                    type : 'post',
                    traditional : true,
                    data : {
                        valueArr:valueArr
                    },
                    success:function(e){
                        if(e=1){
                            alert('삭제했음');
                            location.replace('receptNote?recept=${user.username}');
                        }
                        else{
                            alert('삭제실패');
                        }
                    }
                })
            }
        }
    </script>
</head>
<body>


<section>
    <div id="main_content">
        <div id="message_box">
            <h3>
                받은 쪽지함
            </h3>


            <div>

                <table class="table" >


                    <thead class="table-light">
                    <tr>
                        <th><input class="form-check-input" type ="checkbox" name = "allCheck"></th>
                        <th>읽음표시</th>
                        <th>내용</th>
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
            <a href="/receptNote?recept=${user.username}&num=${page.startpagenum - 1}" class="page-link">이전
            <span aria-hidden="true"></span>
            </a>
          </c:if>
      </li>
      <c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
          <c:if test="${select != num}">
          <li class="page-item">
            <a href="/receptNote?recept=${user.username}&num=${num}" class="page-link">${num}</a>
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
            <a href="/receptNote?recept=${user.username}&num=${page.endpagenum + 1}" class="page-link">다음
            <span aria-hidden="true"></span>
            </a>
        </li>
      </c:if>
    </ul>
  </span>
                </div>
                <!-- 쪽지함 이동 버튼들 -->
                <ul class="buttons">
                    <li><button class="btn btn-primary btn-sm" onclick= "deleteNote();">선택 삭제</button></li>
                    <li><button class="btn btn-primary btn-sm" onclick="location.href='/sendNote?send=${user.username}&num=1'">보낸 쪽지함</button></li>
                    <li><button class="btn btn-primary btn-sm" onclick="location.href='/writeNoteForm'">쪽지 보내기</button></li>
                </ul>
            </div>

        </div>
    </div>
</section>

</body>

</html>