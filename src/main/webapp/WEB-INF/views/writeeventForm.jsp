<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>이벤트 작성</title>
  <%@ include file="header.jsp"%>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


    <style>

        a                 { text-decoration-line: none; color: black; }
        .left             { text-align:left !important;}
        .center           { text-align:center !important;}
        .right            { text-align:right !important;}
        .layer            { text-align: center; width:100%; }
        .layer .content   { display: inline-block; }
        textarea          {width:100%; height:400px; resize:none; border-radius: 8px;}
        input[type=text]  {border:1px solid; width:100%; height:30px; border-radius: 8px;}
        ul                { list-style: none; width:800px;}
        li                { margin:10px;}

    </style>

  <script>

   var cnt = 0;
    $(function(){

        	   $('#sub').on('click', function(e){

                  if( $('[name=content]').val() == ''){
                                  alert('내용을 입력하세요');
                      			  e.preventDefault();
                      			  e.stopPropagation();
                      		  }
                   if( $('[name=title]').val() == ''){
                                 alert('제목을 입력하세요');
                                  e.preventDefault();
                                  e.stopPropagation();
                              }
                })

                 $('form').on('submit', function(e){
                                  cnt ++;
                                  alert("이벤트 작성함")
                                  if(cnt>1){
                                  e.preventDefault();
                                  e.stopPropagation();
                                  }
                           })

        	 });


    $(document).ready(function() {
      $('#test').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 300)");

        if($(this).val().length > 300) {
          $(this).val($(this).val().substring(0, 300));
          $('#test_cnt').html("(300 / 300)");
          alert("300자 이내로 입력 가능")
        }

      });
    });

  </script>

</head>
<body>
<section>

  <div id="main_content" class="layer">


      <form  action="/writeevent" method="post">
      <input type="hidden" name="writer"  value=${user.username} />

        <div class="content">
          <ul class="content">
            <h3 class="left">이벤트 작성</h3>
            <li class="left">
              <span>작성자 : </span>
              <span style="bottom-line: 1px;">${user.username}</span>
            </li>
            <li class="left">
              <span>시작일 : <input type="date" name="start_time">&nbsp</span>
              <span>종료일 : <input type="date" name="end_time" ></span>
            </li>

            <li class="left">
              <span><input type="text" name="title" placeholder="제목"></span>
            </li>

            <li class="left">
              <span class="col2"><textarea id="test" name="content"  placeholder="300자 이내로 입력 가능"></textarea><div id="test_cnt"></div>
                                    </span>
            </li>
            <li class="right">
              <input type="submit" value="이벤트 작성" class="btn btn-primary">
              <a href='/eventlistform' class="btn btn-primary">이벤트 목록</a>
            </li>
          </ul>



        </div>
      </form>
    </div>




</section>

</body>
</html>