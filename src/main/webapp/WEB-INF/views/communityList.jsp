<%@ page import="com.green.vo.UserVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판</title>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <style>
        table             {margin:100px auto;}
        tr:nth-of-type(1) {width:100%; text-align:center;}
        td                {padding:3px}
        td:nth-of-type(1) {width:90px; text-align: center;}
        td:nth-of-type(2) {width:700px; text-align: left;}
        a                 { text-decoration-line: none; color: black; }
        .left             { text-align:left !important;}
        .center           { text-align:center !important;}
        .right            { text-align:right !important;}
        .layer            { text-align: center; }
        .layer .content   { display: inline-block; }
    </style>
    <script>
        let query = window.location.search;
        let params = new URLSearchParams(query);
        let num = params.get('num');
        console.log("dd"+num);
        if (num=="") {
            num = 1;
        }

        $(document).ready(function(){
            fnCommunityList();
        });

        function fnCommunityList() {
            $.ajax({
                url: "/getCommunityList",
                data: {"num" : num},
                dataType:"json",
                type: "get",
                error: function (xhr) {
                    console.log(xhr);
                    alert("실패");
                },
                success: function (data) {
                    let str = "";
                    str += "<table class=\"elist\" >"
                        + "<thead>"
                        + "<tr>"
                        + '<th scope="col">태그</th>'
                        + '<th scope="col">제목</th>'
                        + '<th scope="col">글쓴이</th>'
                        + '<th scope="col">날짜</th>'
                        + '<th scope="col">조회수</th>'
                        + "</tr>"
                        + "</thead>"
                        + '<tbody class="table-group-divider">'
                    $.each(data, function (index, element) {
                        str +=
                            "<table class=\"elist\" >"
                            +"<tr>"
                            +"<td> "+ element.tag +"</td>"
                            +"<td style=\'cursor:pointer\' onclick=\'communityRead(" + element._id +")\'> "+ element.title +" [ "+element.commentcount+"] </td>"
                            +"<td> "+ element.username +"</td>"
                            +"<td> "+ element.time + "</td>"
                            +"<td> "+ element.readcount +"</td>"
                            +"</tr>"
                            +"</table>"
                    })
                    console.log(str);
                    document.getElementById('articleListBox').innerHTML += str;
                }
            });
        }
        function communityRead(_id){
            const form = document.getElementById("listform");
            $('#_id').val(_id);
            form.submit();
        }
    </script>

</head>
<body style="background-color: white">

<div class="layer">
    <div class="btn-group layer" role="group" aria-label="Basic outlined example">
        <a  href="#" class="btn btn-outline-primary"> 인기글 </a>
        <a  href="/communityList" class="btn btn-outline-primary"> 자유게시판 </a>
        <a  href="#" class="btn btn-outline-primary">반려자랑 </a>
        <a  href="#" class="btn btn-outline-primary"> 질문게시판 </a>
    </div>
</div>


<form id = "listform" method="get" action="/communityRead">
    <input type="hidden" id="_id" name="_id">

    <table class="table" id="articleListBox" >
    </table>
    <a href="/communityWriteForm" class="btn btn-primary" style="float: right;">글쓰기</a>
    <br>
</form>

<div class="layer">
    <div class="content">
        <ul class="pagination">
            <li class="page-item">
                <c:if test="${page.prev}">
                    <a href="/communityList?num=${page.startpagenum - 1}" class="page-link">이전</a>
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
</div>
<div>
    <%--<%--%>
    <%--        //세션의 정보는 Object타입으로 저장되어있음--%>
    <%--        //다운 캐스팅 : 자식클래스의 변수 = (자식클래스 타입) 부모타입의 데이터--%>
    <%--        UserVo se = (UserVo) session.getAttribute("login");--%>
    <%--        out.print(se);--%>
    <%--    %>--%>
</div>
</body>

</html>