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
    <link rel="stylesheet" type="text/css" href="css/comment.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
        console.log("ci"+${param.content_id});
        console.log("mi"+${param.menu_id});

        $(document).ready(function() {
            fnCommentList(i);
        });
        //리스트조회
        function fnCommentList(i) {
            if (i == 0 ){
                num = 1;
             }else{
                num = i;
            }
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
                    let startPageNum = data[0].startPageNum;
                    let select = data[0].num;
                    let endPageNum = data[0].endPageNum;
                    let num = data[0].num;
                    let prev = data[0].prev;
                    let commentCount = data[0].commentCount;
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
                                + "android"
                                + "</span>"
                                + " <br>"
                                + "<span class=\"commentDate\">"
                                + element.time
                                + "</span>"
                                + "</div>"
                                + "<div class=\"commentBox\">"
                                + "<span class=\"comWriter\">"
                                + "<input type=\"text\" name=\"comWriter\" value=\'" + element.name + "\'>"
                                + "</span>"
                            if(element.name == "${user.username}" ) {
                                str=str
                                    +"<span class=\"buttonSpan\">"
                                    + "<button class=\"commentDelBtn\" onClick=\"fnDelClick(" + element._id + ")\" > 삭제 </button>"

                                    + "<button class=\"commentEditBtn\" onClick=\"fnEditClick(" + element._id + ")\" > 수정 </button>"
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
                    //페이징
                    paging+="<a href=\"javascript:void(0)\"class=\"page-link\">이전</a>"
                          +"<span aria-hidden=\"true\"></span>"
                    for(let i=startPageNum; i<=endPageNum; i++){
                        paging +="<li class=\"page-item\"><a href=\"javascript:void(0)\" onClick=\"fnCommentList("+i+");\" return false; class=\"page-link\">"+i+"</a></li>"
                    }
                    paging+="<span aria-hidden=\"true\"></span>"
                          +"<a href=\"javascript:void(0)\"class=\"page-link\">다음</a>"
                    console.log(paging);
                    document.getElementById('count').textContent = commentCount;
                    document.getElementById('commentListBox').innerHTML += str;
                    document.getElementById('pagingBox').innerHTML += paging;
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
                        fnCommentList(i);
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
                    fnCommentList(1);
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
                    fnCommentList(i);
                }
            })
        }
        function fnCommentUpdateCancel(){
            $("#commentListBox").empty();
            fnCommentList(i);
        }

    </script>
<br>
</head>
<body>

<br>
<div class="commentCount"> 댓글 <span id = "count"></span></div>
<br>
<%--댓글리스트 출력부--%>
<ul class="list-group list-group-flush" id="commentListBox">

</ul>
<%--댓글페이징--%>
<div class="center">
    <ul class="pagination" id="pagingBox">

    </ul>
</div>



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

</body>

</html>