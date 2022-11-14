<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<% String username = request.getParameter("username"); %>--%>
<%--<% String content_id = request.getParameter("_id"); %>--%>

<!DOCTYPE html>

<html>
<head>
    <title>on progress</title>
    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
          rel="stylesheet">

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
        let param = new URLSearchParams(query);
        let content_id = param.get('content_id');
        let num=param.get('num');
        console.log("ad"+content_id);
        console.log("ad"+num);
        // console.log("page"+page);
        // console.log("dp" + datapost);
        $(document).ready(function() {
            fnCommentList();
        });
        //리스트조회
        function fnCommentList(callback) {
            console.log()
            $.ajax({
                url: "comment/getCommentListPage",
                type: "get",
                data: {
                    "content_id" : content_id,
                    "num" : num
                },
                dataType:"json",
                error: function (xhr) {
                    alert("통신오류");
                },
                success: function (data) {
                    console.log(data);
                    if (callback){
                        callback(data.pageNum);
                        callback(data.displayPost);
                    }
                    let str = "";
                    $.each(data, function (index, element) {
                        // if(element.name==""){
                        //     return true;
                        // }
                        console.log(element.pagingNum);

                        str +=
                            "<div class=\"commentBigBox\">"
                            + "<input type=\"hidden\" name=\"_id\" value=\'" + element._id + "\'>"
                            + "<div class=\"commentIcon\">"
                            + "<span class=\"material-icons-outlined\">"
                            + "android"
                            + "</span>"
                            + "</div>"
                            + "<div class=\"commentBox\">"
                            + "<span class=\"comWriter\">"
                            + "<input type=\"text\" name=\"comWriter\" value=\'" + element.name + "\'>"

                            + "<button class=\"commentDelBtn\" onClick=\"fnDelClick(" + element._id + ")\" > 삭제 </button>"

                            + "<button class=\"commentEditBtn\" onClick=\"fnEditClick(" + element._id + ")\" > 수정 </button>"
                            + "</span>"
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
                }
            });
        } //리스트조회

        //작성버튼
        $(document).ready(function() {
            $('#commentWriteButton').click(function () {

                let commentWriteData =
                    {
                        username: $('#commName').val(),
                        content_id: content_id,
                        content: $('#commContent').val()
                    }

                $.ajax({
                    url: "/comment/writeComment",
                    type: "post",
                    data: commentWriteData,
                    error: function (xhr) {
                    },
                    success: function (commentWriteData) {
                        $("#commentListBox").empty();
                        fnCommentList();
                        $("#commContent").val('');
                    }
                });
            }); //등록버튼
        });

        //삭제버튼
        function fnDelClick(_id) {
            $.ajax({
                url: "/comment/deletecomment/",
                type: "post",
                data: {"_id" : _id},
                dataType: "json",
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
            updateform += "<input type=\"hidden\" id=\"updateCommName\" name=\"username\" value=\"1234\">";
            updateform += "<input type=\"hidden\" id=\"updateComm_id\" name=\"_id\" value= _id>";
            updateform += "<textarea id=\"updateCommentInput\" name=\"updateCommentContent\" cols=\"80\" rows=\"3\">";
            updateform += content.textContent
            updateform += "</textarea>";
            updateform += "<button class=\"commentUpdateBtn\" onClick=\"fnCommentUpdate(" + _id + ")\"> 수정 </button>";
            updateform += "<button class=\"commentUpdateCancelBtn\" onClick= \"fnCommentUpdateCancel()\" > 취소 </button>";
            document.getElementById(_id).innerHTML = updateform;
        }

        function fnCommentUpdate(_id) {
            let commentUpdateData =
                {
                    _id: _id,
                    username: $('#updateCommName').val(),
                    content: $('#updateCommentInput').val(),
                }
            $.ajax({
                url: "/comment/updatecomment/",
                type: "post",
                data: commentUpdateData,
                dataType: "json",
                error: function (xhr) {
                },
                success: function (data) {
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
<div class="commentCount"> 댓글 <span id = "count">${commentCount}</span></div>

<div class="commentListBox" id="commentListBox"></div>
<!--페이징-->

<div style="text-align: center;">
    <c:if test="${page.prev}">
        <span>[ <a href="/list?category=1&num=${page.startpagenum - 1}">이전</a> ]</span>
    </c:if>

    <c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
  <span>
   <c:if test="${select != num}">
       <a href="/commentListPage?content_id=${content_id}&num=${num}">${num}</a>
   </c:if>

     <c:if test="${select == num}">
         <b>${num}</b>
     </c:if>
 </span>
    </c:forEach>

    <c:if test="${page.next}">
        <span>[ <a href="/list?category=1&num=${page.endpagenum + 1}">다음</a> ]</span>
    </c:if>
</div>


<!--댓글 입력부 -->

<div class="commentInputBox">
    <%--            <form  action="/comment/writeComment" id="writecom1" method="post" >--%>
    <input type="hidden" id="commName" name="username" value="1234">
    <%--            <input type="hidden" id="commCont_id" name="content_id" value="1">--%>
    <%--            <input type="hidden" id="commTime" name="time" value="">--%>
    <textarea class="commentInput" id="commContent" name="content" cols="80" rows="3" ></textarea>
    <div class="countNum">
        ( 0/ 300)
    </div>
    <div class="regBtn">
        <input type="submit" id= commentWriteButton value="등록">
    </div>
    <%--            </form>--%>
</div>


<script>

    $('.commentInput').on('keyup', function() {
        $('.countNum').html("("+$(this).val().length+" / 300)");

        if($(this).val().length > 300) {
            $(this).val($(this).val().substring(0, 300));
            $('.countNum').html("(300 / 300)");
            alert("300자가 초과되었습니다")
        }
    });
</script>

</body>

</html>