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
        let content_id = param.get('_id');

        console.log(content_id);

        $(document).ready(function() {
            fnCommentList();
        });

            function fnCommentList() {
                $.ajax({
                    url: "/comment/commentList",
                    type: "get",
                    data: { 'content_id' : content_id},
                    error: function (xhr) {
                        console.log("error html = " + xhr.statusText);

                    },
                    success: function (data) {
                        console.log(data);


                        let str = "";
                        $.each(data, function (index, element) {

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

                            <%--str +=--%>
                            <%--    + '<div class="commentBox">' +'' +'</div>'--%>
                            <%--    + '<div class="commentIcon">' +'' +'</div>'--%>
                            <%--    + '<span class="comWirter">' + element.username + '</span>'--%>
                            <%--    + '<span class="commentdate">' + element.time + '</span>'--%>
                            <%--    + '<div class="commentText">' + element.content + '</div>';--%>

                            <%--&lt;%&ndash;if(element.username=="${}"){&ndash;%&gt;--%>
                            <%--&lt;%&ndash;    str=str+   '<button name="commentEdit" type="button" class="commentEdit" >수정</button>'&ndash;%&gt;--%>
                            <%--&lt;%&ndash;        +  '<button name="commentDel" type="button" class="commentDel" >삭제</button>';&ndash;%&gt;--%>
                            <%--&lt;%&ndash;}&ndash;%&gt;--%>
                            <%--str = str + '</div>'--%>
                            <%--    + '</div>';--%>
                        })
                        document.getElementById('commentListBox').innerHTML += str;
                    }
                });
            }

            $(document).ready(function() {
                $('#commentWriteButton').click(function () {

                    let commentWriteData =

                        {
                            username: $('#commName').val(),
                            content_id: content_id,
                            // time: $('#commTime').val(),
                            content: $('#commContent').val()
                        }

                    console.log(commentWriteData);


                    $.ajax({
                        url: "/comment/writeComment",
                        type: "post",
                        data: commentWriteData,
                        error: function (xhr) {
                            console.log("error html = " + xhr.statusText);
                            console.log("error");

                        },
                        success: function (commentWriteData) {
                            console.log(commentWriteData);
                            $("#commentListBox").empty();
                            fnCommentList();
                            $("#commContent").val('');
                        }
                    });


                }); //등록버튼
            });
        //삭제버튼
        function fnDelClick(_id) {
            console.log("aaaaaaaaaaaaaaaaaaaaaaaaaa")

            $.ajax({
                url: "/comment/deletecomment/",
                type: "post",
                data: {"_id" : _id},
                dataType: "json",

                error: function (xhr) {
                    console.log("data");
                    console.log("error html = " + xhr.statusText);
                    console.log("error");

                },
                success: function (result) {

                    $("#commentListBox").empty();
                    fnCommentList();
                }
            });
        }

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
            console.log("뿅");
            let commentUpdateData =

                {
                    _id: _id,
                    username: $('#updateCommName').val(),
                    content: $('#updateCommentInput').val(),

                }
            console.log(commentUpdateData);
            $.ajax({
                url: "/comment/updatecomment/",
                type: "post",
                data: commentUpdateData,
                dataType: "json",
                error: function (xhr) {

                    console.log("data"+deldata);
                    console.log("error html = " + xhr.statusText);
                    console.log("error");

                },
                success: function (data) {
                    console.log("data"+data);
                },
                success: function (data) {
                    // location
                    // $('#commentListBox').load()

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
        <div class="commentCount"> 댓글 <span id = "count">0</span></div>
    <!--댓글 리스트 -->
<%--            <input type="hidden" name="content_id" value= "1" >--%>
        <div class="commentListBox" id="commentListBox">
<%--            <div class="commentBigBox" >--%>
<%--                <input type="hidden" name="_id" value="1">--%>
<%--                <div class="commentIcon">--%>
<%--                    <span class="material-icons-outlined">--%>
<%--                        android--%>
<%--                    </span>--%>
<%--                </div>--%>
<%--                <div class="commentBox">--%>
<%--                    <span class="comWriter">--%>
<%--                            <input type="text" id="comWriter" name="comWriter" >--%>
<%--                    </span>--%>
<%--                        <!-- 버튼은 등록자 본인만 -->--%>

<%--                        <button class="delBtn" _id="" > 삭제 </button>--%>


<%--                        <button > 수정 </button>--%>

<%--                    <span class="commentDate">--%>
<%--                        <input type="text" name="commentDate">--%>
<%--                    </span>--%>
<%--                    <div class="commentText">--%>

<%--                        <br>--%>
<%--                    </div>--%>
<%--                </div>--%>


            </div>
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