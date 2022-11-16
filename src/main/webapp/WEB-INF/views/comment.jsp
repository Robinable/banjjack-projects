<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<% String username = request.getParameter("username"); %>--%>
<%--<% String content_id = request.getParameter("_id"); %>--%>

<!DOCTYPE html>

<html>
<head>
    <title>on progress</title>
    <c:out value="${param.menu_id}/"></c:out>
    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
          rel="stylesheet">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <style>
        div.commentListBox { width:600px; height: auto ; }
        div.commentBigBox { padding-bottom: 20px; display: inline-block;}
        div.commentIcon { float:left; width:50px; position : relative ;
            margin-top: auto ; margin-bottom: auto; margin-left:1px ;
            text-align: center;}
        div.commentBox { float:right; width:530px; }
        div.commentText { width:600px; display: flex ; flex-direction: column;}
        span.comWriter > input { width:100px ; border:none; font-weight: 600; font-size: large;}
        div.commentText { width:540px; margin-top:2px;}
        div.commentInputBox{width:600px; margin-top:30px;}
        span.commentDate > input { border:none;}
        textarea { width:600px; resize:none; }
        div.regBtn { float:right;}
    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>

        let query = window.location.search;
        let params = new URLSearchParams(query);
        let content_id = params.get('_id');
        let menu_id='${param.menu_id}';
        let num = params.get('num');
        if (num=="") {
            num = 1;
        }
        $(document).ready(function() {
            fnCommentList();
        });
        //리스트조회
        function fnCommentList() {
            $.ajax({
                url: "/comment/commentList",
                type: "get",
                data: { 'content_id' : content_id,
                    'menu_id' : menu_id,
                    'num' : num },
                error: function (xhr) {
                },
                success: function (data) {
                    var commentcount = data[0].commentcount;
                    let str = ""
                    $.each(data, function (index, element) {
                        str =str
                            + "<div class=\"commentBigBox\">"
                            + "<input type=\"hidden\" name=\"_id\" value=\'" + element._id + "\'>"
                            + "<div class=\"commentIcon\">"
                            + "<span class=\"material-icons-outlined\">"
                            + "android"
                            + "</span>"
                            + "</div>"
                            + "<div class=\"commentBox\">"
                            + "<span class=\"comWriter\">"
                            + "<input type=\"text\" name=\"comWriter\" value=\'" + element.name + "\'>"
                        if(element.name == "${user.username}" ) {
                            str=str
                                + "<button class=\"commentDelBtn\" onClick=\"fnDelClick(" + element._id + ")\" > 삭제 </button>"

                                + "<button class=\"commentEditBtn\" onClick=\"fnEditClick(" + element._id + ")\" > 수정 </button>"
                                + "</span>"
                        }
                        str=str
                            + "<span class=\"commentDate\">"
                            + "<input type=\"text\" name=\"commentDate\" value=\'" +element.time + "\'>"
                            + "</span>"
                            + "<div class=\"commentText\" id= \'" + element._id + "\' >"
                            + element.content
                            + "<br>"
                            + "</div>"
                            + "</div>"
                            + "</div>"


                    })
                    document.getElementById('commentListBox').innerHTML += str;
                    document.getElementById('count').textContent = commentcount;
                }
            });
        } //리스트조회
        //작성버튼
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
                        $("#commentListBox").empty();
                        fnCommentList();
                        $("#commContent").val('');
                        document.getElementById('countNum').innerHTML = '( 0/ 300)';
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
                    fnCommentList();
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
            updateform += "<button class=\"commentUpdateBtn\" onClick=\"fnCommentUpdate(" + _id + ")\"> 수정 </button>";
            updateform += "<button class=\"commentUpdateCancelBtn\" onClick= \"fnCommentUpdateCancel()\" > 취소 </button>";
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
                    fnCommentList();
                }
            })
        }
        function fnCommentUpdateCancel(){
            $("#commentListBox").empty();
            fnCommentList();
        }

    </script>

</head>
<body>
<div class="commentCount"> 댓글 <span id = "count"></span></div>

<div class="commentListBox" id="commentListBox">

</div>

<div class="center">
    <ul class="pagination">
        <li class="page-item">
            <c:if test="${page.prev}">
                <a href="/comment?content_id=${content_id}&menu_id=${menu_id}num=${page.startpagenum - 1}" class="page-link">이전</a>
                <span aria-hidden="true"></span>
                </a>
            </c:if>
        </li>
        <c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
            <c:if test="${select != num}">
                <li class="page-item"><a href="/communityList?num=${num}" class="page-link">${num}</a></li>
            </c:if>

            <c:if test="${select == num}">
                <li class="page-item active" aria-current="page">
                    <a class="page-link" href="#">${num}</a>
                </li>
            </c:if>
        </c:forEach>
        <c:if test="${page.next}">
            <li class="page-item">
                <a href="/communityList?num=${page.endpagenum + 1}" class="page-link">다음</a>
                <span aria-hidden="true"></span>
                </a>
            </li>
        </c:if>
    </ul>
</div>


<!--댓글 입력부 -->

<div class="commentInputBox">
    <%--            <form  action="/comment/writeComment" id="writecom1" method="post" >--%>
    <input type="hidden" id="commName" name="username" value="${user.username}">
    <%--            <input type="hidden" id="commCont_id" name="content_id" value="1">--%>
    <%--            <input type="hidden" id="commTime" name="time" value="">--%>
    <textarea class="commentInput" id="commContent" name="content" cols="80" rows="3" ></textarea>
    <div id="countNum">
        ( 0/ 300)
    </div>
    <div class="regBtn">
        <input type="submit" id= commentWriteButton value="등록">
    </div>
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

</body>

</html>