<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>받은 쪽지함</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<style>
		a { text-decoration-line: none; color: black; }
		.cc {
			width:200px;
			padding:0 10px;
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
			url  :  '/getsendnote?send=${user.username}&num=${num}'  ,
			data :  {
				_id : $('#_id').val() ,
				content : $('#content').val(),
				recept : $('#recept').val() ,
				time : $('#time').val() ,
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
						var recept = result[i].recept
						var time = result[i].time
						var readchk = result[i].readchk
						var chk = '[읽지않음]'
						if(readchk == 1){
							chk='[읽음]'
						}


						html         += "<tr>";
						html         += '<td></td>';
						if(readchk == 1){
							html         += '<td style="text-align: center; color:yellowgreen;" >[읽음]</td>';}
						else{
							html         += '<td style="text-align: center; color:gray;" >[읽지않음]</td>';}
						html         += '<td style="text-align: center; padding-left:60px;">';
						html         += '<div class="cc">';
						html         += '<a href ="/readsendNote?_id='+_id +'">'+ content +'</a>';
						html         += '</div></td>';
						html         += '<td style="width:170px; text-align: center;">'+ recept +'</td>';
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





	</script>
</head>
<body>


<section>
	<div id="main_content">
		<div id="message_box">
			<h3>
				보낸 쪽지함
			</h3>


			<div>

				<table class="table" >

					<thead class="table-light">
					<tr>
						<th></th>
						<th>읽음표시</th>
						<th>내용</th>
						<th>받는사람</th>
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
            <a href="/sendNote?send=${user.username}&num=${page.startpagenum - 1}" class="page-link">이전
            <span aria-hidden="true"></span>
            </a>
		  </c:if>
      </li>
      <c:forEach begin="${page.startpagenum}" end="${page.endpagenum}" var="num">
		  <c:if test="${select != num}">
          <li class="page-item">
            <a href="/sendNote?send=${user.username}&num=${num}" class="page-link">${num}</a>
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
            <a href="/sendNote?send=${user.username}&num=${page.endpagenum + 1}" class="page-link">다음
            <span aria-hidden="true"></span>
            </a>
        </li>
	  </c:if>
    </ul>
  </span>
				</div>

				<!-- 쪽지함 이동 버튼들 -->
				<ul class="buttons">
					<li><button class="btn btn-primary btn-sm" onclick="location.href='/receptNote?recept=${user.username}&num=1'">받은 쪽지함</button></li>
					<li><button class="btn btn-primary btn-sm" onclick="location.href='/writeNoteForm'">쪽지 보내기</button></li>
				</ul>
			</div>

		</div>
	</div>
</section>

</body>
</html>