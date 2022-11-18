<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<% String username = request.getParameter("username"); %>--%>
<%--<% String content_id = request.getParameter("_id"); %>--%>


<head>
    <title>on progress</title>

    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
          rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/comment.css">

    <script>

        let query = window.location.search;
        let params = new URLSearchParams(query);
        let content_id='${param.content_id}';
        let menu_id='${param.menu_id}';
        let num = params.get('num');
        let i=0;
        if (num==null) {
            num = 1;
        }
        console.log("ci"+"${param.content_id}");
        console.log("mi"+"${param.menu_id}");

        $(document).ready(function() {
            fnCommentList(num);
        });
        //리스트조회
        function fnCommentList(num) {
            console.log("num"+num);
            $("#commentListBox").empty();
            $("#pagingBox").empty();
            $.ajax({
                url: "/comment/commentList",
                type: "get",
                data: { 'content_id' : content_id,
                    'menu_id' : menu_id,
                    'num' : num },

                error: function (xhr) {
                    console.log(xhr)
                },
                success: function (data) {
                    console.log(data);
                    let next = data[0].next;
                    let startPageNum = Number(data[0].startPageNum);
                    let select = Number(data[0].num)*1;
                    let endPageNum = Number(data[0].endPageNum);
                    let num = Number(data[0].num);
                    let prev = data[0].prev;
                    let commentCount = Number(data[0].commentCount);
                    console.log(next, num, select, endPageNum);
                    let str = ""
                    let paging = "";


                    $.each(data, function (index, element) {
                        if(element.next == true || element.next ==false)
                            return;
                        str =str
                            + "<li class=\"list-group-item\" name= \"commentBigBox\">"
                            + "<input type=\"hidden\" name=\"_id\" value=\'" + element._id + "\'>"
                            + "<div class=\"commentIcon\">"
                            + "<span class=\"material-icons-outlined\">"
                        //프로필 임시 주석처리
                        // if (element.profiledata == '') {
                        //     str = str
                        //         + "<img id=\"preview\" src=\"/img/icon_unknownUser.png\"/>"
                        // }else{
                        //     str = str
                        //         + '<img id=\"preview\" src=\"http://donipop.com:8000/img/'+element.profiledata+'"/>'
                        // }
                        str = str
                            + "</span>"
                            + " <br>"
                            + "<span class=\"commentDate\">"
                            + element.time
                            + "</span>"
                            + "</div>"
                            + "<div class=\"commentBox\">"
                            + "<span class=\"comWriter\">"
                            + element.name
                            + "</span>"
                        if(element.name == "${user.username}" ) {
                            str=str
                                +"<span class=\"buttonSpan\">"
                                + "<button class=\"btn btn-outline-secondary\" onClick=\"fnDelClick(" + element._id + ")\" style=' font-size: 13px;width: 55px; height: 30px;'> 삭제 </button>"
                                + "<button class=\"btn btn-outline-secondary\" onClick=\"fnEditClick(" + element._id + ")\"style=' font-size: 13px;width: 55px; height: 30px;' > 수정 </button>"
                                +"</span>"
                        }

                        str=str
                            + "<div class=\"commentText\" id= \'" + element._id + "\' style= \"white-space:pre-wrap\" >"
                            +  element.content
                            + "<br>"
                            + "</div>"
                            + "</div>"
                            + "</li>"
                    })
                    console.log("ep1/"+endPageNum)
                    //페이징
                    if (prev === true){
                        startPageNum=Number(startPageNum)-1;
                        console.log(startPageNum)
                        paging+="<li class=\"page-item\"><a href=\"javascript:void(0)\" onClick=\"fnCommentList("+ startPageNum + ");\" return false; class=\"page-link\" id=\"prev\">이전</a></li>"
                            +"<span aria-hidden=\"true\"></span>"
                    }
                    for(let num=startPageNum; num<=endPageNum; num++) {
                        if (select != num) {
                            paging += "<li class=\"page-item\"><a href=\"javascript:void(0)\" onClick=\"fnCommentList(" + num + ");\" return false; class=\"page-link\">"+num+"</a></li>"
                        } else {
                            paging += " <li class=\"page-item active\" aria-current=\"page\"><a href=\"#\"class=\"page-link\">"+num+"</li>"
                        }
                    }
                    if (next === true) {
                        endPageNum=Number(endPageNum)+1;
                        paging += "<li class=\"page-item\"><a href=\"javascript:void(0)\" onClick=\"fnCommentList(" +endPageNum + ");\" return false; class=\"page-link\" id=\"next\">다음</a></li>"
                            + "<span aria-hidden=\"true\"></span>"
                    }
                    console.log("ep2/"+endPageNum)

                    console.log("ep3/"+endPageNum+1);
                    document.getElementById('count').textContent = commentCount;
                    document.getElementById('commentListBox').innerHTML += str;
                    document.getElementById('pagingBox').innerHTML += paging;
                } //리스트조회
            })
        }
        //쓰기
        $(document).ready(function() {
            $('#commentWriteButton').click(function () {
                let commentWriteData = {
                    'username': $('#commName').val(),
                    'content_id': content_id,
                    'content': $('#commContent').val(),
                    'menu_id': menu_id
                }
                $.ajax({
                    url: "/comment/writeComment",
                    type: "post",
                    data:  commentWriteData,
                    error: function (xhr) {
                    },
                    success: function (data) {
                        if (data.result =="loginFail") {
                            alert("로그인하세요!")
                            window.location.href = "/login";
                        }else {
                            $("#commentListBox").empty();
                            fnCommentList(num);
                            $("#commContent").val('');
                            document.getElementById('countNum').innerHTML = '( 0/ 300)';
                        }
                    }
                });
            }); //등록버튼
        });

        //삭제버튼
        function fnDelClick(_id) {
            $.ajax({
                url: "/comment/deletecomment/",
                type: "post",
                data: {"_id" : _id,
                    "menu_id": menu_id },
                error: function (xhr) {
                },
                success: function (result) {
                    $("#commentListBox").empty();
                    fnCommentList(num);
                }
            });
        } //삭제버튼

        //수정버튼
        function fnEditClick(_id) {
            var content = document.getElementById(_id)
            let updateform = "";
            updateform += "<input type=\"hidden\" id=\"updateCommName\" name=\"username\" value=\"${user.username}\">";
            updateform += "<input type=\"hidden\" id=\"updateComm_id\" name=\"_id\" value= _id>";
            updateform += "<textarea id=\"updateCommentInput\" name=\"updateCommentContent\" cols=\"80\" rows=\"3\">";
            updateform += content.textContent
            updateform += "</textarea>";
            updateform += "<button class=\"btn btn-outline-secondary\" onClick=\"fnCommentUpdate(" + _id + ")\"> 수정 </button>";
            updateform += "<button class=\"btn btn-outline-secondary\" onClick= \"fnCommentUpdateCancel()\" > 취소 </button>";
            document.getElementById(_id).innerHTML = updateform;
        }

        function fnCommentUpdate(_id) {
            let commentUpdateData = {
                'username': $('#updateCommName').val(),
                'content': $('#updateCommentInput').val(),
                'menu_id': menu_id,
                '_id': _id
            }
            $.ajax({
                url: "/comment/updatecomment/",
                type: "post",
                data: commentUpdateData,
                error: function (xhr) {
                    alert("?");
                },

                success: function (data) {
                    $("#commentListBox").empty();
                    fnCommentList(num);
                }
            })
        }
        function fnCommentUpdateCancel(){
            $("#commentListBox").empty();
            fnCommentList(num);
        }

    </script>
