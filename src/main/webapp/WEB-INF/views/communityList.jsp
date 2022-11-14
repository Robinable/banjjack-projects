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
        // let query = window.location.search;
        // let param = new URLSearchParams(query);
        // let menuId = param.get('menu_id');
        $(document).ready(function(){
            fnCommunityList();
        });

        function fnCommunityList() {
            $.ajax({
                url: "/getCommunityList",
                type: "get",
                data: "data",
                dataType: "JSON",

                error: function (xhr) {
                },
                success: function (data) {

                    let str = "";
                    $.each(data, function (index, element) {

                        str +=

                            "<table class=\"elist\" >"
                            +"<tr>"
                            +"<td> \'"+ element._id + "\'</td>"
                            +"<td> \'"+ element.tag +"\'</td>"
                            +"<td style=\'cursor:pointer\' onclick=\'communityRead(" + element._id +")\'> \'"+ element.title +"\' </td>"
                            +"<td> \'"+ element.username +"\'</td>"
                            +"<td> \'"+ element.time + "\'</td>"
                            +"<td>\'"+ element.readcount +"\'</td>"
                            +"</tr>"
                            +"</table>"



                    })
                    document.getElementById('articleListBox').innerHTML += str;
                }
            });
        }
        function communityRead(_id){
            var form = document.getElementById("listform");
            $('#_id').val(_id);
            form.submit();
        }
    </script>
    <%@ include file="header.jsp"%>
</head>
<body>
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
<button id="communityWriteForm" onClick="location.href='communityWriteForm'"> 쓰기 </button>
</body>

</html>