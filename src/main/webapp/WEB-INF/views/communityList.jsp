<%@ page import="com.green.vo.UserVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판</title>

    <style>
        table.elist {width: 690px; border:1px solid black;}
        td {border:1px solid black;}
        div.articleList {margin: 100px; border:1px solid black;}
    </style>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
                    $.each(data, function (index, element) {
                        str +=
                            "<table class=\"elist\" >"
                            +"<tr>"
                            +"<td> "+ element._id + "</td>"
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
    <%@ include file="header.jsp"%>
</head>
<body style="background-color: white">
<form id = "listform" method="get" action="/communityRead">
    <input type="hidden" id="_id" name="_id">
    <div class="articleList " id="articleListBox">
        <table class="elist" >
            <tr>
                <td>  _id  </td>
                <td>  tag  </td>
                <td>  title  </td>
                <td>  username </td>
                <td>  time  </td>
                <td>  readcount</td>
            </tr>
        </table>

    </div>
</form>

<div class="center">
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
<div>
    <%--<%--%>
    <%--        //세션의 정보는 Object타입으로 저장되어있음--%>
    <%--        //다운 캐스팅 : 자식클래스의 변수 = (자식클래스 타입) 부모타입의 데이터--%>
    <%--        UserVo se = (UserVo) session.getAttribute("login");--%>
    <%--        out.print(se);--%>
    <%--    %>--%>
</div>
<button id="communityWriteForm" onClick="location.href='communityWriteForm'" > 쓰기 </button>
</body>

</html>