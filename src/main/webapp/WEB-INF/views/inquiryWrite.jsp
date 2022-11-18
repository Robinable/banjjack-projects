<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <%@ include file="header.jsp"%>
  <title>1대1 문의</title>


  <style>

    h3{margin-top: 10px; padding: 5px; border-bottom: solid 2px #516e7f;font-size: 20px;}
    #main_content{width: 90%; height: 80%; margin: 0 auto;}
    li{list-style: none; margin-top: 10px; }
    #adminlist{margin-left: 300px; }
    #message_box {width: 800px; margin: 30px 150px; }


  </style>

  <script>

    var cnt = 0;
    $(function(){

      if('${user.role}' != 'ADMIN'){
        $('#adminlist').css('display','none');
      }

      $('#sub').on('click', function(e){

        if( $('[name=content]').val() == ''){
          alert('질문 내용을 입력하세요');
          e.preventDefault();
          e.stopPropagation();
        }
        if( $('[name=title]').val() == ''){
          alert('제목을 입력하세요');
          e.preventDefault();
          e.stopPropagation();
        }
        if ($('#category').val() == 0){
          alert('카테고리를 선택하세요');
          e.preventDefault();
          e.stopPropagation();
        }
      })

      $('form').on('submit', function(e){
        cnt ++;
        alert("1대1문의 보냄")
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
<div class="container">
  <section>
    <div id="main_content">
      <h3 id="write_title">1대1 문의</h3>
      <div id="message_box">
        <ul class="top_buttons">
          <a class="btn btn-primary" href='/inquirymylistForm?send=${user.username}'>내가 쓴 1대1 문의함</a>
          <a class="btn btn-primary" id='adminlist' href='/inquirylistForm?num=1' style="">받은 1대1 문의함(관리자용)</a>
        </ul>
        <form  action="/writeinquiry" method="post">
          <input type="hidden" name="send" value = "${user.username}">
          <input type="hidden" name="recept" value = "admin">
          <input type="hidden" name="bnum" value =  ${ bnum } />
          <input type="hidden" name="lvl"  value =  ${ lvl  } />
          <input type="hidden" name="step" value =  ${ step } />
          <div id="write_msg" class="mb-3">
            <ul>
              <li>
                <label for="exampleFormControlInput1" class="form-label">보내는 사람</label>
                <input type="text" class="form-control" name="send" id="exampleFormControlInput1" value="${user.username}" readonly>
              </li>

              <li>
                <label for="exampleFormControlInput2" class="form-label">받는 사람</label>
                <input type="text" class="form-control" id="exampleFormControlInput2" value="관리자" readonly>
              </li>

              <li>
                <label class="input-group-text" for="category">카테고리</label>
                <select class="form-select" id="category" name="category">
                  <option value="0" selected="selected">질문 카테고리를 선택 하세요.</option>
                  <option value="1">아이디 정보/보안</option>
                  <option value="2">이벤트</option>
                  <option value="3">기타</option>
                </select>
              </li>
              <li>
                <label for="exampleFormControlInput3" class="form-label">제목</label>
                <input type="text" class="form-control" name="title" id="exampleFormControlInput3" >

              </li>

              <li id="textarea">
                <label for="test" class="form-label">내용</label>
                <textarea class="form-control" name="content" id="test" rows="13" placeholder="300자 이내로 입력 가능" style="resize: none;"></textarea>
                <div id="test_cnt">(0 / 300)</div>
              </li>
            </ul>
            <input class="btn btn-primary" type="submit" id ="sub" value="보내기">

          </div>
        </form>
      </div>

    </div>

  </section>
</div>
<script>
  if('${user.role}' != 'ADMIN'){
    $('#adminlist').css('display','none');
  }
</script>
</body>
</html>