</head>
<div class="container" style="width: 700px;">

<br>
<div class="commentCount"> 댓글 <span id = "count"></span></div>
<br>
<%--댓글리스트 출력부--%>
<ul class="list-group list-group-flush" id="commentListBox">

</ul>
<%--댓글페이징--%>
<nav aria-label="Page navigation">
    <div class="center">
        <ul class="pagination" id="pagingBox">

        </ul>
    </div>
</nav>




<!--댓글 입력부 -->

<div class="commentInputBox">
    <%--            <form  action="/comment/writeComment" id="writecom1" method="post" >--%>
    <input type="hidden" id="commName" name="username" value="${user.username}">
    <%--            <input type="hidden" id="commCont_id" name="content_id" value="1">--%>
    <%--            <input type="hidden" id="commTime" name="time" value="">--%>
    <textarea class="commentInput" id="commContent" name="content" cols="70" rows="3" ></textarea>
    <span class="regBtn">
        <button type="submit" class="btn btn-secondary btn-lg" id= commentWriteButton > 등록</button>
    </span>
    <br>
    <span id="countNum">
        ( 0/ 300)
    </span>
    <%--            </form>--%>
</div>


<script>

    $('.commentInput').on('keyup', function() {
        $('#countNum').html("("+$(this).val().length+" / 300)");

        if($(this).val().length > 300) {
            $(this).val($(this).val().substring(0, 300));
            $('.countNum').html("(300 / 300)");
            alert("300자가 초과되었습니다")
        }
    });
</script>

</div>